return {
    {
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup()

            -- Document existing key chains
            require('which-key').add {
                { '<leader>c', group = '[C]ode' },
                { '<leader>d', group = '[D]ocument' },
                { '<leader>r', group = '[R]ename' },
                { '<leader>h', group = '[H]arpoon' },
                { '<leader>s', group = '[S]earch' },
                { '<leader>w', group = '[W]orkspace' },
                { '<leader>sp', group = '[S]earch [P]athogen'}
            }
        end,
    },
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"html",
				"lua",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ -- Colors highlighting for rgb and hexcolors
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons",  "letieu/harpoon-lualine", },
        config = function()
            local pwd = function ()
                local dir = vim.fn.expand('%:p:h')
                if dir:find('^/home/zeta') then
                    dir = dir:gsub('^/home/zeta', '~')
                end
                local path_parts = {}
                for part in dir:gmatch('[^/]+') do
                    table.insert(path_parts, part)
                end

                local result = ""
                if #path_parts > 3 then
                    result = ".../" .. table.concat(path_parts, "/", #path_parts - 1)
                else
                    result = dir
                end

                return result
            end
            require("lualine").setup({
                options = {
                    theme = "gruber-darker",
					icons_enabled = true,
					component_separators = { left = "/", right = "\\" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename", "harpoon2", --[["branch",  "diagnostics"]] },
					lualine_c = { pwd },
					lualine_x = { --[["fileformat",]] "filetype" },
					lualine_y = { "progress", "diff" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {"filename", "filetype"},
					lualine_b = {},
					lualine_c = { "mode"},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		dependencies = { "folke/noice.nvim" },
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss All Notifications",
			},
		},
		opts = {
			stages = "static",
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
	},
}
