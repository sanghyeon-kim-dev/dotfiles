vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "typescript",
    "javascript",
    "html",
    "css",
    "tsx",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
