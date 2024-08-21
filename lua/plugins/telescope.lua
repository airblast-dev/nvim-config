return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>g", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" }
	}
}
