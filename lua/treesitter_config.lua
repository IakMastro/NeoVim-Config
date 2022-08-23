local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then 
  return
end

configs.setup {
    ensure_installed = { 
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
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false
    },
}
