vim.g._startuptime = vim.uv.hrtime()

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local dt = (vim.uv.hrtime() - vim.g._startuptime) / 1e6
    vim.g._startuptime_ms = math.floor(dt * 100 + 0.5) / 100
  end,
})

require("config")
