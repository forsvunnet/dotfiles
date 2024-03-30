-- Relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Conceal level (for Obsidian, etc..)
vim.opt.conceallevel = 1

-- Remove automatic comments on new lines
vim.cmd('autocmd BufEnter * set formatoptions-=r formatoptions-=c formatoptions-=o title')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=r formatoptions-=c formatoptions-=o title')


require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets/snipmate"})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/lua"})



vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.timeoutlen = 500
-- vim.opt.listchars = '>-'
-- vim.opt.trail = 'x'
require'lspconfig'.svelte.setup{}
--
-- Note:
-- Rust/Cargo located at: %USERPROFILE%\.cargo\bin
-- 
