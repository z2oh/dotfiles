" ******************************************************************************
" *    PLUGINS
" ******************************************************************************

call plug#begin('~/.vim/plugged')

" Vim libraries ================================================================
" Used by `inkarkat/vim-mark`.
Plug 'inkarkat/vim-ingo-library'

" Major features ===============================================================
" Fuzzy file finder.
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Powerline enabled status bar.
Plug 'vim-airline/vim-airline'
" Directory tree/project explorer.
Plug 'scrooloose/nerdtree'

" Language support =============================================================
" LSP client.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Rust language plugin.
Plug 'rust-lang/rust.vim'
" Fish script language plugin.
Plug 'dag/vim-fish'
" Syntax highlighting for llvm files (*.ll).
Plug 'andrewmacp/llvm.vim'
" Scala language plugin.
Plug 'derekwyatt/vim-scala'
" ABNF syntax highlighting.
Plug 'skilstak/vim-abnf-utf8'

" Minor features ===============================================================
" Snippets engine.
Plug 'SirVer/ultisnips'
" Git/mercurial information in the gutter.
Plug 'mhinz/vim-signify'
" Git support.
Plug 'tpope/vim-fugitive'
" Modify or delete surrounding tags, ([{'" for example.
Plug 'tpope/vim-surround'
" Causes searches to start jumping before <CR>.
Plug 'haya14busa/incsearch.vim'
" Motions on speed!
Plug 'easymotion/vim-easymotion'
" Incorporates incremental searching with easy motion.
Plug 'haya14busa/incsearch-easymotion.vim'
" Support for editorconfig.
Plug 'editorconfig/editorconfig-vim'
" Displays indentation guides.
Plug 'nathanaelkane/vim-indent-guides'
" Causes word motions to work with snake_case and CamelCase.
Plug 'chaoren/vim-wordmotion'
" Allows for easy commenting.
Plug 'scrooloose/nerdcommenter'
" Highlights trailing whitespace.
Plug 'vim-scripts/ShowTrailingWhitespace'
" Deletes trailing whitespace.
Plug 'vim-scripts/DeleteTrailingWhitespace'
" Aligns text fragments on symbols.
Plug 'junegunn/vim-easy-align'
" Adds symbol highlighting on <leader>m.
Plug 'inkarkat/vim-mark'
" Adds icons to various plugins, including NERDTree.
Plug 'ryanoasis/vim-devicons'
" Provides colors for NERDTree icons.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Enables simple reordering of delimited items (function args).
Plug 'machakann/vim-swap'
" Better marks support: navigation and highlighting.
Plug 'kshenoy/vim-signature'
" Symbol/tag viewer.
Plug 'liuchengxu/vista.vim'

" Themes =======================================================================
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"*******************************************************************************
"*    Configuration
"*******************************************************************************

" Settings =====================================================================

" Theming settings -------------------------------------------------------------

" Enable full color support for terminal vim.
set termguicolors

" Sets the theme to PaperColor light.
set background=light
colorscheme PaperColor

" Sets the airline theme to PaperColor.
let g:airline_theme='papercolor'

" Let the theme style the indent guides.
let g:indent_guides_auto_colors=0

" Adds folder icons to folders in NERDTree.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" Only colors some filetypes to reduce lag of running many regexes.
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'rs', 'scala']

" Disable the background colors of the gutter for source control signifiers.
let g:signify_line_highlight = 0

" Basic Vim settings -----------------------------------------------------------

" Display the cursorline's absolute number, and every other line number relative
" to the cursor line.
set number relativenumber

" Remove preview window from autocomplete.
set completeopt-=preview

" Enable syntax highlighting.
syntax enable

" Enable the mouse.
set mouse=a

" Highlight the 80th, 100th, and 120th columns.
set colorcolumn=80,100,120

" Highlight the active cursorline.
set cursorline

" Allow backspacing over autoindent, linebreaks, and the start of an insert.
set backspace=indent,eol,start

" Set default max width before wrapping to 80 columns.
set textwidth=80

" Always keep 7 lines of buffer between cursor line and top/bottom of window
" when scrolling.
set scrolloff=7

" Allows sending more characters to the terminal for drawing, since my terminal
" emulator was written after 1980.
set ttyfast

" Disables redrawing when executing 'non-typed' commands (like macros).
set lazyredraw

" Disables the magic characters used in pattern matching.
set nomagic

" Ignores case when pattern matching.
set ignorecase

" Respects case only when an uppercase character is present in pattern matching.
set smartcase

" Enable the VIM spellchecker.
set spell

" Folds are determined based on indentation.
set foldmethod=indent

