return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<C-p>", function() Snacks.picker.files({ hidden = true }) end },
    { "<C-f>", function() Snacks.picker.lines() end },
    { "<C-l>", function() Snacks.picker.grep() end },
    { "<C-b>", function() Snacks.picker.buffers() end },
    { "<C-f-h>", function() Snacks.picker.help() end },
    { "gr", function() Snacks.picker.lsp_references() end },
    { "<C-y>", function() Snacks.picker.yank_history() end },
    { "<C-o>", function()
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
    end },
  },
  ---@type snacks.Config
  opts = {
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
    ---@class snacks.dashboard.Config
    ---@field enabled? boolean
    ---@field sections snacks.dashboard.Section
    ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
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
  },
}
