
" Basic configuration settings
" -----------------------------------------------
set nocompatible			          " use vim and not vi
filetype plugin on		          " load file-specific plugins
filetype indent on		          " load file-specific indentation
filetype on				              " enable filetype detection
set encoding=utf-8
set background=dark
set wrap linebreak              " wrap long lines and break lines at words
set number relativenumber       " shows line numbers
set cursorline                  " highlight current line
set ruler	  			              " shows cursor position in current line
set showcmd				              " shows partially typed commands
set nohlsearch				          " don't  highlight search results
set incsearch				            " jump to search results as search string is being typed
set noshowmode                    " disable in favor of lightline.vim's statusline
set nofoldenable                " don't fold text by default when opening files
set autowriteall                " write current buffer when moving buffers
set showmatch                   " Show matching brackets  
" set visualbell
set wildmenu
set laststatus=2
set confirm
let mapleader = "\<Space>"
syntax enable                   " enable syntax highlighting
" ------------------------------------------------


" Font Settings
"--------------------------------------
" set guifont=jetbrainsmononl\ 14
set guifont=Iosevka:14
"--------------------------------------

" Gvim settings
"--------------------------------------
" default value is guioptions=aegimrLtT
set guioptions-=T " disable tooltip bar in gvim
set guioptions-=r " disable scrollbar in gvim
set guioptions-=m " disable menu in gvim
"--------------------------------------

" notimeout
"--------------------------------------
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"--------------------------------------

set tabstop=4      " Sets the width of a tab to four spaces
set shiftwidth=4   " Sets the number of spaces to use for each level of indentation
set expandtab      " Converts tabs to spaces
"--------------------------------------


if (has("termguicolors"))
  " Force true color; see https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
  if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif


" OS detection
" ---------------------------------------------
if !exists("g:os_current")
  if system('uname -s') == "Linux\n"
    let g:os_current = "Linux"
  elseif system('uname -s') == "Darwin\n"
    let g:os_current = "Darwin"
  else
    echom "Error: the current operating system won't support all of my Vim configurations."
    let g:os_current = "Other"
  endif
endif
" ---------------------------------------------

" Set Python provider
" ---------------------------------------------
if g:os_current == "Linux"
  let g:python3_host_prog = '/usr/bin/python3'
elseif g:os_current == "Darwin"
  let g:python3_host_prog = '/usr/local/bin/python3'
else
endif
" ---------------------------------------------

" Specify plugins using Vim-Plug
" ---------------------------------------------
call plug#begin('~/.vim/plugged')
" Global
Plug 'junegunn/vim-plug'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'blazkowolf/gruber-darker.nvim'
" Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'luochen1990/rainbow'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'preservim/nerdtree'
" Plug 'ycm-core/YouCompleteMe'


" Filetype-specific
Plug 'chrisbra/csv.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'

call plug#end()
" ---------------------------------------------

" colorscheme
" ---------------------------------------------
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" " let g:tokyonight_transparent_background = 1
" colorscheme tokyonight
colorscheme gruber-darker
" ---------------------------------------------


" BEGIN COPY-PASTE COMMANDS
" ---------------------------------------------
if g:os_current == "Linux"
  set clipboard=unnamed,unnamedplus
elseif g:os_current == "Darwin"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Make Y work like D or C (not vi compatible)
noremap Y y$

" stop cc, x, and s from overwriting default register
"nnoremap cc "_cc
"nnoremap x "_x
"nnoremap s "_s
" ---------------------------------------------
" END COPY-PASTE COMMANDS


" BEGIN NAVIGATION
" ---------------------------------------------
" useful for jumping to end of nested snippets
" the silly jump to the line start via ^ is a hack to ensure cursor exits a possible UltiSnips snippet scope
inoremap <C-L> <ESC>^$a

" mappings for navigating wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap I g^i

" navigate to line start and end from home row
" note that this overrides H and L to move the cursor to page top and page bottom
noremap H g^
noremap L g$

" Center cursor after various movements
noremap '' ''zz
noremap <C-O> <C-O>zz
noremap <C-I> <C-I>zz
noremap <C-]> <C-]>zz
noremap <C-D> <C-D>zz
noremap <C-U> <C-U>zz

