require("plugins")

vim.g.mapleader = ' '

require("tokyonight").setup({
    style = "moon",
    transparent = true,
    styles = {
        sidebars = "transparent"
    }
})

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { "node_modules" }
    }
}

vim.cmd("colorscheme tokyonight")

vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require("mylsp")
require("mytelescope")
require("nvimtree")
require("keymaps")
require("lualine").setup()
