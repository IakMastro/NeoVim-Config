local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- Toggle nvim-tree
map('n', 'n', [[:NvimTreeToggle]], {})

-- Toggle more plugins
map('n', 'l', [[:IndentLinesToggle]], {})
map('n', 'l', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files]], {})

