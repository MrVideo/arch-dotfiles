return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			actions = {
				open_file = {
					quit_on_open = true
				},
			},
			filters = {
				dotfiles = false,
			},
			git = {
				ignore = false,
			},
		},
	}
}
