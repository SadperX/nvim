return {
    { -- Comment and Uncomment lines with gcc keybind in normal mode or gc in visual mode
        "numToStr/Comment.nvim",
        lazy = false,
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
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function ()
            local hp = require('harpoon')
            hp:setup({})
            vim.keymap.set('n', '<leader>ha', function() hp:list():add() end)

            vim.keymap.set('n', '<leader>h1', function() hp:list():select(1) end)
            vim.keymap.set('n', '<leader>h2', function() hp:list():select(2) end)
            vim.keymap.set('n', '<leader>h3', function() hp:list():select(3) end)
            vim.keymap.set('n', '<leader>h4', function() hp:list():select(4) end)

            vim.keymap.set('n', '<C-S-P>', function() hp:list():next() end)
            vim.keymap.set('n', '<C-S-N>', function() hp:list():prev(4) end)

            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>sb", function() toggle_telescope(hp:list()) end,
                { desc = "Open harpoon window" })

        end
    }
}
