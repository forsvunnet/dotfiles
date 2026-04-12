return {
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local servers = {
                'clojure_lsp',
                'gopls',
                'lua_ls',
                'rust_analyzer',
                'intelephense',
                'eslint'
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local bufnr = args.buf
                    local opts = { buffer = bufnr }
                    vim.keymap.set('n', 'K',   vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd',  vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go',  vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gr',  vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gs',  vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gl',  vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', '[d',  vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', ']d',  vim.diagnostic.goto_next, opts)
                end
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    {name = 'nvim_lsp'},
                    {name = 'path'},
                    {name = 'buffer', keyword_length = 3},
                    {name = 'luasnip', option = {
                        show_autosnippets = true,
                        use_show_condition = false
                    }},
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then luasnip.jump(1)
                        else fallback() end
                    end, {'i', 's'}),
                    ['<C-b>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then luasnip.jump(-1)
                        else fallback() end
                    end, {'i', 's'}),
                }
            })
        end
    },
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
