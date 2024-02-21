
syntax enable
set background=dark

colorscheme desert
set relativenumber
set cursorline

" Set JetBrains Nerd Font Mono as the default font
" set guifont = "SauceCodePro Nerd Font Mono:h11"

set incsearch
set hlsearch

"""""""""""""" my keybinding """"""""""""""""""
" Leader key
let mapleader = "\<Space>"

" Copy to system clipboard
vnoremap <Leader>y "+y

" Paste from system clipboard
nnoremap <Leader>p "+p

" reload vim with the new configuration
nnoremap <Space>feR :source $MYVIMRC<CR>

" save file
nnoremap <Space>fs :w<CR>

" open configuration file
nnoremap <Space>fed :e ~/.vimrc<CR>

" delete current buffer
nnoremap <Space>bd :bdelete<CR>

" list of buffers
nnoremap <Space>bb :ls<CR>

" next buffer
nnoremap <Space>bn :bnext<CR>

" previous buffer
nnoremap <Space>bp :bprevious<CR>

" open file
nnoremap <Space>ff :e<Space>

" recent opened files

"quit vim
nnoremap <Space>wd :q<CR>
"
nnoremap <Space>qq :qa<CR>

" split vim window
nnoremap <Space>wv :vsplit<CR>
nnoremap <Space>ws :split<CR>


"""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4      " Sets the width of a tab to four spaces
set shiftwidth=4   " Sets the number of spaces to use for each level of indentation
set expandtab      " Converts tabs to spaces

au bufnewfile,bufRead bashconfig set filetype=sh

set guioptions-=T

set confirm
set showmode
set showcmd

set visualbell
set wildmenu
set autowriteall

" Automatically wrap text that extends beyond the screen length
set wrap

" Encoding
set encoding=utf-8

" Remap ESC to ii
:imap ii <Esc>

" Always show statusline
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
