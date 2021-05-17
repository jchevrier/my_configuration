" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"############################################################################
"#            ,--.                                       ,---. ,--.         #
"# ,--.  ,--. `--' ,--,--,--.    ,---.  ,---.  ,--,--,  /  .-' `--'  ,---.  #
"#  \  `'  /  ,--. |        |   | .--' | .-. | |      \ |  `-, ,--. | .-. | #
"#   \    /   |  | |  |  |  |   \ `--. ' '-' ' |  ||  | |  .-' |  | ' '-' ' #
"#    `--'    `--' `--`--`--'    `---'  `---'  `--''--' `--'   `--' .`-  /  #
"#                                                                  `---'   #
"############################################################################

" Julien's vim configuration
"
" }

" Plug prerequesites {
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
" }

" Plugins {
call plug#begin('~/.vim/plugged')
"Plug 'brookhong/cscope.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'bling/vim-bufferline'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'mhinz/vim-signify' " Show diff in sign column
Plug 'rhysd/conflict-marker.vim' "Git conflict markers

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs' " Auto parentheses/brackets/quotes pairs
Plug 'nathanaelkane/vim-indent-guides' "Highlight indentation levels
Plug 'python-mode/python-mode'
Plug 'vim-scripts/restore_view.vim' "Restore cursor position and folds
Plug 'terryma/vim-multiple-cursors' "Add multiple line edit
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Conquer of Completion
Plug 'editorconfig/editorconfig-vim' "Make use of .editorconfig files
call plug#end()
" }

let mapleader = ','

" Vim variables configuration {
set foldenable 
set history=1000
" }

" Movements and shortcuts {

set backspace=indent,eol,start  " Backspace for dummies

" Shortcut to move between panes
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

map <C-E> :NERDTreeToggle<CR>

" }

" Editorconfig { 
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] "Make sure it works with fugitive
" }

" Ranger {
" Display index of buffers
let g:airline#extensions#tabline#buffer_nr_show = 1
" Do not let ranger plugin map its keys and define them
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
" }

" CScope config (outdated with CoC ?) {
"nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>

"Some optional key mappings to search directly.
" s: Find this C symbol
"nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
"nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
"nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
"nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
"nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
"nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
"nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
"nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>"
"http://vimawesome.com/plugin/cscope-vim
" }

" UI {
set cursorline                  " Highlight current line
set number relativenumber
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set showmode                    " Display the current mode

let g:airline_powerline_fonts = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:airline_theme='wombat'
colorscheme molokai
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Indent Guides configuration
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" Disable bufferline in status line
let g:airline#extensions#bufferline#enabled = 0

" Enable tabline (top bar).
let g:airline#extensions#tabline#enabled = 1

match ErrorMsg '\%>80v.\+' " Length warning if > 80

" }

" TagBar {
"nmap <F8> :TagbarToggle<CR>
nmap <leader>tb :TagbarToggle<CR>
" }

" Git config {
" Set width and spelling for git commit messages
autocmd filetype gitcommit setlocal spell textwidth=72

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" }

" CoC {
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }
