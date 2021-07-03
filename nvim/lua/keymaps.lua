local map = vim.api.nvim_set_keymap
local function noremap(mode, keymap, command)
  map(mode, keymap, command, { noremap = true })
end

noremap('v', '.', ':norm.<CR>')
map('', '<C-s>', '<esc>:w<CR>', {})
map('i', '<C-s>', '<esc>:w<CR>', {})

map('n', '<leader>tn', ':TestNearest<CR>', {})
map('n', '<leader>tf', ':TestFile<CR>', {})
map('n', '<leader>tt', ':TestSuite<CR>', {})
map('n', '<leader>tl', ':TestLast<CR>', {})
map('n', '<leader>tv', ':TestVisit<CR>', {})
