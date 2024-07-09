return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",

				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "brookhong/telescope-pathogen.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- [[ Configure Telescope ]]
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                    ["pathogen"] = {
                        attach_mappings = function(map, actions)
                            map("i", "<C-o>", actions.proceed_with_parent_dir)
                            map("i", "<C-l>", actions.revert_back_last_dir)
                            map("i", "<C-b>", actions.change_working_directory)
                            map("i", "<C-g>g", actions.grep_in_result)
                            map("i", "<C-g>i", actions.invert_grep_in_result)
                        end,
                        -- remove below if you want to enable it
                        use_last_search_for_live_grep = false,
                        -- quick_buffer_characters = "asdfgqwertzxcvb",
                        prompt_prefix_length = 0
                    }
                },
            })

            -- Enable Telescope extensions if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "pathogen")

			local builtin = require("telescope.builtin")
            local exten = require("telescope").extensions

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

            -- Pathogen kemaps
            vim.keymap.set("n", "<leader>spd",
                function ()
                    exten.pathogen.pathogen({})
                end ,
                { desc = "[S]earch [P]athogen [F]iles" })

            vim.keymap.set("n", "<leader>spf", exten.pathogen.find_files, { desc = "[S]earch [P]athogen [F]iles" })
            vim.keymap.set("n", "<leader>spw", exten.pathogen.grep_string, { desc = "[S]earch [P]athogen current [W]ord" })
            vim.keymap.set("n", "<leader>spg", exten.pathogen.live_grep, { desc = "[S]earch [P]athogen by [G]rep" })
            vim.keymap.set("n", "<leader>spl", exten.pathogen.grep_in_files, { desc = "[S]earch [P]athogen grep in [L]ist" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
