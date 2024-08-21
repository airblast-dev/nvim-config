local on_attach = require("../lib/on_attach").on_attach

return {
	'saecki/crates.nvim',
	event = { "BufRead Cargo.toml" },
	config = function()
		require("crates").setup {
			lsp = {
				enabled = true,
				on_attach = on_attach,
				actions = true,
				completion = true,
				hover = true,
			},
		}
	end,
}
