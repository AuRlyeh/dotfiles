" Plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'neovim/nvim-lspconfig'
    Plug 'machakann/vim-sandwich'
    Plug 'yangmillstheory/vim-snipe'
    Plug 'itchyny/lightline.vim'
    Plug 'jez/vim-superman'
    Plug 'tpope/vim-fugitive'
call plug#end()
augroup filetype_csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END
lua require('lspconfig').pyright.setup{}
" share clipboard with X
set clipboard+=unnamedplus
" no swap file
set noswapfile
" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
" set line number
set number
" use 4 spaces instead of tab
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Hide buffer
set hidden
" Keymap
nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr>;buffer next
nnoremap <leader>tn gt;new tab
nnoremap <leader>x :Bdelete<cr>;new tab
