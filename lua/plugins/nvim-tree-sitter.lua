return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup {
			ensure_installed = {
				"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "python",
				"html", "css", "nix", "ocaml", "regex", "sql", "cpp", "bash", "json", "typescript",
				"yaml", "zig", "ziggy", "ziggy_schema"
			},
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 1000 * 1024 -- 1000 KB
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize or "rust" == lang then
						return true
					end
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
