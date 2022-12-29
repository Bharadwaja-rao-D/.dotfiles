function OneNordColor()
    require('onenord').setup({
        theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        borders = true, -- Split window borders
        fade_nc = false, -- Fade non-current windows, making them more distinguishable
        disable = {
            background = true, -- Disable setting the background color
            eob_lines = true, -- Hide the end-of-buffer lines
        },
    })

end

function ColorIt()
    local color = "tokyonight"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

OneNordColor()

