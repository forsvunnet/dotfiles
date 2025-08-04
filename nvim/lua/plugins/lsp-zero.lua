return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = function()

            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            -- LSP zero
            lsp_zero.setup_servers( {
                'clojure_lsp',
                'gopls',
                'lua_ls',
                'rust_analyzer',
                'intelephense',
                'eslint'
            })

            lsp_zero.setup()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'clojure_lsp'},
                    {name = 'cmp_luasnip'},
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'buffer', keyword_length = 3},
                    {name = 'luasnip',  option = { 
                        show_autosnippets = true,
                        use_show_condition = false
                    }},
                },
                mapping = {
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({select = true}),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),

                    -- Navigate between snippet placeholder
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    {
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'},
}
