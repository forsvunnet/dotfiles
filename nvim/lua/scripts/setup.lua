-- Relative line numbers
vim.wo.relativenumber = true

-- Darcula
vim.cmd.colorscheme('darcula')

-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "rust", "php", "javascript", "typescript", "json" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}

-- LSP zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed( {
    'lua_ls',
    'rust_analyzer',
    'intelephense',
    'eslint'
})

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
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

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.timeoutlen = 500
-- vim.opt.listchars = '>-'
-- vim.opt.trail = 'x'

--
-- Note:
-- Rust/Cargo located at: %USERPROFILE%\.cargo\bin
-- 
