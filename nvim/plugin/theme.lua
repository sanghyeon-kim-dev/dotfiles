vim.pack.add({ "https://github.com/projekt0n/github-nvim-theme" })
require("github-theme").setup({})
vim.cmd.colorscheme("github_dark_dimmed")

-- Match Ghostty's bright black so zsh-autosuggestions are visible in toggleterm
vim.g.terminal_color_8 = "#636e7b"
