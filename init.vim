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
set noshowmode                      " turn off display mode in statusline

set backspace   =indent,eol,start   " Make backspace work as you would expect.
set hidden                          " Switch between buffers without having to save first.
set laststatus  =2                  " Always show statusline.
set display     =lastline           " Show as much as possible of the last line.
set scrolloff   =5                  " Always keep 5 lines after scroll

"set showmode                        " Show current mode in command-line.
"set showcmd                         " Show already typed keys when more are expected.

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

set t_vb        =                   " Disable screen flash
set mouse       =nv

"=======================================
" netrw
"=======================================
let g:netrw_liststyle   =3          " Tree list style, use i to switch
let g:netrw_banner      =0          " Hide banner
let g:netrw_winsize     =25         " Window width 25%

"=======================================
" Plugins
"=======================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}     " language-server client
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' " language syntax improvment
Plug 'joshdick/onedark.vim'
"Plug 'tomasr/molokai'

Plug 'vhdirk/vim-cmake'
Plug 'richq/vim-cmake-completion'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Initialize plugin system
call plug#end()

"=======================================
" Plug 'neoclide/coc.nvim'
"=======================================
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" multicursor
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space><space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space><space>p  :<C-u>CocListResume<CR>
" Yank list
nnoremap <silent> <space><space>y  :<C-u>CocList -A --normal yank<cr>

"=======================================
" Plug 'tomasr/molokai'
" Plug 'joshdick/onedark.vim'
"=======================================
color onedark

"=======================================
" Plug 'vhdirk/vim-cmake'
"=======================================
let g:cmake_export_compile_commands = 1
let g:cmake_ycm_symlinks = 1

"=======================================
" Plug 'scrooloose/nerdtree'
"=======================================

let NERDTreeIgnore = ['\.git', '\.svn', '\.swp', '\.vscode']

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open and close NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "S",
    \ "Untracked" : " ",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "-",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '~',
    \ "Unknown"   : "?"
    \ }
"=======================================
" Keymaps
"=======================================
let mapleader="\<space>"
" Reload vimrc
nnoremap <leader>R :source ~/myvimrc/init.vim<CR>
" Open vimrc
nnoremap <leader>E :e ~/myvimrc/init.vim<CR>

" Replace windows path to linux style
nnoremap <leader>rp :%s/\\\+/\//g<CR>

" Use clipboard with <leader> y/p
noremap <leader>y "+y
noremap <leader>p "+p

