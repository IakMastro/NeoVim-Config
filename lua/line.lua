local status_ok, line = pcall(require, "lualine")
if not status_ok then
    return
end

line.setup{
    options = {
        theme = 'auto'
    }
}
