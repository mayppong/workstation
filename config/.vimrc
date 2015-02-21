" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'edkolev/tmuxline.vim'      " alredy generated code for .byobu/.tmux.conf
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
"Plugin 'StanAngeloff/php.vim'      " updated php-syntax (5.3 - 5.6)

call vundle#end()
filetype plugin indent on



"----------
"  System
"----------

" OSX terminal timeout fix
set notimeout
set ttimeout
set timeoutlen =100



"----------
"  Behaviour
"----------

" behaviour
set expandtab         " use spaces for tab
set number            " enable line number
set pastetoggle =<F2> " toggle cascading-indents when pasting
set shiftwidth =4     " size of an indent
set softtabstop =4    " a combination of spaces and tabs
set tabstop =4        " size of a hard tabstop

" enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" tab to autocomplete
inoremap <expr><TAB> '<C-x><C-o>'



"----------
"  UI
"----------

hi LineNr ctermfg=grey   " text color of line number

set cursorline                       " underline current line and and highlight line number
set list listchars=tab:»·,trail:·    " show extra space characters as a dot and tab as arrow and dots
"set list listchars=tab:\|\ ,trail:·  " show extra space characters as a dot and tab as pipeline and spaces

syntax enable



"----------
"  Plugin
"----------

" autocomplete
filetype plugin on
set omnifunc =syntaxcomplete#Complete

" tmuxline
"let g:tmuxline_powerline_separators = 0

" vim-airline
set laststatus =2
let g:airline#extensions#tabline#enabled = 1

" vim-gitgutter
highlight clear SignColumn
