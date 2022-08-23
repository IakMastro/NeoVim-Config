vim.g.mapleader = ','
vim.g.localleader = '\\'

require('vars')
require('opts')
require('keys')
require('plug')
require('lsp_config')
require('treesitter_config')

-- PLUGINS
require('nvim-tree').setup{}
require('lualine').setup{
    options = {
        theme = 'auto'
    }
}
require('nvim-autopairs').setup{}

require('which-key').setup{}

require('spellsitter').setup{
    highlight = {
        enable = true
    }
}

vim.cmd[[colorscheme tokyodark]]
