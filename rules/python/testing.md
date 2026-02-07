## Testing

### Test Types and the Testing Pyramid

We aim for a healthy testing pyramid.
Many fast unit tests to fixate behavior and cover edge cases.
Fewer integration tests to ensure the system is wired up correctly.

#### Unit Test

- Many in number, focused in scope.
- Database objects and all external dependencies, e.g. database, http calls, are mocked.
- Used to cover small units of code like functions, ranging from publicly accessible to private helpers.

When you refactor code or change behavior these tests **must** break else they are adding no value.

```python
def test_calculate_donation_fee():
    assert calculate_fee(amount=100, rate=0.03) == 3

@patch('services.email.send_email')
def test_donation_confirmation_triggers_email(mock_send):
    donation_service.confirm(donation_id=123)
    mock_send.assert_called_once()

def test_is_due_with_unfinished_donation_returns_false():
    mock_donation = Mock()
    mock_donation.is_unfinished = True
    assert not _is_due(mock_donation)
```

#### Integration Tests

- Fewer in number, broader in scope.
- Use real database and API layer. Mock external dependencies (payment gateways, email services, third-party APIs).
- Used to verify components work together correctly through the full backend stack.
- For each feature, one happy path and one error case typically suffice.

When behavior changes some of them **may** break.

When refactoring these test **must** be stable and ensure your refactor work is safe.

```python
@pytest.mark.django_db
def test_create_donation_via_api(api_client):
    response = api_client.post('/donations/', {'amount': 100})
    assert response.status_code == 201
    assert Donation.objects.filter(id=response.data['id']).exists()
```

### Test Style

Use `pytest` for all new tests with plain `assert` statements.

```python
def test_donation_amount_raises_on_negative_value():
    with pytest.raises(ValidationError):
        validate_donation_amount(-10)

def test_fundraiser_full_name_concatenates_names(fundraiser):
    assert fundraiser.full_name == "John Doe"
```

Only use `django.test.TestCase` when you need `setUpTestData` to share expensive database objects across multiple tests.

```python
class DonationTestCase(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.customer = CustomerFactory()  # Created once per class
```

### One Test, One Behavior

Each test should verify exactly one thing. If you're testing multiple behaviors, split into separate tests.

```python
# Good - focused
def test_create_donation__with_valid_data_succeeds():
def test_create_donation__with_negative_amount_raises_validation_error():

# Avoid - generic, unclear what's being tested
def test_donation_creation():
def test_edge_cases():
```

Test names should follow: `test_<action>__<expected_result>` or `test_<action>__with_<precondition>_<expected_result>` when context matters.

### Test Organization

Tests live in a `tests/` directory within each app, mirroring the module structure:

- `services/donation.py` → `tests/test_donation_service.py`
- `apis/views.py` → `tests/test_views.py`

Avoid test class inheritance. Prefer fixtures or parametrization.

### Minimal Test Data

Only set factory fields that are required for specific behavior or being directly asserted. Everything else uses defaults.

```python
# Good - clear what's being tested
donation = DonationFactory(academic_title="Dr.")
assert donation.study_degree == "PhD"

# Avoid - noise obscures intent
donation = DonationFactory(
    academic_title="Dr.",
    amount=100,
    currency="EUR",
    donor_name="John Doe",
    # ... many unrelated fields
)
```

### Parametrize over Duplication

Use `@pytest.mark.parametrize` for testing the same behavior with different inputs.

```python
@pytest.mark.parametrize(
    "academic_title, expected_code",
    [
        (AcademicTitleChoice.DR, "1"),
        (AcademicTitleChoice.PROF, "2"),
        (AcademicTitleChoice.PROF_DR, "3"),
    ],
)
def test_academic_title_mapping(academic_title, expected_code):
    donation = DonationFactory(academic_title=academic_title)
    result = transform_donation(donation)
    assert result["StudyDegree"] == expected_code
```

If using Django `TestCase` where parametrize isn't available, use `with self.subTest(...):` sparingly.

### Assertions

Use plain `assert` statements. Add custom messages only when the failure wouldn't be obvious.

```python
assert donation.status == DonationStatus.PENDING

# With context when helpful
assert response.status_code == status_code, f"Request failed due to: {response.content}"
```
