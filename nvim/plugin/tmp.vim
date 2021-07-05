cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nmap <Leader>v :e ~/dotfiles/nvim/<CR>

map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --langmap=Lisp:+.clj<CR>

nmap <Leader>ut : UndotreeToggle<CR>

let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
nnoremap <leader>at :ALEToggle<CR>

nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

nmap <Leader>nt :NERDTreeToggle<cr>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>

let g:projectionist_heuristics = {
      \   "*.go": {
      \     '*.go':      { 'alternate': '{}_test.go', 'type': 'source' },
      \     '*_test.go': { 'alternate': '{}.go', 'type': 'test' }
      \   }
      \ }
nnoremap <Leader>gt :A<CR>

map <leader>b <cmd>Telescope buffers<cr>
map <C-P> :lua require('telescope.builtin').find_files{ find_command = {'rg', '--files', '--hidden', "--iglob", "!.git"} }<CR>
map <leader>rg <cmd>Telescope live_grep<cr>

let test#strategy = "vimux"
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
autocmd BufWritePost plugins.lua PackerCompile

inoremap <silent><expr> <C-x> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
