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

" Pathogen, used for managing plugins
execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" Not sure, guess it's about terminal colors
:set t_Co=256

:set background=dark
colorscheme monokai

:if has("terminfo")
:  set t_Co=16
:  set t_AB=<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
:  set t_AF=<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
:else
:  set t_Co=16
:  set t_Sf=<Esc>[3%dm
:  set t_Sb=<Esc>[4%dm
:endif

:set cursorline

" Specific cursor line colors. Disabled in favor of the PSR2 related hack
":hi CursorLine   cterm=NONE ctermbg=black guibg=black

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

" "Regular" backspace behaviour
:set backspace=start,eol,indent

" Specific options for auto-completion
" @todo: Document it properly
"let g:ycm_auto_trigger = 0
":set wildmenu
":set wildmode=list:longest
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" @todo: Check if these are truly necessary and document them
:set undofile
:set clipboard=unnamed
:set ttyfast

" Automatic indentation, smart indentation
:set autoindent
:set smartindent

" Set the folding method to indent
:set foldmethod=indent

" Use the space bar to open/close foldings
nnoremap <Space> za

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

" @todo: Document this properly
:set highlight=lub
:set mousemodel=extend
:let bash_is_sh=1
:let spell_auto_type = ""

" Snipmate options
let g:snips_author = "Er Galvão Abbott"
let g:snippets_dir = $HOME . "/.vim/snippets/"

" @todo: Document this properly (NERDTree related)
autocmd vimenter * if !argc() | NERDTree | endif

" Airline Config - Use special font, ignore mixed indentation warning
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#whitespace#checks = [ 'indent' ]

set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ 12


" Always hava a status line
set laststatus=2

" Can't exactly remember, guessing is so folding is not activated upon opening a file
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" Reload .vimrc upon saving it
au BufWritePost .vimrc so ~/.vimrc

" Starting indentation on level 1 and a smaller guide size
:let g:indent_guides_start_level = 2
:let g:indent_guides_guide_size = 1

" Highlights an area of 120 characters, so you notice if you go over this limit (PSR2)
let &colorcolumn=join(range(121,999),",")

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

" For Fugitive. Disabled for now
"autocmd BufReadPost fugitive://* set bufhidden=delete

" Reloads .vimrc upon modification. Disabled for now
"if has("autocmd")
"	autocmd bufwritepost .vimrc source $MYVIMRC
"	filetype plugin indent on
"endif

" VDebug Configuration
let g:vdebug_options = {} 
let g:vdebug_options["port"] = 9000
