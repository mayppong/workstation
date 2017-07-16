" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'editorconfig/editorconfig-vim'
"Plug 'edkolev/tmuxline.vim'      " alredy generated code for .byobu/.tmux.conf
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/syntastic'
Plug 'ap/vim-css-color'
Plug 'elixir-lang/vim-elixir'
Plug 'leafgarland/typescript-vim'
"Plug 'StanAngeloff/php.vim'      " updated php-syntax (5.3 - 5.6)

call plug#end()



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
set backspace =indent,eol,start  " overwrite vi-compatibility mode
set number            " enable line number
set pastetoggle =<F2> " toggle cascading-indents when pasting
set shiftwidth =4     " size of an indent

" force .md file as markdown file type instead of Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" splitting
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"----------
"  UI
"----------

hi LineNr ctermfg=grey   " text color of line number

set cursorline                       " underline current line and and highlight line number
set list listchars=tab:»·,trail:·    " show extra space characters as a dot and tab as arrow and dots
"set list listchars=tab:\|\ ,trail:·  " show extra space characters as a dot and tab as pipeline and spaces

autocmd BufEnter,WinEnter * match ErrorMsg /\%>78v.\+/


"----------
"  Plugin
"----------

filetype plugin on

" autocomplete
set omnifunc =syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" tab to autocomplete
"inoremap <expr><TAB> '<C-x><C-o>'

" tmuxline
"let g:tmuxline_powerline_separators = 0

" vim-airline
set laststatus =2
let g:airline#extensions#tabline#enabled = 1

" vim-gitgutter
highlight clear SignColumn

" vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
