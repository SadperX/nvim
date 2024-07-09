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
}
