"=======================================
" Basic
"=======================================
set nocompatible                    " Disable vi compatible

filetype plugin indent on           " Load plugins according to detected filetype.
syntax on                           " Enable syntax highlighting.
set number                          " Enable line number
set relativenumber                  " Relative line number

set autoindent                      " Indent according to previous line.
set expandtab                       " Use spaces instead of tabs.
set tabstop     =4                  " Tab dispays as 4 spaces.
set softtabstop =4                  " Tab key indents by 4 spaces.
set shiftwidth  =4                  " >> indents by 4 spaces.
set shiftround                      " >> indents to next multiple of 'shiftwidth'.
set noshowmode                      " turn off display mode in statusline

set backspace   =indent,eol,start   " Make backspace work as you would expect.
set hidden                          " Switch between buffers without having to save first.
set laststatus  =2                  " Always show statusline.
set display     =lastline           " Show as much as possible of the last line.
set scrolloff   =5                  " Always keep 5 lines after scroll

"set showmode                        " Show current mode in command-line.
"set showcmd                         " Show already typed keys when more are expected.

set ignorecase                      " Search case-insensitive, use /\C for case-sensitive serching
set smartcase                       " Search case-insensitive with purly lowercase characters
set incsearch                       " Highlight while searching with / or ?.
set hlsearch                        " Keep matches highlighted.
nohlsearch                          " Clear Highlight

set ttyfast                         " Faster redrawing.
set lazyredraw                      " Only redraw when necessary.

set splitbelow                      " Open new windows below the current window.
set splitright                      " Open new windows right of the current window.

set cursorline                      " Find the current line quickly.
set wrapscan                        " Searches wrap around end-of-file.
set report      =0                  " Always report changed lines.
set synmaxcol   =200                " Only highlight the first 200 columns.

set list                            " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:•'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.,trail:.'
endif

set nowrap                          " No line wrap

set t_vb        =                   " Disable screen flash
set mouse       =nv

"=======================================
" netrw
"=======================================
let g:netrw_liststyle   =3          " Tree list style, use i to switch
let g:netrw_banner      =0          " Hide banner
let g:netrw_winsize     =25         " Window width 25%

"=======================================
" Keymaps
"=======================================
let mapleader=" "
" Reload vimrc
nnoremap <leader>R :source ~/.vim/init.vim<CR>
" Open vimrc
nnoremap <leader>E :e ~/.vim/init.vim<CR>
nnoremap <leader>Eb :e ~/.vim/init_basic.vim<CR>
nnoremap <leader>Ep :e ~/.vim/init_plugin.vim<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
function SudoWrite()
    :w !sudo tee > /dev/null %
endfunction
command W call SudoWrite()
" Replace windows path to linux style
nnoremap <leader>rp :%s/\\\+/\//g<CR>
" Use clipboard with <leader> y/p
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>P "+P

"=======================================
" encoding
"=======================================
if has('multi_byte')
    " vim inner encoding
    set encoding=utf-8
    "language messages zh_CN.utf-8

    " file encoding
    set fileencoding=utf-8

    " guest encoding
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"=======================================
" gui
"=======================================
if has('gui_running')
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  set guifont=CaskaydiaCove NF:h12
endif
