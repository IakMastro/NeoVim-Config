vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

local set_global_variable = vim.api.nvim_set_var
local keymap = function(mode, lhs, rhs)
    local opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

local command = vim.api.nvim_command 

-- Set Space as leader key
keymap('', '<Space>', '<Nop>')
set_global_variable('mapleader', ' ')
set_global_variable('maplocalleader', ' ')

-- Window navigation 
keymap('n', '<S-Left>', '<C-w>h')
keymap('n', '<S-Up>', '<C-w>j')
keymap('n', '<S-Down>', '<C-w>k')
keymap('n', '<S-Right>', '<C-w>l')

-- Window resize
keymap('n', '<C-Up>', function()
    command('resize -2')
end)

keymap('n', '<C-Down>', function()
    command('resize +2')
end)

keymap('n', '<C-Left>', function()
    command('vertical resize -2')
end)

keymap('n', '<C-Right>', function()
    command('vertical resize +2')
end)

-- Navigate buffers
keymap('n', '<C-l>', function()
    command('bnext')
end)
keymap('n', '<C-h>', function()
    command('bprevious')
end)
