vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end, {})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {noremap = true, silent = true})
