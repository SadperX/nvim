return {
    { -- Comment and Uncomment lines with gcc keybind in normal mode or gc in visual mode
        "numToStr/Comment.nvim",
    },
    { -- Mini plugins
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.ai").setup()
            require("mini.pairs").setup()
            require("mini.surround").setup()
        end,
    },
    { -- Better word motions
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
    { -- Navigate throght list buffers
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function ()
            local hp = require('harpoon')
            hp:setup({})
            vim.keymap.set('n', '<leader>ha', function() hp:list():add() end , { desc = "[H]arpoon [A]dd buffer"})
            vim.keymap.set('n', '<leader>hl', function() hp.ui:toggle_quick_menu(hp:list()) end, { desc = "[H]arpoon [L]ist"})

            vim.keymap.set('n', '<leader>h1', function() hp:list():select(1) end, { desc = "[H]arpoon 1 buffer"})
            vim.keymap.set('n', '<leader>h2', function() hp:list():select(2) end, { desc = "[H]arpoon 2 buffer"})
            vim.keymap.set('n', '<leader>h3', function() hp:list():select(3) end, { desc = "[H]arpoon 3 buffer"})
            vim.keymap.set('n', '<leader>h4', function() hp:list():select(4) end, { desc = "[H]arpoon 4 buffer"})

            vim.keymap.set('n', '<C-h-p>', function() hp:list():next() end)
            vim.keymap.set('n', '<C-h-n>', function() hp:list():prev() end)


        end
    },
    { -- Better kebinds in command mode
        "delphinus/emcl.nvim",
        config = function ()
            require("emcl").setup({})
        end,
    }
}
