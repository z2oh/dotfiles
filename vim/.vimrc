call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-syntastic/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --js-completer --rust-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

set termguicolors

let mapleader = ","

let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function = "ƒ"
let g:airline_powerline_fonts = 1

syntax enable
autocmd BufEnter * :syntax sync fromstart
set number relativenumber
set colorcolumn=80,100
set cursorline

set ignorecase
set smartcase

let g:indent_guides_enable_on_vim_startup = 1
set foldmethod=indent
set foldlevel=99


let g:rustfmt_autosave = 1

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1

colorscheme nord

hi! Normal ctermbg=NONE guibg=NONE

" Indentation
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
set list listchars=tab:›\ ,eol:¬,trail:⋅

let g:indent_guides_auto_colors = 0
highlight IndentGuidesOdd  guibg=#3b4252
highlight IndentGuidesEven guibg=#434c5e

:imap tn <Esc>
:noremap f gk
:noremap s gj
:noremap r h
:noremap t l

:noremap l t

:map <Leader>f :Files<CR>
:map <Leader>F :Find<CR>

:map /  <Plug>(incsearch-forward)
:map ?  <Plug>(incsearch-backward)
:map g/ <Plug>(incsearch-stay)

:map z/ <Plug>(incsearch-easymotion-/)
:map z? <Plug>(incsearch-easymotion-?)
:map zg/ <Plug>(incsearch-easymotion-stay)

:map ,S :source ~/.vimrc<CR>
:map ,h :syntax sync fromstart<CR>

set omnifunc=syntaxcomplete#Complete

:iabbrev <// </<C-X><C-O>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=unnamedplus
set clipboard+=autoselect
