-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Create an event handler for the FileType autocommand
vim.api.nvim_create_autocmd('FileType', {
	-- This handler will fire when the buffer's 'filetype' is "python"
	pattern = 'html',
	callback = function(args)
		vim.lsp.start({
			name = 'trunkls',
			cmd = { 'trunkls' },
		})
	end,
})
