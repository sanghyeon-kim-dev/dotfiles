vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },
  },
  formatters = {
    stylua = {
      prepend_args = { "--indent-type", "Spaces" },
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("conform").format({ async = false, lsp_fallback = true })
  end,
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })
