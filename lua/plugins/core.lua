return {
    {
        "no-clown-fiesta/no-clown-fiesta.nvim",
        config = function ()
            require("no-clown-fiesta").setup({
                transparent = true;
            })
        end
    },
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
