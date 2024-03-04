return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "java", "rust", "html", "css", "go"},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	}
}
