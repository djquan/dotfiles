set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua require('plugins')
autocmd BufWritePost plugins.lua PackerCompile
