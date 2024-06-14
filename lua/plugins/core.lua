return {
	{
		"blazkowolf/gruber-darker.nvim", -- Gruber darker color-scheme
		config = function()
			require("gruber-darker").setup({
				bold = false,
				italic = {
					strings = false,
					comments = false,
				},
				underline = false,
			})
		end,
	},
    {
        "ellisonleao/gruvbox.nvim",
    },
	{
		"rebelot/kanagawa.nvim", -- Kanagawa color-scheme
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruber-darker",
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			level = 3,
			render = "minimal",
			stages = "static",
		},
	},
}
