local colorscheme = "neon"

local is_colorschem_avaiable = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not is_colorschem_avaiable then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
    return
end

