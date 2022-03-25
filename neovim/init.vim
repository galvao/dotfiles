"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc - Vim/GVim Configuration File
"
" Er Galvão Abbott - https://github.com/galvao/dotfiles
"
" Official docs @ http://vimdoc.sourceforge.net/htmldoc/usr_toc.html
"
" Many thanks to Matthew Weier O'Phinney for his articles about it:
"     - https://mwop.net/blog/249-vim-toolbox-2010-edition.html
"     - https://mwop.net/blog/164-Vim-Productivity-Tips-for-PHP-Developers.html
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No compatibility with vi
:set nocompatible

" Best mouse usage on vim >= 8
:set mouse=a

:set encoding=utf8

" Plugs
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', {'as': 'NERDTree Git'}
Plug 'vim-airline/vim-airline', { 'as': 'vim-airline' }
Plug 'vim-airline/vim-airline-themes', { 'as': 'vim-airline-themes' }
Plug 'ervandew/supertab', { 'as': 'SuperTab' }
Plug 'vim-vdebug/vdebug', { 'as': 'VDebug' }
Plug 'segeljakt/vim-silicon', {'as': 'silicon'}
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog', {'as': 'flog'}
Plug 'vim-syntastic/syntastic', {'as': 'syntastic'}
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'adamheins/vim-highlight-match-under-cursor'
Plug 'APZelos/blamer.nvim'
Plug 'vimwiki/vimwiki'
Plug 'jacoborus/tender.vim'
Plug 'leafgarland/typescript-vim'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax on
" :colorscheme atom-dark
:colorscheme tender
filetype plugin indent on

set guifont=JetBrains\ Mono:h14
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tender'

let mapleader=","

" Run NERDTree on start
autocmd vimenter * NERDTree

" Blamer config
let g:blamer_enabled = 0
let g:blamer_date_format = '%Y/%m/%d %H:%M'

" Skeletons (ref.: https://vimtricks.com/p/automated-file-templates/)
autocmd BufNewFile *.html 0r ~/vim-skeletons/index.html
autocmd BufNewFile *.php 0r ~/vim-skeletons/index.php
autocmd BufNewFile openapi.json 0r ~/vim-skeletons/openapi.json

" Hide Syntastic's style messages
let g:syntastic_php_checkers = ['php']
let g:syntastic_quiet_messages = { "type": "style" }

" @todo: No undo file, global clipboard
:set undofile
:set clipboard=unnamed
:set ttyfast

" Automatic indentation, smart indentation
:set autoindent
:set smartindent

" Set the folding method to indent
:set foldmethod=indent
:set foldlevelstart=99

" Use the space bar to open/close foldings
nnoremap <Space> za

" Use F8 to toggle TagBar
nnoremap <F8> :TagbarToggle<CR>

" Display buffers
:nnoremap <Leader>b :buffers<CR>:buffer<Space>

let g:SuperTabMappingForward  = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

" Can't exactly remember, guessing is so folding is not activated upon opening a file
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" Reload .vimrc upon saving it
au BufWritePost ~/.config/nvim/init.vim so ~/.config/nvim/init.vim

" Starting indentation on level 1 and a smaller guide size
:let g:indent_guides_start_level = 2
:let g:indent_guides_guide_size = 1

" Highlights an area of 120 characters, so you notice if you go over this limit (PSR12)
"let &colorcolumn=join(range(121,999),",")
"hi ColorColumn ctermbg=red guibg=maroon

" Get rid of backup, buffer and undo files
:set backupdir=/tmp//
:set directory=/tmp//
:set udir=/tmp//

" Check Syntax with CTRL + L
map <C-L> :!php -l %<CR>

" Forgot to sudo a file? Type :w!!
cmap w!! w !sudo tee % >/dev/null

" Ignore these extensions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Tabs as four spaces
:set smarttab
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set shiftround

:set number
:set showcmd
:set showmode

:set linespace=2

" "Regular" backspace behaviour
:set backspace=start,eol,indent

" Incremental search, show matches
:set incsearch
:set showmatch

" F3 toggles search highlight
nnoremap <F3> :set hlsearch!<CR>

" Case insensitive, respect case if caps are typed
:set ignorecase
:set smartcase

" SQL and HTML Syntax inside PHP strings
:let php_sql_query=1
:let php_htmlInStrings=1
:let php_folding=1
:let php_parent_error_close=1
:let php_parent_error_open=1

" Treat phpt, phtml and phps as PHP files
:autocmd BufNewFile,BufRead *.phpt set ft=php
:autocmd BufNewFile,BufRead *.phtml set ft=php
:autocmd BufNewFile,BufRead *.phps set ft=php
