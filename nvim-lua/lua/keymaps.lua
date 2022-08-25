function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-t>", ":NvimTreeToggle<CR>")
map("n", "<C-f>", ":NvimTreeFindFile<CR>")

map("n", "<leader>h", "<C-w>h<CR>")
map("n", "<leader>l", "<C-w>l<CR>")
map("n", "<leader>j", "<C-w>j<CR>")
map("n", "<leader>k", "<C-w>k<CR>")

map("n", "<leader>fs", ":Telescope grep_string<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fl", ":Telescope live_grep<CR>")
