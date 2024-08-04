return {
    { -- Autocompletion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    },
                },
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "delphinus/cmp-ctags",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },

                mapping = cmp.mapping.preset.insert({
                    -- Select the [n]ext item
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    -- Select the [p]revious item
                    ["<C-p>"] = cmp.mapping.select_prev_item(),

                    -- Scroll the documentation window [b]ack / [f]orward
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),

                    --    ['<C-y>'] = cmp.mapping.confirm { select = true },

                    ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-i>"] = cmp.mapping.confirm({ select = true }),
                    -- Manually trigger a completion from nvim-cmp.
                    ["<C-Space>"] = cmp.mapping.complete({}),

                    -- Think of <c-l> as moving to the right of your snippet expansion.
                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    -- {
                    --     name = "ctags",
                    --     option = {
                    --         executable = "/home/zeta/Cloner/uctags/ctags"
                    --     }
                    -- },
                    { name = "nvim_lsp" },
                    -- { name = "luasnip" },
                    { name = "path" },
                },
            })
        end,
    },
    { -- Autoformat
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            formatters_by_ft = {
                lua = { "stylua" },
                json = { "jq"}
            },
        },
    },
    { -- Emacs like comple mode
        "ej-shafran/compile-mode.nvim",
        branch = "latest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- if you want to enable coloring of ANSI escape codes in
            -- compilation output, add:
            "m00qek/baleia.nvim",
        },
        config = function ()
            require('compile-mode').setup({
                ask_about_save = false,
                default_command = "",
                baleia_setup = true,
            })
            vim.keymap.set('n', '<leader>cm', ':Compile<CR>')
            vim.keymap.set('n', '<leader>cM', ':Recompile<CR>')
        end
    },
    { -- Emacs like dired mode file manager
        "X3eRo0/dired.nvim",
        dependencies = { "MunifTanjim/nui.nvim" }, 
        config = function()
            require("dired").setup {
                path_separator = "/",
                show_banner = true,
                show_icons = false,
                show_hidden = true,
                show_dot_dirs = true,
                show_colors = true,
            }
            vim.keymap.set("n", "<leader>dm", function ()
                vim.cmd(':Dired')
            end, { desc = "[D]ired [M]ode" } )
        end
    },
    { -- Magit in neovim git manager client
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true
    }
}
