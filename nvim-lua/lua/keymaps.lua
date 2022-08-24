function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-t>", ":NvimTreeToggle<CR><C-w>l")
map("n", "<C-f>", ":NvimTreeFindFile<CR>")
