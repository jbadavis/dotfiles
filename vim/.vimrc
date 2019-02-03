call plug#begin('~/.vim/plugged')

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/gina.vim'
Plug 'markonm/traces.vim'
Plug 'prettier/vim-prettier'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'

Plug 'w0ng/vim-hybrid'
Plug 'rakr/vim-two-firewatch'
Plug 'nightsense/snow'
Plug 'jbadavis/nord-vim', { 'branch': 'develop' }

Plug 'w0rp/ale'
  let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'css': [],
      \   'scss': [],
      \}
  let g:ale_fix_on_save = 1
  " let g:ale_lint_on_text_changed = 'never'
  let g:ale_completion_enabled = 1

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

  let $FZF_DEFAULT_OPTS .= ' --inline-info --reverse'
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetDir = "~/.vim/snippets/"
  let g:UltiSnipsSnippetDirectories = ['~/.vim/ultiSnips', 'UltiSnips']

Plug 'sodapopcan/vim-twiggy', {'on': ['Twiggy'] }
  let g:twiggy_local_branch_sort = 'mru'
  let g:twiggy_group_locals_by_slash = 0
  let g:twiggy_num_columns = 50
  let g:twiggy_show_full_ui = 0

call plug#end()

if has("termguicolors")
  set termguicolors
endif

if has("gui_running")
  au! GUIEnter * set vb t_vb=
  set guioptions=
  set macligatures
  set gfn=Fira\ Code\ Retina:h12
endif

colo nord
let g:nord_comment_brightness = 12

set nocompatible
set autoindent
set autoread
set clipboard=unnamed
set cmdheight=2
set expandtab
set incsearch
set laststatus=2
set linespace=2
set nostartofline
set nowrap
set ruler
set scrolloff=2
set shiftwidth=2
set smartindent
set softtabstop=2
set splitbelow
set splitright
set undofile
set updatetime=100
set wildignore+=/node_modules/**
set wildmenu
set wildmode=longest:list,full
set noshowmode
set background=dark
set timeoutlen=1000
set ttimeoutlen=0
set noswapfile

set hidden
set completeopt=longest,menuone
set smartcase
set cursorline

set backupdir=~/.vim/tmp/backup//
set undodir=~/.vim/tmp/undo//

set fillchars=vert:\│

syntax on

filetype plugin on

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType gitcommit setlocal spell spelllang=en
autocmd FileType markdown,tex,latex setlocal spell spelllang=en linebreak wrap

nnoremap <Tab> :Buffers<CR>
nnoremap <silent><leader>p :GFiles<CR>
nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>

nnoremap <silent> <Leader>s :Rg <C-R><C-W><CR>
nnoremap <silent><leader>S :Rg<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>D :cd ~/Git/asos-web-

nnoremap <F6> :Goyo<CR>

nnoremap <silent><leader>' :term<CR>
nnoremap <leader>\ :vsp<CR>
nnoremap <leader><bar> :sp<CR>

nnoremap <silent><leader>gb :Twiggy<CR>
nnoremap <silent><leader>gl :GV<CR>
nnoremap <silent><leader>gs :G<CR> :tabnew %<CR>

nnoremap <silent><leader>an :ALENext<CR>
nnoremap <silent><leader>ap :ALEPrevious<CR>

nnoremap <leader>R :source ~/.vimrc<CR> :PlugInstall<CR>

