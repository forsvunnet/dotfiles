vim.keymap.set('n', '<Esc>]', '>>')
vim.keymap.set('v', '<Esc>]', '>gv')
vim.keymap.set('n', '<Esc>[', '<<')
vim.keymap.set('v', '<Esc>[', '<gv')

vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>')

-- Ex = ExplorDTreeFocus
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Nvim Tree
vim.keymap.set("n", "<leader>n", '<cmd>NvimTreeFindFile<CR>') -- Find file
-- vim.keymap.set("n", "<leader>n", '<cmd>NvimTreeToggle<CR>')

--# Made a php shortcut in order to fix indentation. Later learned
--# that the indentation problem came from treesitter 🤦
-- vim.keymap.set( "n", "<leader>php", function()
--     vim.o.ft = 'html'
--     vim.o.syn = 'php'
-- end)

-- Space + = will reindent the entire file
vim.keymap.set("n", "<leader>=", "gg=G''")
vim.keymap.set("n", "<localleader>=", ":!cljfmt fix %<CR>:e!<CR>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {}) -- Find files

vim.keymap.set('n', '<C-p>', function() -- Git files
    builtin.git_files({cwd = vim.fn.getcwd()}, {use_git_root=false})
end)
vim.keymap.set('n', '<C-f>', function() -- Grep string
    builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
vim.keymap.set("n", "<leader>a", builtin.buffers) -- Mark file

-- Harpoon
local mark = require('harpoon.mark');
local ui = require('harpoon.ui');
vim.keymap.set("n", "<leader>m", mark.add_file) -- Mark file
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu) -- Toggle files
vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end) -- File 1
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end) -- File 2
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end) -- File 3

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- Toggle undo tree

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "<leader>r",   vim.lsp.buf.rename, opts)           -- Rename
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts) -- Workspace symbol
        vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float, opts)    -- Diagnostic float
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)      -- Code action
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)       -- References
        vim.keymap.set("i", "<C-h>",       vim.lsp.buf.signature_help, opts)   -- Signature help
    end
})

-- Flash
vim.keymap.set("n", "s", function() -- Jump
    require("flash").jump()
end)
vim.keymap.set("n", "S", function() -- Treesitter
    require("flash").treesitter()
end)

--# Define the keymap function
local function skipKey(key)
    return function ()
        local line = vim.fn.getline('.')
        local text_after_cursor = line:sub(vim.fn.col('.'))

        if text_after_cursor:match('^%' .. key) then
            local current_pos = vim.fn.getcurpos()
            current_pos[3] = current_pos[3] + 1
            vim.fn.setpos('.', current_pos)
        else
            vim.api.nvim_feedkeys(key, 'n', true)
        end
    end
end


vim.keymap.set('i', '<A-s>', '<Esc>:w<Enter>a')
vim.keymap.set('n', '<A-s>', ':w<Enter>')

--# Set the keymap in insert mode
-- vim.keymap.set( 'i', ')', skipKey(')') , { silent = true })
-- vim.keymap.set( 'i', '"', skipKey('"') , { silent = true })
-- vim.keymap.set( 'i', ']', skipKey(']') , { silent = true })
-- vim.keymap.set( 'i', ';', skipKey(';') , { silent = true })
-- vim.keymap.set( 'i', '}', skipKey('}') , { silent = true })

local function isVendorDirectoryPresent(current_dir, recursion_limit)
    -- Check if the "vendor" directory exists in the current directory
    local vendor_dir = current_dir .. '/vendor'
    local stat = vim.loop.fs_stat(vendor_dir)
    if stat and stat.type == 'directory' then
        return vendor_dir
    end

    -- If not found and recursion limit is not reached, move to the parent directory and try again
    if recursion_limit > 0 then
        local parent_dir = vim.fn.fnamemodify(current_dir, ":h")
        if parent_dir ~= current_dir then -- Check if it's not the root directory
            return isVendorDirectoryPresent(parent_dir, recursion_limit - 1)
        end
    end

    return false
end

local function hasUnsavedModifications()
    local current_buffer = vim.api.nvim_get_current_buf()
    local modified = vim.api.nvim_buf_get_option(current_buffer, 'modified')
    return modified
end

vim.keymap.set( 'n', '<leader>i', function () -- Run php CS fixer on current file
    if hasUnsavedModifications() then
        local choice = vim.fn.input("Save changes before continuing? (y/n): ")
        if choice:lower() == 'y' then
            vim.cmd('w') -- Save the changes
        end
    end
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.expand('%:h')
    -- local result = vim.fn.system("echo " .. current_file)
    local vendor_dir = isVendorDirectoryPresent(current_dir, 7)

    if not vendor_dir then
        print('The "vendor" directory does not exist.')
        return
    end
    print('The "vendor" directory exists.')

    vim.print("test " .. vendor_dir )
    local pint_path = vendor_dir .. '/laravel/pint/builds/pint'
    local stat = vim.loop.fs_stat(pint_path)
    if stat and stat.type == 'file' then
        local result = vim.fn.system('/opt/homebrew/bin/php ' .. pint_path .. ' ' .. current_file)
        vim.print('/opt/homebrew/bin/php ' .. pint_path .. ' ' .. current_file)
        vim.cmd('e!')
    else
        vim.print('Could not detect pint')
    end
end
    , { silent = true }
)


-- Clojure / Conjure config

-- Disable the documentation mapping
vim.g["conjure#mapping#doc_word"] = false

-- Rebind it from K to <prefix>gk
vim.g["conjure#mapping#doc_word"] = "gk"

-- Reset it to the default unprefixed K (note the special table wrapped syntax)
vim.g["conjure#mapping#doc_word"] = {"K"}
