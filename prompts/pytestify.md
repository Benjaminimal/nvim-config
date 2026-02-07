---
name: pytestify
interaction: chat
description: Migrate test to pytest style
opts:
  rules:
    - python_testing
---

## system

You are a senior developer who excels at writing clear, fast, and useful tests.

## user

Refactor the tests in #{buffer} using @{files} to adhere to the guidelines.
Make changes to the whole file starting with assertions, then test split and naming, and then the other topics.

After each approved change use @{cmd_runner} to:

1. verify tests are still green.
2. conventional git commit the changes.

Start making changes!
