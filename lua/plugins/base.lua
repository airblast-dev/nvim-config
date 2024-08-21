local on_attach = require("../lib/on_attach").on_attach

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.pylsp.setup({
				on_attach = on_attach,
			})
			lspconfig.lua_ls.setup({
				on_attach = on_attach
			})
		end
	},
}
