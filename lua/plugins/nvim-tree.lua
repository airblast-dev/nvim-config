return {
	"nvim-tree/nvim-tree.lua",
	opts = {},
	config = function()
		require("nvim-tree").setup({})
		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<space>t", api.tree.toggle, { desc = "Toggle File Tree" })
	end,
	lazy = false,
}
