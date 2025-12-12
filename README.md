# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Project Specific Configuration

Add a `.lazy.lua` file to the root of you project.

```lua
-- .lazy.lua

return {
  -- add any plugins you want to use for this project here
  -- e.g. to set the colorscheme for this project:
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
```
