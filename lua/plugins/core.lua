return {
    { 
        "blazkowolf/gruber-darker.nvim",
        config = function ()
            require("gruber-darker").setup({
                italic = {
                    strings = false
                },
            })
            vim.cmd('colorscheme gruber-darker')
        end,
    },
    {
        "xiyaowong/transparent.nvim"
    },
}
