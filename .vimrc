set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
" ---UltiSnips---
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" ---------------
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'szw/vim-tags'
Plugin 'rdnetto/YCM-Generator'
Plugin 'chiel92/vim-autoformat'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
" Show | lines on indents
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'heavenshell/vim-pydocstring'
"Plugin 'jiangmiao/auto-pairs' "Matching pairs (){}, etc.
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
set mouse=i

" Set leader key to <space>
let mapleader=" "

" Map <Esc> to 'jk' for insert mode
imap jk <Esc>

let g:python_pep8_indent_multiline_string = 1

" Map <leader>g to go to definition/declaration (YouCompleteMe plugin)
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>r  :YcmCompleter GoToReferences<CR>
map <leader>d  :YcmCompleter GetDoc<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_goto_buffer_command = 'new-or-existing-tab'

" Auto-format file (needs a language specific formatter)
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1

syntax on

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" show indents with lines
let g:indentLine_enabled = 0
map <leader>i :IndentLinesToggle<CR>

" Folding based on indentation:
" use space to open folds
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
"
" Nerdtree file browsing
" ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o', '\.d']
" Bind NERDTree toggle to <leader>n
map <leader>n :NERDTreeToggle<CR>


" Toggle tagbar
nmap <leader>t :TagbarToggle<CR>

" Insert docstring templet
nmap <silent> <C-_> <Plug>(pydocstring)

" Switch to last active tabe with '<Leader>l'
let g:lasttab = 1
nmap <Leader>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" show line numbers
set number

" Match parens,etc.
set showmatch

" Highlight cursor line
set cursorline

" Highlight search matches
set hlsearch

" Autoread external file changes
set autoread
:au BufEnter,BufWinEnter,CursorHold filename :checktime

" use system clipboard too
set clipboard=unnamed

" Be more liberal with hidden buffers
set hidden

" BASH like tab complete
set wildmode=longest,list

" auto-pairs config
" enable/disable auto-pairs
execute "set <M-p>=\ep"
nnoremap <M-p> p

" Change split navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Auto change CWD to currently open file
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

" Update cscope DB- required env var: CSCOPE_DIR to be defined
map <F5> :!cd $CSCOPE_DIR && cscope -bqR<CR>:cs reset<CR><CR>
