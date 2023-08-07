-- Relative line numbers
vim.wo.relativenumber = true
-- Remove automatic comments on new lines
vim.cmd('autocmd BufEnter * set formatoptions-=r formatoptions-=c formatoptions-=o title')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=r formatoptions-=c formatoptions-=o title')
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

vim.filetype.add({
    pattern = {
        ['.*blade.php'] = 'blade'
    }
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
    },
    filetype = "blade"
}

local bladeFiletype = vim.api.nvim_create_augroup("BladeFiltypeRelated", {})
--   au BufNewFile,BufRead *.blade.php set ft=blade
vim.api.nvim_create_autocmd(
    {"BufNewFile","BufRead"},
    {
        pattern = '*.blade',
        callback = function ()
            vim.opt.ft = 'blade'
        end,
        group = bladeFiletype
    }
)

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

require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets/snipmate"})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/lua"})


cmp.setup({
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    sources = {
        -- {name = 'nvim_lsp'},
        -- {name = 'luasnip'},
        -- {name = 'cmp_luasnip'},
        -- {name = 'path'},
        {name = 'nvim_lsp'},
        -- {name = 'buffer', keyword_length = 3},
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
