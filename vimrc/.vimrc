"-------- Settings {{{
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set nohlsearch
set ruler
set cursorline
set laststatus=2 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard^=unnamed,unnamedplus
set encoding=utf-8
set fileencoding=utf-8 
set shortmess+=I
set backspace=indent,eol,start
set hidden
set mouse+=a
set ttimeoutlen=0 " removes delay in closing fzf vim window
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

let g:fzf_layout = { 'down': '40%' }
"}}}

"-------- Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/suan/vim-instant-markdown', {'for': 'markdown'} " Install nodejs mini server by running  npm -g install instant-markdown-d
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'https://github.com/sirver/UltiSnips'               " snippet program only, no code snippet provided
Plug 'https://github.com/honza/vim-snippets'             " code snippet of many programming language
Plug 'https://github.com/tpope/vim-surround'             " Help surround with :h
Plug 'https://github.com/preservim/nerdtree'            " File explorer
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'               " Fzf vim to browse files in vim
Plug 'https://github.com/vim-scripts/AutoComplPop'       " Automatically show Vim's complete menu while typing.
Plug 'https://github.com/jiangmiao/auto-pairs'

"Git
Plug 'https://github.com/airblade/vim-gitgutter'         " Git gutter
Plug 'https://github.com/tpope/vim-fugitive'             " Git interface
Plug 'https://github.com/tpope/vim-rhubarb'              " Enable GBrowse from fugitive for GitHub
Plug 'https://github.com/junegunn/gv.vim'                " TIG like navigation for vim
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin'    " Show status of files in NerdTree
Plug 'https://github.com/tveskag/nvim-blame-line'        " Add git blame on line
call plug#end()
"}}}

"-------- Folding {{{
"------------------------------------------------------
" za - open and close fold, zR - open all, zM - close all, zF - create fold
" enable folding; http://vim.wikia.com/wiki/Folding
set foldmethod=marker

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

"refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

"}}}

"-------- Keybindings {{{
" Default vim leader \
let mapleader=" "
let maplocalleader=" "
" toggle relative numbering
nnoremap <C-n> :set rnu! <bar> set nu!<CR>

" Move thru word wrapped line 
nnoremap k gk
nnoremap j gj

" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Vim navigation in split panes
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NerdTree keybinding
nnoremap <C-n> :NERDTreeToggle<CR>

" Fzf Keybinding ESC,  CTRL-C , CTRL-G and CTRL-Q to close fzf vim
" Enter to open in current window
" <C-t> to open in new tab
" <C-v> to open in vertical split
" <C-x> to open in horizontal split

nnoremap <silent> <C-p> :GFiles<CR>
" nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

"}}}

" -------- RipGrep {{{

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

"}}}

"-------- vimwiki - Personal Wiki for Vim (Markdown Supported) {{{
"------------------------------------------------------
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on

" enable markdown in vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" helppage -> :h vimwiki-syntax
"}}}

"-------- vim-instant-markdown - Instant Markdown previews from Vim {{{
"------------------------------------------------------
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0	" disable autostart

" start instant markdown preview manually
map <leader>md :InstantMarkdownPreview<CR>

"}}}

"-------- Colorscheme and theme {{{
syntax enable
set background=dark
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

"}}}

" -------- AutoCommands {{{
"  }}}

"-------- Auto source vimrc {{{
"------------------------------------------------------
" watch for changes then auto source vimrc
" http://stackoverflow.com/a/2403926
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"}}}
