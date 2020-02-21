"=======================================
" Plugins
"=======================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-sandwich'
"Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi' " emacs like keymap
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'neoclide/coc.nvim', {'branch': 'release'}     " language-server client
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' " language syntax improvment

Plug 'joshdick/onedark.vim'
Plug 'crusoexia/vim-monokai'

Plug 'vhdirk/vim-cmake'
Plug 'richq/vim-cmake-completion'
Plug 'honza/vim-snippets'

Plug 'yuexiahu/a.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' " file icons, need NerdFont

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Plug 'liuchengxu/vim-clap'
Plug 'rlue/vim-barbaric' " smart im switcher
Plug 'skywind3000/vim-terminal-help'

Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/DoxygenToolkit.vim'


" text object
Plug 'kana/vim-textobj-user' " text object customize
Plug 'kana/vim-textobj-line' " l
Plug 'kana/vim-textobj-entire' " e
Plug 'kana/vim-textobj-indent' " i
Plug 'kana/vim-textobj-function' " f F

" Initialize plugin system
call plug#end()

" Coc.nvim extensions list
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-marketplace',
            \'coc-omni',
            \'coc-pairs',
            \'coc-snippets',
            \'coc-python',
            \'coc-go',
            \'coc-rls',
            \]

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
xmap \f  <Plug>(coc-format-selected)
nmap \f  <Plug>(coc-format-selected)

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
xmap \a  <Plug>(coc-codeaction-selected)
nmap \a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap \ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap \qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> \\d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> \\e  :<C-u>CocList extensions<cr>
" Shoa actions
nnoremap <silent> \\a  :<C-u>CocList actions<cr>
" Show commands
nnoremap <silent> \\c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> \\o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> \\s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> \\j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> \\k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> \\p  :<C-u>CocListResume<CR>
" Yank list
nnoremap <silent> \\y  :<C-u>CocList -A --normal yank<cr>

"=======================================
" Plug 'justinmk/vim-sneak'
"=======================================
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
vmap <leader>s <Plug>Sneak_s
vmap <leader>S <Plug>Sneak_S

"=======================================
" Plug 'justinmk/vim-sneak'
"=======================================
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"=======================================
" Plug 'plasticboy/vim-markdown'
"=======================================
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'js=javascript']

"=======================================
" color scheme
" Plug 'joshdick/onedark.vim'
" Plug 'crusoexia/vim-monokai'
"=======================================
if has("termguicolors")
    " fix bug for vim
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif

"color onedark
color monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

set background=dark

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

" Open and close NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinPos = "right"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : " ",
    \ "Renamed"   : "@",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "!",
    \ "Clean"     : "%",
    \ "Unknown"   : "?"
    \}

"=======================================
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'liuchengxu/vim-clap'
"=======================================
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewInPopup=1
let g:Lf_ShortcutF = '<leader>f'
nmap <silent> <leader><leader>f :Leaderf function<CR>
nmap <silent> <leader><leader>F :Leaderf function --all<CR>
nmap <silent> <leader>b :Leaderf buffer<CR>
nmap <silent> <leader>g :Leaderf rg --current-buffer<CR>
nmap <silent> <leader>G :Leaderf rg<CR>
nmap <silent> <leader>m :Leaderf mru<CR>

"=======================================
"Plug 'skywind3000/vim-terminal-help'
"=======================================
if has('win32')
    let g:terminal_shell = "powershell"
endif

"=======================================
" Keymaps
"=======================================
" qt creator keymap
nmap <silent> <F4> :A<CR>
imap <silent> <F4> <Esc>:A<CR>
nmap <silent> <F2> <Plug>(coc-definition)

" doxygen
nmap <leader>d :Dox<CR>

"=======================================
" Autocmds
"=======================================
autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
autocmd FileType json syntax match Comment +\/\/.\+$+

