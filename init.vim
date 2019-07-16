"=======================================
" Basic
"=======================================
set nocompatible                    " Disable vi compatible

filetype plugin indent on           " Load plugins according to detected filetype.
syntax on                           " Enable syntax highlighting.
set number                          " Enable line number

set autoindent                      " Indent according to previous line.
set expandtab                       " Use spaces instead of tabs.
set softtabstop =4                  " Tab key indents by 4 spaces.
set shiftwidth  =4                  " >> indents by 4 spaces.
set shiftround                      " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start   " Make backspace work as you would expect.
set hidden                          " Switch between buffers without having to save first.
set laststatus  =2                  " Always show statusline.
set display     =lastline           " Show as much as possible of the last line.
set scrolloff   =5                  " Always keep 5 lines after scroll

set showmode                        " Show current mode in command-line.
set showcmd                         " Show already typed keys when more are expected.

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

color elflord                       " Color scheme
set t_vb        =                   " Disable screen flash


"=======================================
" Plugins
"=======================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()


"=======================================
" Keymaps
"=======================================
" Reload vimrc
nnoremap <leader>R :source ~/myvimrc/init.vim<CR>
" Open vimrc
nnoremap <leader>E :e ~/myvimrc/init.vim<CR>

" Replace windows path to linux style
nnoremap <leader>rp :%s/\\\+/\//g<CR>

