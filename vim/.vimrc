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
" Syntax highlighting for llvm files (*.ll)
Plug 'andrewmacp/llvm.vim'

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
let g:airline_extensions = []

" Disables rust.vim's line wrapping at 99 columns
let g:rust_recommended_style = 0

" Disable spellchecking for llvm files, since keywords are highlighted as misspells in source
autocmd BufRead,BufNewFile *.ll set nospell

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
" Always keep 7 lines of buffer between cursor line and top/bottom of window
" when scrolling
set scrolloff=7
set ttyfast
set lazyredraw

" Automatically remove trailing whitespace at the end of lines
" N.B. If we save after undoing, we get an error because of undojoin. The
" try/catch block will silence that error.
autocmd BufWritePre * :try | undojoin | DeleteTrailingWhitespace | catch /^Vim\%((\a\+)\)\=:E790/ | endtry

" Remove line wrapping for markdown and txt files.
autocmd BufEnter *.md :set textwidth=0
autocmd BufEnter *.txt :set textwidth=0

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

inoremap tn <Esc>

" Use fsrt to move around files (esdf on QWERTY)
noremap f gk
noremap s gj
noremap r h
noremap t l

" Bind Shift+f and Shift+s to move to top of bottom of window
noremap <S-f> <S-h>
noremap <S-s> <S-l>

" Use l as a mapping for 'till
noremap l t

" Use h as a mapping for replace
noremap h r

nnoremap ; :LspDefinition<CR>
nnoremap <Leader>h :LspHover<CR>

" Opposite of `J`, inserts a newline at the cursor
noremap K i<Cr><Esc>f$

" `,f` to open fuzzy file finder, `,F` to open fuzzy file search
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>F :Find<CR>

let g:miniBufExplShowBufNumbers=1

" Map `<leader>[0-9]` to open buffer `[0-9]`
nnoremap <Leader>1 :b!1<CR>
nnoremap <Leader>2 :b!2<CR>
nnoremap <Leader>3 :b!3<CR>
nnoremap <Leader>4 :b!4<CR>
nnoremap <Leader>5 :b!5<CR>
nnoremap <Leader>6 :b!6<CR>
nnoremap <Leader>7 :b!7<CR>
nnoremap <Leader>8 :b!8<CR>
nnoremap <Leader>9 :b!9<CR>

" Map `<leader>x` to close the current buffer
nnoremap <Leader>x :bd<CR>

" TODO: Generalize this to run tests for other languages.
nnoremap <Leader>t :RustTest<CR>
nnoremap <F5> :RustTest!<CR>

" Change default search to incremental search
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" Prepend z before search command to invoke easymotion incremental search
nmap z/ <Plug>(incsearch-easymotion-/)
nmap z? <Plug>(incsearch-easymotion-?)
nmap zg/ <Plug>(incsearch-easymotion-stay)

" Reload .vimrc with `,.`
noremap <Leader>. :source $MYVIMRC<CR>
" Open .vimrc with `,ev`
noremap <Leader>ev :vsplit $MYVIMRC<CR>

" Clear highlights with `,k`; this is primarily to free up `,n` for the NERDTree
" toggle below.
nmap <Leader>k <Plug>MarkClear

" Open NERDTree with `,n`
noremap <Leader>n :NERDTreeToggle<CR>

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)

set omnifunc=syntaxcomplete#Complete

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=unnamedplus
set clipboard+=autoselect
