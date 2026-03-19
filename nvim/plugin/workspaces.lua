vim.pack.add({ "https://github.com/natecraddock/workspaces.nvim" })

require("workspaces").setup({
  workspaces = {
    {
      name = "nvim",
      path = "~/.config/nvim",
    },
    {
      name = "project",
      path = "~/project",
    },
  },
  sort = false,
  hooks = {
    open = function()
      Snacks.picker.files({ hidden = true })
    end,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd([[WorkspacesSyncDir]])
  end,
})
