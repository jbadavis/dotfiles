call plug#begin('~/.vim/plugged')

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'ervandew/supertab'

Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'

Plug 'vimwiki/vimwiki'

Plug 'markonm/traces.vim'
Plug 'chip/vim-fat-finger'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-clap'
Plug 'prettier/vim-prettier'

Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'

Plug 'sheerun/vim-polyglot'

Plug 'dense-analysis/ale'
  set omnifunc=ale#completion#OmniFunc

  let g:ale_fix_on_save = 1
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_enter = 0
  let g:ale_linters = {'javascript': ['eslint', 'flow']}
  let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \   'css': [],
    \   'scss': [],
    \ }
  let g:ale_completion_enabled = 0

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf

  autocmd! User FzfStatusLine setlocal statusline=fzf\ 🦆

  let g:fzf_layout = { 'window': '20new' }
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
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
    \ 'header':  ['fg', 'Comment']
    \ }

Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetDir = "~/.vim/snippets/"
  let g:UltiSnipsSnippetDirectories = ['~/.vim/ultiSnips', 'UltiSnips']

Plug 'sodapopcan/vim-twiggy', {'on': ['Twiggy'] }
  let g:twiggy_local_branch_sort = 'mru'
  let g:twiggy_group_locals_by_slash = 0
  let g:twiggy_num_columns = 50
  let g:twiggy_show_full_ui = 0

Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 2000

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  let g:goyo_width = 120

Plug 'rhysd/clever-f.vim'
  map ; <Plug>(clever-f-repeat-forward)
  map , <Plug>(clever-f-repeat-back)

Plug 'janko/vim-test'
  let test#strategy = "vimterminal"

call plug#end()

if has("termguicolors")
  set termguicolors
endif

if has("gui_running")
  set vb t_vb=
  set guioptions=
  set gfn=Fira\ Code\ Retina:h14
endif

colo nord

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
set grepprg=rg\ -S\ --vimgrep

set backupdir=~/.vim/tmp/backup//
set undodir=~/.vim/tmp/undo//

set fillchars=vert:\│

syntax on

filetype plugin on

function! ToggleTabSpacing()
  if &l:tabstop == 4
    set tabstop=2
    set shiftwidth=2

    let g:prettier#config#tab_width=2
  else
    set tabstop=4
    set shiftwidth=4

    let g:prettier#config#tab_width=4
  endif
endfunction

nnoremap <silent><F5> :call ToggleTabSpacing()<CR>

function! GetStatusLineMode()
  return {
    \ '__' : '------',
    \ 'c'  : 'COMMAND',
    \ 'i'  : 'INSERT',
    \ 'ic' : 'INSERT COMPL',
    \ 'ix' : 'INSERT COMPL',
    \ 'n'  : 'NORMAL',
    \ 'ni' : '(INSERT)',
    \ 'no' : 'OP PENDING',
    \ 'r'  : 'REPLACE',
    \ 'R'  : 'REPLACE',
    \ 'Rv' : 'V REPLACE',
    \ 's'  : 'SELECT',
    \ 'S'  : 'S-LINE',
    \ '' : 'S-BLOCK',
    \ 't'  : 'TERMINAL',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V-LINE',
    \ '' : 'V-BLOCK',
    \ }[mode()]
endfunction

set statusline=\ 
set statusline+=%{GetStatusLineMode()}
set statusline+=\ 
set statusline+=%.30F
set statusline+=\ 
set statusline+=%=
set statusline+=%y

autocmd FileType gitcommit setlocal spell spelllang=en colorcolumn=72
autocmd FileType markdown,tex,latex,vimwiki setlocal spell spelllang=en linebreak wrap
autocmd! User FzfStatusLine setlocal statusline=fzf\ 🦆
autocmd QuickFixCmdPost grep nested cwindow

nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>

nnoremap <Tab> :Clap buffers<CR>
nnoremap <silent><leader>p :GFiles<CR>

nnoremap <silent> <Leader>s :grep <C-R><C-W><CR>
nnoremap <silent><leader>S :Rg<CR>

nnoremap <leader>dd :ALEGoToDefinition<CR>
nnoremap <leader>dv :ALEGoToDefinitionInVSplit<CR>
nnoremap <leader>ds :ALEGoToDefinitionInSplit<CR>

nnoremap <leader>D :cd ~/Git/

nnoremap <silent><F6> :Goyo<CR>

nnoremap <silent><leader>' :vertical :term<CR>
nnoremap <leader>\ :vsp<CR>
nnoremap <leader><bar> :sp<CR>

nnoremap <silent><leader>gb :Twiggy<CR>
nnoremap <silent><leader>gl :GV<CR>
nnoremap <silent><leader>gs :vertical :G<CR>

nnoremap <silent><leader>P :Prettier<CR>

nnoremap <leader>rr :source ~/.vimrc<CR> 
nnoremap <leader>rp :source ~/.vimrc<CR> :PlugInstall<CR>

nnoremap <silent><leader>tf :TestFile<CR>
