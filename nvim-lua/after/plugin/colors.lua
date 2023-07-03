require('rose-pine').setup({ 
    disable_background = true
})
function ColorMyPencils(color)  
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

  vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none", fg = "#31748f"})
  vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none", fg = "#f6c177"})
  vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { bg = "none", fg = "#c4a7e7"})
  vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none", fg = "#eb6f92" })
  vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { bg = "none", fg = "#c4a7e7"})

  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none" })

  vim.api.nvim_set_hl(0, "TabLine", { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none", fg = "white" })
end

ColorMyPencils()
