call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'webdesus/polymer-ide.vim', { 'do': 'npm install' }
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

let mapleader = ","

let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function = "ƒ"
let g:airline_powerline_fonts = 1

syntax enable
set number relativenumber
set cursorline

set ignorecase
set smartcase

let g:indent_guides_enable_on_vim_startup = 1
set foldmethod=indent
set foldlevel=99

set background=light
colorscheme solarized
hi IndentGuidesEven ctermbg=LightGray

highlight GitGutterAdd ctermfg=LightGreen ctermbg=LightGreen
highlight GitGutterDelete ctermfg=LightRed ctermbg=LightRed
highlight GitGutterChange ctermfg=LightYellow ctermbg=LightYellow
highlight GitGutterChangeDelete ctermfg=LightRed ctermbg=LightRed

highlight CursorLineNr ctermbg=LightGray

:imap tn <Esc>
:map f gk
:map s gj
:map r h
:map t l

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

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=unnamedplus
set clipboard+=autoselect
