return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup({})

    vim.cmd.colorscheme("github_dark_dimmed")

    -- Match Ghostty's bright black so zsh-autosuggestions are visible in toggleterm
    vim.g.terminal_color_8 = "#636e7b"
  end,
}