" No folding when starting to edit a buffer.
set foldlevelstart=99

" Sets filetype detection, filetype plugin loading, and indentfile loading on.
filetype plugin indent on

" Display characters for tab (`›`), end of line (`¬`) and trailing spaces (`·`).
set list listchars=tab:›\ ,eol:¬,trail:·

" Use syntaxcomplete as the completion engine to enable vim autocomplete for
" any file with syntax highlighting enabled.
set omnifunc=syntaxcomplete#Complete

" Set tab characters to display as 8 characters in width.
set tabstop=8

" Use 4 spaces for tab related things (like autoindent).
set shiftwidth=4

" Insert space characters when a `<Tab>` is pressed.
set expandtab

" Enables use of system clipboard on Linux, Windows, and OSx.
set clipboard=unnamedplus

" Enable autoselect; selections are automatically placed in the clipboard.
if !has('nvim')
  set clipboard+=autoselect
endif

" Change the cursor hover update time from the default of 4000 ms to 100ms.
set updatetime=100

" Disable neovim from changing the cursor shape. Solid block forever!
if has('nvim')
  set guicursor=
endif

" Plugin settings --------------------------------------------------------------

" Ctrl+e expands a snippet (insert mode).
let g:UltiSnipsExpandTrigger = "<c-e>"

" Use Space for single character easymotion.
nmap <Space> <Plug>(easymotion-overwin-f)
vmap <Space> <Plug>(easymotion-overwin-f)

" Close the NERDTree window when opening a file.
let NERDTreeQuitOnOpen = 1

" Unbind `s` and `f` from NERDTree, as these keys are mapped to `gk` and `gj`
" respectively.
let NERDTreeMapOpenVSplit='\s'
let NERDTreeMapToggleFilters='\f'

" Disables rust.vim's line wrapping at 99 columns.
let g:rust_recommended_style = 0

" Enables indent guides when starting VIM.
let g:indent_guides_enable_on_vim_startup = 1

" Show leading spaces and use a '·' as the leading space character.
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" Include airline's tabline extension.
let g:airline_extensions = ['tabline']

" Show buffers in the airline tabline.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

" Number the tabline buffers and enable buffer switch mappings.
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Use the 'unique_tail' formatter for the buffer list.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Enable powerline fonts for airline.
let g:airline_powerline_fonts = 1

" Add period, quotation mark, and dash to wordmotion space character list.
let g:wordmotion_spaces = '_-."'

" Use coc as the default vista executive (from which to enumerate symbols).
let g:vista_default_executive = 'coc'

" Enable fancy icons, since a patched Nerd font is in use.
let g:vista#renderer#enable_icon = 1

" Increase the default sidebar width from 30.
let g:vista_sidebar_width = 50

" Hide constants and variables to increase SNR.
let g:vista_ignore_kinds = [ 'Constant', 'Variable' ]

" Close the window when jumping to a symbol.
let g:vista_close_on_jump = 1

" Autocommands =================================================================

"
" N.B. all autocommands are wrapped in groups with `autocmd!` to prevent
" duplicate event subscriptions on .vimrc sourcing. See
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html for more
" information.

" Close Vim if the only open window is a NERDTree window.
augroup close_NERDTree
    autocmd!
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") &&
        \ b:NERDTree.isTabTree()) | q | endif
augroup END

" Automatically remove trailing whitespace at the end of lines on write.
augroup remove_trailing_whitespace
    autocmd!
    " N.B. If we save after undoing, we get an error because of undojoin. The
    " try/catch block will silence that error.
    autocmd BufWritePre * :try | undojoin | DeleteTrailingWhitespace |
        \ catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END

" Applies syntax highlighting to the entire file as soon as any buffer is
" opened.
augroup highlight_syntax
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Filetype autocommands --------------------------------------------------------

augroup filetype_abnf
    autocmd!
    autocmd FileType abnf :set nospell
augroup END

augroup filetype_scala
    autocmd!
    autocmd FileType scala :set textwidth=120
augroup END

" Group of autocommands to run for LLVM files.
augroup filetype_llvm
    autocmd!
    " Disable spellchecking for llvm files, since keywords are highlighted as
    " misspells in source
    autocmd BufEnter *.ll set nospell
augroup END

" Group of autocommands to run for markdown files.
augroup filetype_md
    " Remove line wrapping.
    autocmd FileType markdown :set textwidth=0
augroup END

" Group of autocommands to run for .txt files.
augroup filetype_txt
    " Remove line wrapping.
    autocmd BufEnter *.txt :set textwidth=0
augroup END

" Group of autocommands to run for .log files.
augroup filetype_log
    " Disable spellcheck and virtual line wrapping.
    autocmd BufEnter *.log :set nospell
    autocmd BufEnter *.log :set nowrap
