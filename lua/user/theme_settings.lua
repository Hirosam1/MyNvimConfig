local table = {}
function table.set(colorscheme_name)
    vim.cmd.colorscheme(colorscheme_name)
end

return table
