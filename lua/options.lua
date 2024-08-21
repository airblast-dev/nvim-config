vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = buffer,
	callback = function()
		vim.lsp.buf.format { async = false }
	end
})

vim.g.autoformat = true
vim.opt.number = true
