return {
	{ -- Emacs like compilation mode
		"ej-shafran/compile-mode.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim", tag = "v1.3.0" },
		},
		config = function()
			local cm = require("compile-mode")
			vim.keymap.set("n", "<leader>cn", cm.compile)
			vim.keymap.set("n", "<leader>cr", cm.recompile)
		end,
	},
	{
		"MunifTanjim/nui.nvim",
	},
}
