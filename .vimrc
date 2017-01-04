set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" ---UltiSnips---
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" ---------------
Plugin 'chiel92/vim-autoformat'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/indentLine'
" Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'heavenshell/vim-pydocstring'
" Colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ======================================
" Powerline stuff (installed via pip)
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
" ======================================

" UltiSnips and YCM compatibility
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Enable mouse
set mouse=a

" Set leader key to <space>
let mapleader=" "

" Map <Esc> to 'jk' for insert mode
imap jk <Esc>

" Map <leader>g to go to definition/declaration (YouCompleteMe plugin)
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>r  :YcmCompleter GoToReferences<CR>
map <leader>d  :YcmCompleter GetDoc<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'

" Auto-format file (needs a language specific formatter)
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1

" ------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=79

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" syntax checking for python
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" For full syntax highlighting:
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

" show tabs
au FileType python set list
au FileType python set listchars=tab:▸.

" show indents with lines
let g:indentLine_enabled = 0
map <leader>i :IndentLinesToggle<CR>

" Folding based on indentation:
" use space to open folds
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
" ----------Stop python PEP 8 stuff--------------
" Nerdtree file browsing
" ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
" Bind NERDTree toggle to <leader>n
map <leader>n :NERDTreeTabsToggle<CR>

" Toggle tagbar
nmap <leader>t :TagbarToggle<CR>
" Auto open tagbar
autocmd FileType python :call tagbar#autoopen(1)

" Insert docstring templet
nmap <silent> <C-_> <Plug>(pydocstring)

" Switch to last active tabe with '<Leader>l'
let g:lasttab = 1
nmap <Leader>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Enable highlight and incramental search
set incsearch
set hlsearch

" show line numbers
set number

" Match parens,etc.
set showmatch

" Highlight cursor line
set cursorline

" pretty auto-complete for vim commands
set wildmenu

" use system clipboard too
set clipboard=unnamed

" Change split navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Auto change CWD to currently open file
" autocmd BufEnter * silent! lcd %:p:h
set autochdir

" Split to the right/bottom
" set splitbelow
" set splitright
" Toggle background light/dark with <F5>
" call togglebg#map("<F5>")

" set default colorscheme
" set background=dark
" colorscheme solarized
colorscheme zenburn
