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
			lspconfig.bacon_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					updateOnSave = true,
					updateOnSaveWaitMillis = 1000,
				}
			})
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
			lspconfig.clangd.setup {
				cmd = {
					-- see clangd --help-hidden
					"clangd",
					"--background-index",
					-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
					-- to add more checks, create .clang-tidy file in the root directory
					-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
					"--clang-tidy",
					"--completion-style=bundled",
					"--cross-file-rename",
					"--header-insertion=iwyu",
				},
				on_attach = on_attach,
				capabilities = capabilities,
				-- TODO: figure out what is this
				init_options = {
					clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
					usePlaceholders = true,
					completeUnimported = true,
					semanticHighlighting = true,
				},
				--------cmd = {
				--------	"/home/airblast/.espressif/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clangd",
				--------	"--background-index",
				--------	"--query-driver=/home/airblast/Documents/pico_kb/pico-sdk/"
				--------},
				--------root_dir = function()
				--------	-- leave empty to stop nvim from cd'ing into ~/ due to global .clangd file
				--------end
			}
			lspconfig.gdscript.setup {
				on_attach = on_attach,
				capabilities = capabilities,
			}
			lspconfig.css_variables.setup{on_attach = on_attach, capabilities = capabilities}
			vim.lsp.enable('omnisharp')
		end
	},
}
