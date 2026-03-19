vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  image = {
    enabled = true,
    doc = {
      inline = true,
      float = true,
    },
  },
  picker = {
    layout = {
      preset = "vscode",
    },
    sources = {
      files = {
        hidden = true,
      },
    },
  },
  dashboard = {
    width = 60,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
    preset = {
      pick = nil,
      header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    },
    sections = {
      { section = "header" },
      { section = "startup" },
    },
  },
})

-- Keymaps
vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files({ hidden = true })
end)
vim.keymap.set("n", "<C-f>", function()
  Snacks.picker.lines()
end)
vim.keymap.set("n", "<C-l>", function()
  Snacks.picker.grep()
end)
vim.keymap.set("n", "<C-b>", function()
  Snacks.picker.buffers()
end)
vim.keymap.set("n", "<C-f-h>", function()
  Snacks.picker.help()
end)
vim.keymap.set("n", "gr", function()
  Snacks.picker.lsp_references()
end)
vim.keymap.set({ "n", "x" }, "<C-y>", function()
  Snacks.picker.yanky()
end, { desc = "Open Yank History" })
vim.keymap.set("n", "<C-o>", function()
  local items = {}
  for _, ws in ipairs(require("workspaces").get()) do
    table.insert(items, { text = ws.name, path = ws.path })
  end
  Snacks.picker({
    title = "Workspaces",
    items = items,
    format = function(item)
      return { { item.text } }
    end,
    confirm = function(picker, item)
      picker:close()
      if item then
        require("workspaces").open(item.text)
      end
    end,
  })
end)
