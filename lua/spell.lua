local status_ok, spell = pcall(require, 'spellsitter')
if not status_ok then
    return 
end

spell.setup{
    highlight = {
        enable = true
    }
}
