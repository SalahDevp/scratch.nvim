# Scratch

**Scratch** is a Neovim plugin that lets you create temporary scratch buffers to write and evaluate code snippets without saving them to a file. Inspired by Emacs scratch buffers, this plugin provides a seamless way to test code in different languages without cluttering your workspace with temporary files.

## Features

- Open a scratch buffer
- Automatically sets the scratch buffer content to the selected text if in visual mode
- Evaluate the code in the scratch buffer
- Automatically detect the language based on the active buffer or manually specify it.

## Installation & Configuration

**Note**: This plugin is language-independent. You need to manually configure the `run_cmd` for each language, which should read code from `stdin` and execute it.

- example using [lazy](https://github.com/folke/lazy.nvim)

```lua
{
  "SalahDevp/scratch.nvim",
  config = function()
    local scratch = require("scratch")

    scratch.setup({
      languages = {
        lua = {
          run_cmd = "lua",
        },
        python = {
          run_cmd = "python3",
        },
      },
    })

    vim.keymap.set("n", "<leader>bs", "<cmd>Scratch buf<cr>")
    vim.keymap.set("n", "<leader>be", "<cmd>Scratch eval<cr>")
  end,
}
```

## Commands

- `:Scratch buf [language]` Opens a scratch buffer for the specified language or uses the language of the active buffer if not specified.
- `:Scratch eval` runs the code in the scratch buffer

## Feature Ideas

Here are some features that I could add, or feel free to contribute them via a pull request:

- Possibility to configure boilerplate code for specific languages (e.g., adding a main function when creating a `C` scratch buffer).
- Open the buffer in a new split/tab.

## License

This plugin is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contributing

Contributions are welcome! If you'd like to suggest a feature or report a bug, please open an issue or submit a pull request. For major changes, please open an issue first to discuss what you would like to change.
