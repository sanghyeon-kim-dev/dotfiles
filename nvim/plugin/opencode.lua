vim.pack.add({ "https://github.com/nickjvandyke/opencode.nvim" })

-- Required for opencode reload functionality
vim.o.autoread = true

-- Keymaps
vim.keymap.set({ "n", "x" }, "<C-a>", function()
	require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode about current context" })

vim.keymap.set({ "n", "x" }, "<C-x>", function()
	require("opencode").select()
end, { desc = "Open opencode prompt menu" })

vim.keymap.set({ "n", "t" }, "<C-.>", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode terminal" })
