return {
	{ -- Comment and Uncomment lines with gcc keybind in normal mode or gc in visual mode
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			window = {
				margin = { 0, 0, 0, 0 },
				padding = { 0, 0, 0, 0 },
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 40 },
				spacing = 0,
				align = "center",
			},
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["gs"] = { name = "+surround" },
				["z"] = { name = "+fold" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>gh"] = { name = "+hunks" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>u"] = { name = "+ui" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = {
			{
				"e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "o", "x" },
			},
			{
				"w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "o", "x" },
			},
			{
				"b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "o", "x" },
			},
		},
	},
}
