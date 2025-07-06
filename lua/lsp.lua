local lsps = {
	'lua_ls',
	'clangd',
	'bacon_ls',
	'omnisharp',
	'ruff',
	'cmake',
}

vim.lsp.enable(lsps)
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_set_option_value('omnifunc', 'lua.vim.lsp.omnifunc', { ['buf'] = bufnr })

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, add_desc(bufopts, "Goto Declaration"))
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, add_desc(bufopts, "Goto Definition"))
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, add_desc(bufopts, "Hover"))
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, add_desc(bufopts, "Add Workspace Folder"))
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
		add_desc(bufopts, "Remove Workspace Folder"))
	vim.keymap.set('n', '<space>wl', function()
		vim.lsp.buf.list_workspace_folders()
	end, add_desc(bufopts, "List Workspace Folders"))
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, add_desc(bufopts, "Type Definition"))
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, add_desc(bufopts, "Rename Item"))
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, add_desc(bufopts, "Code Action"))
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, add_desc(bufopts, "List References"))
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, add_desc(bufopts, "Format File"))
end

vim.lsp.on_attach = on_attach