set splitbelow

" mappings for faster split window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>o <C-w>o

" ---------------------------------------------
" END NAVIGATION


" my abbreviation
"--------------------------------------
" nothing
"--------------------------------------

" my keybinding
"--------------------------------------
" Open command window
" nnoremap <Leader><Leader> :<C-f>
" nmap : <Leader><Leader>i
nnoremap <leader><leader> :b#<CR>

inoremap bb \
inoremap pp \|

" reload vim with the new configuration
nnoremap <silent> <Leader>fvR :source $MYVIMRC<CR>

" save file
nnoremap <silent> <Leader>fs :w<CR>

" save all files
nnoremap <silent> <Leader>fS :wa<CR>

" open configuration file
nnoremap <Leader>fvd :e ~/.config/nvim/init.vim<CR>

" delete current buffer
nnoremap <Leader>bd :bdelete<CR>

" list of buffers
nnoremap <Leader>bb :Buffers<CR>

" next buffer
nnoremap <Leader>bn :bnext<CR>

" previous buffer
nnoremap <Leader>bp :bprevious<CR>

" previous buffer
nnoremap <Leader>bh :Startify<CR>

" kill all buffers except the buffer am in
"nnoremap <Leader>bdo :1,9bd<Bar>bfirst<CR> " check it

" open file
" nmap <Leader>ff <Leader><Leader>ie<Space>
nnoremap <Leader>ff :Files<CR>

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
nnoremap <Leader>tt :term<CR>

nnoremap <Leader>Ts :Colors<CR>

nnoremap <Leader>is :Snippets<CR>

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

"--------------------------------------

" BEGIN MISCELLANEOUS
" ---------------------------------------------

" For easy macro playback; note that this overrides entering Ex mode with Q
nnoremap Q @q

" Easily pull up the Git command (for use with vim-fugitive)
nnoremap <leader>g :Git 

" disable automatic commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  

" close folds with zf
nnoremap zf zc

" equivalent of `:join` or `J` for lines above cursor
" nnoremap K kdd$

" global substitute
nnoremap <leader>s :%s/
vnoremap <leader>s :s/

" set filetype
nnoremap <leader>ft :set filetype=

" Source my spelling configurations.
" Important: make sure to call mapleader before sourcing my_spell,
" so that my_spell mappings use the correct leader key.
" source ~/.vim/personal/my_spell.vim
" ---------------------------------------------
" END MISCELLANEOUS

" BEGIN PLUGIN CONFIGURATION
" ---------------------------------------------
" Disable vim-dispatch's default key mappings
let g:dispatch_no_maps = 1

" Disable csv.vim's key bindings
let g:no_csv_maps = 1

" UltiSnips Snippet keys
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "jk"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>

" rainbow plugin
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" AsyncRun and AsyncTaks
let g:asyncrun_open = 8      " automatically open QuickFix menu with the given number of rows for use with AsyncRun
let g:asyncrun_trim = 1      " remove empty lines from QuickFix list
noremap <silent><leader>dq :call asyncrun#stop('')<cr>
noremap <silent><leader>dp :AsyncTask project-build-serve<cr>

" Lightline status bar
" let g:lightline = {'colorscheme' : 'tokyonight'}
 let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ 'component_function': {
       \   'fileformat': 'LightlineFileFormat',
       \   'filetype': 'LightlineFiletype',
       \   'fileencoding': 'LightlineFileEncoding',
       \ },
       \ }

 " Hide file format for window widths below 70 cols
 function! LightlineFileFormat()
   return winwidth(0) > 70 ? &fileformat : ''
 endfunction

" Hide file encoding for window widths below 70 cols
function! LightlineFileEncoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

" Hide file type for window widths below 60 cols
function! LightlineFiletype()
  return winwidth(0) > 60 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" ---------------------------------------------
" END PLUGIN CONFIGURATION

" Neovide
" ---------------------------------------------
" if exists("g:neovide")
"     " set guifont=Source\ Code\ Pro:h14
"     " set guifont=Iosevka:h14
" endif
" ---------------------------------------------
