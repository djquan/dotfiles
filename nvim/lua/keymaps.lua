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
map('', '<leader>nt', ':NERDTreeToggle<cr>', {})
map('', '<leader>nf', ':NERDTreeFind<cr>', {})
map('', '<leader>nf', ':NERDTree<cr>', {})

noremap('n', '<leader>gt', ':A<CR>')

-- vim test
map('n', '<leader>tn', ':TestNearest<CR>', {})
map('n', '<leader>tf', ':TestFile<CR>', {})
map('n', '<leader>tt', ':TestSuite<CR>', {})
map('n', '<leader>tl', ':TestLast<CR>', {})
map('n', '<leader>tv', ':TestVisit<CR>', {})

-- lspsaga
noremap('n', 'gh', ':Lspsaga lsp_finder<CR>')
noremap('n', '<leader>ca', ':Lspsaga code_action<CR>')
noremap('v', '<leader>ca', '<C-U>Lspsaga range_code_action<CR>')
noremap('n', 'K', ':Lspsaga hover_doc<CR>')
noremap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
noremap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
noremap('n', 'gs', ':Lspsaga signature_help<CR>')
noremap('n', 'gr', ':Lspsaga rename<CR>')
noremap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>')
noremap('n', '<leader>cc', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
noremap('n', '[e', ':Lspsaga diagnostic_jump_next<CR>')
noremap('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>')

-- Dash
noremap('n', '<leader>h', ':Dash<CR>')

-- lspconfig
noremap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

-- telescope
map('', '<leader>b', '<cmd>Telescope buffers<cr>', {})
map('', '<C-P>', "<cmd>lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', '--iglob', '!.git'} }<CR>", {})
map('', '<leader>rg', '<cmd>Telescope live_grep<cr>', {})
