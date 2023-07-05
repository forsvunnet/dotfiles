-- Custom
--  Set leader to space " "
vim.g.mapleader = " "

-- Ex = Explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Made a php shortcut in order to fix indentation. Later learned
-- that the indentation problem came from treesitter 🤦
-- vim.keymap.set( "n", "<leader>php", function()
--     vim.o.ft = 'html'
--     vim.o.syn = 'php'
-- end)

-- Space + = will reindent the entire file
vim.keymap.set("n", "<leader>=", "gg=G''")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', function()
    builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

-- Harpoon
local mark = require('harpoon.mark');
local ui = require('harpoon.ui');
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- LSP
local lsp = require("lsp-zero")
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Flash
vim.keymap.set("n", "s", function()
    require("flash").jump()
end)
vim.keymap.set("n", "S", function()
    require("flash").treesitter()
end)

-- to use this, make sure to set `opts.modes.char.enabled = false`
-- vim.opts.modes.char.enabled = false
-- local Config = require("flash.config")
-- local Char = require("flash.plugins.char")
-- for _, motion in ipairs({ "f", "t", "F", "T" }) do
--     vim.keymap.set({ "n", "x", "o" }, motion, function()
--         require("flash").jump(Config.get({
--             mode = "char",
--             search = {
--                 mode = Char.mode(motion),
--                 max_length = 1,
--             },
--         }, Char.motions[motion]))
--     end)
-- end
