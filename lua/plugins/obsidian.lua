return {
    {

        "epwalsh/obsidian.nvim",
            version = "*",  -- recommended, use latest release instead of latest commit
                lazy = true,
            event = {
                -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
                    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
                "BufReadPre /home/zeta/Documents/Prep-Vault/**.md",
                "BufNewFile /home/zeta/Documents/Prep-Vault/**.md",
            },
            opts = {
                workspaces = {
                    {
                        name = "Prep",
                        path = "/home/zeta/Documents/Prep-Vault/",
                    },
                },
            },
    },
}
