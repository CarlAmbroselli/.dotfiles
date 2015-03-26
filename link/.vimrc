set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/zsh "\ -i

" Required Vundle setup
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/LanguageTool'
Plugin 'moll/vim-bbye'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-repeat'
Plugin 'dhruvasagar/vim-table-mode'

" After new Plugins run in Vim
" :PluginInstall

call vundle#end()            " required
filetype plugin indent on    " required

" Highlight markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown

set ignorecase
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

:scriptencoding utf-8

" German umlaute
imap O Ö
imap o ö
imap A Ä
imap a ä
imap U Ü
imap u ü
imap s ß
set term=builtin_ansi
set timeoutlen=10 ttimeoutlen=0

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enables :Pc to just do what you want
" command Pc execute ':r !pbpaste'

" Only do this part when compiled with support for autocommands.
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" Killing the habbits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Plugins
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set t_Co=256
colorscheme monokai
set ai

" Word Wrap
set wrap
set linebreak
set nolist

" Soft Tabs
set expandtab
set shiftwidth=2
set softtabstop=2

let g:airline#extensions#tabline#enabled = 1

" Faster buffer navigation
map [ :bprevious<CR>
map ] :bnext<CR>

nnoremap Q :Bdelete<CR>

"Open new file
nnoremap <Leader>o :CtrlP<CR>

"Save file
nnoremap <Leader>w :w<CR>

"Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

set backspace=indent,eol,start
set scrolloff=8
set switchbuf=usetab
set mouse=a
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
map q: :q

" LanguageTool
let g:languagetool_jar='~/.vim/bundle/LanguageTool/LanguageTool-2.8/languagetool-commandline.jar'

nnoremap <C-c> :LanguageToolCheck<CR>
nnoremap <C-x> :LanguageToolClear<CR>
set spelllang=en_us

nnoremap <C-u> :UndotreeToggle<cr>

if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

let g:vim_markdown_folding_disabled=1
nnoremap <C-t> :TableFormat<cr>

" Copy and Paste to sytem clipboard
set clipboard=unnamed
"
" Allow saving of files as sudo when I forgot to start vim using sudo.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

nnoremap d "_d
nnoremap x "_x

" Change cursor depending on mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Enable Paste mode when pasting
imap <c-v> <plug>EasyClipInsertModePaste
