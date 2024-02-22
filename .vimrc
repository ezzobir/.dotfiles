
syntax enable
set background=dark

colorscheme desert
" set number relativenumber
set cursorline

" Set JetBrains Nerd Font Mono as the default font
set guifont=jetbrainsmononl\ 14

" Set increasing search 
set incsearch

" Highlight search
set hlsearch

"""""""""""""" my keybinding """"""""""""""""""
" Leader key
let mapleader = "\<Space>"

" Open command window
nnoremap <Leader><Leader> :<C-f>

" Open command window
nnoremap <Space><Space> :<C-f>

" Copy to system clipboard
vnoremap <Leader>y "+y

" Paste from system clipboard
nnoremap <Leader>p "+p

" reload vim with the new configuration
nnoremap <Leader>feR :source $MYVIMRC<CR>

" save file
nnoremap <Leader>fs :w<CR>

" save all files
nnoremap <Leader>fS :wa<CR>

" open configuration file
nnoremap <Leader>fed :e ~/.vimrc<CR>

" delete current buffer
nnoremap <Leader>bd :bdelete<CR>

" list of buffers
nnoremap <Leader>bb :ls<CR>

" next buffer
nnoremap <Leader>bn :bnext<CR>

" previous buffer
nnoremap <Leader>bp :bprevious<CR>

" kill all buffers except the buffer am in
"nnoremap <Leader>bdo :1,9bd<Bar>bfirst<CR> " check it

" open file
nnoremap <Leader>ff :e<Space>

" recent opened files
" i will add it soon

" toggle number and relative number
nnoremap <Leader>tnr :call ToggleNumbers()<CR>
function! ToggleNumbers()
  if &relativenumber == 0
    set relativenumber
    set number
  else
    set norelativenumber
    set nonumber
  endif
endfunction

" delete current window
nnoremap <Leader>wd :q<CR>

" split vim window
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>ws :split<CR>

" resize the window
nnoremap <Leader>wi :res+1<CR>
nnoremap <Leader>wo :res-1<CR>

" quit vim
nnoremap <Leader>qq :qa<CR>


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
