local map = vim.api.nvim_set_keymap
local function noremap(mode, keymap, command)
  map(mode, keymap, command, { noremap = true })
end

noremap('v', '.', ':norm.<CR>')
map('', '<C-s>', '<esc>:w<CR>', {})
map('i', '<C-s>', '<esc>:w<CR>', {})
map('i', '<C-c>', '<esc>', {})
map('n', '<leader>v', ':e ~/dotfiles/nvim/<CR>', {})
map('n', '<leader>nh', ':nohls<CR>', {})

map('n', '<leader>ut', ':UndotreeToggle<cr>', {})
map('n', '<leader>at', ':ALEToggle<cr>', {})
map('', '<leader>nt', ':NvimTreeToggle<cr>', {})
map('', '<leader>nf', ':NvimTreeFindFile<cr>', {})
map('', '<leader>nr', ':NvimTreeRefresh<cr>', {})

noremap('n', '<leader>gt', ':A<CR>')

-- vim test
map('n', '<leader>tn', ':TestNearest<CR>', {})
map('n', '<leader>tf', ':TestFile<CR>', {})
map('n', '<leader>tt', ':TestSuite<CR>', {})
map('n', '<leader>tl', ':TestLast<CR>', {})
map('n', '<leader>tv', ':TestVisit<CR>', {})

-- lspconfig
noremap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

-- telescope
map('', '<leader>b', '<cmd>Telescope buffers<cr>', {})
map('', '<C-P>', "<cmd>lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', '--iglob', '!.git'} }<CR>", {})
map('', '<leader>rg', '<cmd>Telescope live_grep<cr>', {})
