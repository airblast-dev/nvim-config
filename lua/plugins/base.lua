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
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local lspconfig = require("lspconfig")
			lspconfig.pylsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.htmx.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.css_variables.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.cssls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					css = {
						validate = false,
					}
				}
			}
			lspconfig.tailwindcss.setup {
				on_attach = on_attach,
				capabilities = capabilities,
			}
			lspconfig.jsonls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
			}
		end
	},
}