augroup END

" Autocommands to run for Rust file.
augroup filetype_rust
    autocmd!
    " Execute the current test under the cursor.
    autocmd FileType rust nnoremap <Leader>t :RustTest<CR>
    " Use F5 to execute all tests (`cargo test` in root).
    autocmd FileType rust nnoremap <F5> :RustTest!<CR>
augroup end

" Key mappings =================================================================

" Core mappings ----------------------------------------------------------------

" Use `,` for leader.
let mapleader = ","

" Use `tn` for <Esc>.
inoremap tn <Esc>
vnoremap tn <Esc>

" Motions ----------------------------------------------------------------------

" Use fsrt to move around files (this is esdf on QWERTY).
" N.B. gk and gj are used to move between lines on screen rather than actual
" lines; this is handy when lines start to wrap.
noremap f gk
noremap s gj
noremap r h
noremap t l

" Bind `Shift+f` and `Shift+s` to move to top of bottom of buffer.
noremap <S-f> <S-h>
noremap <S-s> <S-l>

" Use `l` as a mapping for 'till. This is because `t` is remapped to a motion.
noremap l t

" Buffer management ------------------------------------------------------------

nnoremap <Leader>b :Buffers<CR>

" Map `<leader>[1-9]` to open buffer `[1-9]`.
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Map `<leader>x` to close the current buffer.
nnoremap <Leader>x :bd<CR>
" Map `<leader><Esc>` to close ALL buffers.
nnoremap <Leader><Esc> :%bdelete<CR>

" Utility mappings -------------------------------------------------------------
"
" Use `h` as a mapping for replace. This is because `r` is remapped to a motion.
noremap h r

" Use `dp` (delete pair) to delete a pair of grouping delimiters, e.g. {}/[]/().
noremap dp %x<C-o>x

" Map `tab` to perform autocompletions.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Opposite of `J`, inserts a newline at the cursor.
noremap K i<Cr><Esc>f$

" Reload ~/.vimrc with `,.`.
noremap <Leader>. :source $MYVIMRC<CR>
" Open ~/.vimrc with `,ev`.
noremap <Leader>ev :vsplit $MYVIMRC<CR>

" `,p` yanks the current buffer's file path relative to vim's cwd.
" `,P` yanks the current buffer's absolute file path.
if has('win32')
  " On windows, reverse the solidus direction.
  nmap ,p :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,P :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
else
  nmap ,p :let @*=expand("%")<CR>
  nmap ,P :let @*=expand("%:p")<CR>
endif

" Plugin Mappings --------------------------------------------------------------

" `,f` to open fuzzy file finder, `,F` to open fuzzy file search.
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>F :Find<CR>

" Change default search to use incremental search.
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" Prepend z before search command to invoke easymotion incremental search.
nmap z/ <Plug>(incsearch-easymotion-/)
nmap z? <Plug>(incsearch-easymotion-?)
nmap zg/ <Plug>(incsearch-easymotion-stay)

" LSP Mappings.
" Map `;` to query LSP for 'GOTO definition'.
nmap <silent> ; <Plug>(coc-definition)
nmap <silent> <F12> <Plug>(coc-references)
nmap <silent> <Leader><F2> <Plug>(coc-rename)

" Map tab and shift-tab to navigate autocompletion list.
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Map enter to apply autocompletion.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Clear highlights with `,k`; this is primarily to free up `,n` for the NERDTree
" toggle below.
nmap <Leader>k <Plug>MarkClear
nmap <Leader>` <Plug>MarkRegex
xmap <Leader>` <Plug>MarkRegex
omap <Leader>` <Plug>MarkRegex

" Open NERDTree with `,n`.
noremap <Leader>n :NERDTreeToggle<CR>

" Start interactive EasyAlign for a motion/text object (e.g. gaip).
xmap ga <Plug>(EasyAlign)

" Add mappings to select function parameters (or any swappable text objects).
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

" `,h` will toggle full line source control highlighting with signify. This is
" useful for quickly finding changes in a file, but can be cumbersome when
" working on a large change set.
" `,r` and `,t` will navigate to the next and previous source control hunk.
nmap <Leader>h :SignifyToggleHighlight<CR>
nmap <Leader>r <Plug>(signify-prev-hunk)
nmap <Leader>t <Plug>(signify-next-hunk)

nmap <silent> <F2> :Vista!!<CR>

" Additional functions =========================================================

" Uses ripgrep to drive fzf.
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number
    \ --no-heading --fixed-strings --ignore-case --hidden --follow --glob
    \ "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

