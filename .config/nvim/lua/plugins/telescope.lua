return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				'<leader>ff',
				function()
					require('telescope.builtin').find_files()
				end
			},
			{
				'<leader>fg',
				function()
					require('telescope.builtin').live_grep()
				end
			},
			{
				'<leader>fb',
				function()
					require('telescope.builtin').buffers()
				end
			},
			{
				'<leader>fh',
				function()
					require('telescope.builtin').help_tags()
				end
			},
		},
		config = function ()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
				},
				pickers = {
					live_grep = {
						additional_args = function ()
							return { "--hidden", "--no-ignore" }
						end
					},
					find_files = {
						hidden = true,
						no_ignore = true,
						no_ignore_parent = true
					}
				}
			})
		end
	}
}
