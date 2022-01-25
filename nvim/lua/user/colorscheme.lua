local colorscheme = "sonokai"

local is_colorschem_avaiable = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not is_colorschem_avaiable then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
    return
end

vim.g.sonokai_style = "default" -- default, atlantis, andromeda, shusia, maia, espresso
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_menu_selection_background = "green"
vim.g.sonokai_diagnostic_text_highlight = 1
pcall(vim.cmd, "colorscheme " .. colorscheme)
