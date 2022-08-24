local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

vim.cmd('let g:loaded_perl_provider = 0')

local servers = {
    "javascript", 
    "typescript", 
    "dockerfile", 
    "yaml", 
    "python", 
    "go", 
    "json", 
    "jsdoc", 
    "bash", 
    "python",
    "scss",
    "html",
    "sql",
    "markdown"
}

local settings = {
    ensure_installed = servers,
    automatic_installation = true,
    ui = {
        icons = {
            -- server_installed = "◍",
            -- server_pending = "◍",
            -- server_uninstalled = "◍",
            -- server_installed = "✓",
            -- server_pending = "➜",
            -- server_uninstalled = "✗",
        },
        keymaps = {
            toggle_server_expand = '<CR>',
            install_server = 'i',
            update_server = 'u',
            check_server_version = 'c',
            update_all_servers = 'U',
            check_outdated_servers = 'C',
            uninstall_server = 'X',
        },
    },

    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

lsp_installer.setup(settings) -- Register a handler that will be called for all installed servers.

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
    return
end

local on_attach = require('lsp.lsp-config').on_attach
local capabilities = require('lsp.lsp-config').capabilities

lspconfig['sumneko_lua'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use', 'require', 'pcall', 'pairs' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                },
            },
        },
    },
    picker = 'telescope',
})

lspconfig['pyright'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'basic',
            },
        },
    }
})



-- lspconfig['clangd'].setup{}
