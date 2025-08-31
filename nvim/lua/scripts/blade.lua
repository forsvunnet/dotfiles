vim.filetype.add({
    pattern = {
        ['.*blade.php'] = 'blade'
    }
})


local bladeFiletype = vim.api.nvim_create_augroup("BladeFiltypeRelated", {})
--   au BufNewFile,BufRead *.blade.php set ft=blade
-- vim.api.nvim_create_autocmd(
--     {"BufNewFile","BufRead"},
--     {
--         pattern = '*.blade',
--         callback = function ()
--             vim.opt.ft = 'blade'
--         end,
--         group = bladeFiletype
--     }
-- )
