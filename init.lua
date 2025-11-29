require("lsp")
require("config.lazy")
require("config.keymaps")
require("config.opts")

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c', 'cpp', 'lua' },
	callback = function() vim.treesitter.start() end,
})
