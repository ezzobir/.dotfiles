
set background=dark

set number relativenumber
set cursorline

" Set increasing search 
set incsearch

" Highlight search
set hlsearch

" Show matching brackets  
set showmatch

" Set JetBrains Nerd Font Mono as the default font
set guifont=jetbrainsmononl\ 14

" disable toolbar in gvim
set guioptions-=T

" notimeout
set timeoutlen=500

" to make Vim’s yank, delete, and change operations copy into both + and *, and make the put operations paste from +.
set clipboard=unnamed,unnamedplus

" disable scroll bar in gvim 
" set guioptions-=b

"""""""""""""" my keybinding """"""""""""""""""
" Leader key
let mapleader = "\<Space>"

" whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Open command window
nnoremap <Leader><Leader> :<C-f>

" reload vim with the new configuration
nnoremap <silent> <Leader>feR :source $MYVIMRC<CR>

" save file
nnoremap <silent> <Leader>fs :w<CR>

" save all files
nnoremap <silent> <Leader>fS :wa<CR>

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

" Always show statusline
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""" vim plugins """"""""""""""""""""""
call plug#begin()

" vim theme
Plug 'ghifarit53/tokyonight-vim'

" lightline
Plug 'itchyny/lightline.vim'

" vimtex
Plug 'lervag/vimtex'

" start screen
Plug 'mhinz/vim-startify'

" comment things
Plug 'tpope/vim-commentary'

" surround
Plug 'tpope/vim-surround'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nerdtree
Plug 'preservim/nerdtree'

" for colored parentheses
Plug 'luochen1990/rainbow'

" which key
Plug 'liuchengxu/vim-which-key'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tokyonight theme
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 1

colorscheme tokyonight


" lightline theme
let g:lightline = {'colorscheme' : 'tokyonight'}

" enable syntax highlighting
syntax enable

" rainbow plugin
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" which key configs
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }


filetype plugin indent on
"""""""""""""""""""""""""""""vimtex-configuration"""""""""""""""""""""""""""""""""""""""
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

