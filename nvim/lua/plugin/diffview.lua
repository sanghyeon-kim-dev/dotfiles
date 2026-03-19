return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen --staged<cr>", desc = "Staged diff" },
    { "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "Git diff" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
  },
  opts = {},
}
