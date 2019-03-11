call plug#begin('~/.vim/plugged')

" Vim libraries ===============================================================
" Used by `inkarkat/vim-mark`
Plug 'inkarkat/vim-ingo-library'

" Major features ===============================================================
" Fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Powerline enabled status bar
Plug 'vim-airline/vim-airline'
" Directory tree/project explorer
Plug 'scrooloose/nerdtree'
" Buffer toolbar
Plug 'fholgado/minibufexpl.vim'

" Language support =============================================================
" Support for language server and async code completion
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Rust language plugin
Plug 'rust-lang/rust.vim'
" Fish script language plugin
Plug 'dag/vim-fish'

" Minor features ===============================================================
" Git/mercurial information in the gutter
Plug 'airblade/vim-gitgutter'
" Git support
Plug 'tpope/vim-fugitive'
" Modify or delete surrounding tags, ([{'" for example
Plug 'tpope/vim-surround'
" Causes searches to start jumping before <CR>
Plug 'haya14busa/incsearch.vim'
" Motions on speed!
Plug 'easymotion/vim-easymotion'
" Incorporates incremental searching with easy motion
Plug 'haya14busa/incsearch-easymotion.vim'
" Support for editorconfig
Plug 'editorconfig/editorconfig-vim'
" Displays indentation guides
Plug 'nathanaelkane/vim-indent-guides'
" Causes word motions to work with snake_case and CamelCase
Plug 'chaoren/vim-wordmotion'
" Allows for easy commenting
Plug 'scrooloose/nerdcommenter'
" Highlights trailing whitespace
Plug 'vim-scripts/ShowTrailingWhitespace'
" Deletes trailing whitespace
Plug 'vim-scripts/DeleteTrailingWhitespace'
" Aligns text fragments on symbols
Plug 'junegunn/vim-easy-align'
" Adds symbol highlighting on <leader>m
Plug 'inkarkat/vim-mark'
" Adds icons to various plugins, including NERDTree
Plug 'ryanoasis/vim-devicons'
" Provides colors for NERDTree icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" A fancy start screen for vim
Plug 'mhinz/vim-startify'

" Themes =======================================================================
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" Set tab to perform autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Remove preview window from autocomplete
set completeopt-=preview

" Remove duplicate entires in completion menu
let g:asyncomplete_remove_duplicates = 1

let g:EasyMotion_smartcase = 4

set termguicolors

" Close Vim if the only open window is a NERDTree window.
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Adds folder icons to folders in NERDTree.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Only colors some filetypes to reduce lag of running many regexes.
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'rs', 'scala']

let NERDTreeQuitOnOpen = 1

let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_powerline_fonts = 1

" Enable syntax highlighting and enable syntax checking for entire buffers
" when they are opened
syntax enable
autocmd BufEnter * :syntax sync fromstart

set number relativenumber
set mouse=a
set colorcolumn=80,100,120
set cursorline
set backspace=indent,eol,start
set textwidth=120

" Automatically remove trailing whitespace at the end of lines
" N.B. If we save after undoing, we get an error because of undojoin. The
" try/catch block will silence that error.
autocmd BufWritePre * :try | undojoin | DeleteTrailingWhitespace | catch /^Vim\%((\a\+)\)\=:E790/ | endtry

set nomagic
set ignorecase
set smartcase
set spell

let g:indent_guides_enable_on_vim_startup = 1
set foldmethod=indent
set foldlevel=99

filetype plugin indent on

let g:airline_theme='papercolor'

set background=light
colorscheme PaperColor

hi! Normal ctermbg=NONE guibg=NONE

" Indentation
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
set list listchars=tab:›\ ,eol:¬,trail:⋅

" Let the theme style the indent guides
let g:indent_guides_auto_colors=0

" KEY MAPPINGS
let mapleader = ","

" Unbind `s` and `f` from NERDTree, as these keys are mapped to gk and gj
" respectively.
let NERDTreeMapOpenVSplit='\s'
let NERDTreeMapToggleFilters='\f'

imap tn <Esc>

" Use fsrt to move around files (esdf on QWERTY)
noremap f gk
noremap s gj
noremap r h
noremap t l

" Use l as a mapping for 'till
noremap l t

" Use h as a mapping for replace
noremap h r

nmap ; :LspDefinition<CR>

" Opposite of `J`, inserts a newline at the cursor
map K i<Cr><Esc>f$

" `,f` to open fuzzy file finder, `,F` to open fuzzy file search
map <Leader>f :Files<CR>
map <Leader>F :Find<CR>

let g:miniBufExplShowBufNumbers=1

" Map `<leader>[0-9]` to open buffer `[0-9]`
nmap <Leader>1 :b1<CR>
nmap <Leader>2 :b2<CR>
nmap <Leader>3 :b3<CR>
nmap <Leader>4 :b4<CR>
nmap <Leader>5 :b5<CR>
nmap <Leader>6 :b6<CR>
nmap <Leader>7 :b7<CR>
nmap <Leader>8 :b8<CR>
nmap <Leader>9 :b9<CR>

nmap <Leader>w <Plug>(easymotion-W)
nmap <Leader>b <Plug>(easymotion-B)

" Map `<leader>x` to close the current buffer
nmap <Leader>x :bd<CR>

nmap <Leader>t :RustTest<CR>
nmap <F5> :RustTest!<CR>

" Change default search to incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Prepend z before search command to invoke easymotion incremental search
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" Reload .vimrc with `,.`
map <Leader>. :source ~/.vimrc<CR>

" Clear highlights with `,k`; this is primarily to free up `,n` for the NERDTree
" toggle below.
map <Leader>k <Plug>MarkClear

" Open NERDTree with `,n`
map <Leader>n :NERDTreeToggle<CR>

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)

set omnifunc=syntaxcomplete#Complete

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=unnamedplus
set clipboard+=autoselect
