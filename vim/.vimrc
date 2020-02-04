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
  let wiki = {}
  let wiki.path = '~/vimwiki/'
  let wiki.nested_syntaxes = {
    \  'rust': 'rust',
    \  'js': 'javascript',
    \  'docker': 'Dockerfile',
    \  'sh': 'sh',
    \  'go': 'go',
    \ }
  let g:vimwiki_list = [wiki]

Plug 'markonm/traces.vim'
Plug 'chip/vim-fat-finger'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'prettier/vim-prettier'
Plug 'simnalamburt/vim-mundo'

Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'

Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'

Plug 'dense-analysis/ale'
  set omnifunc=ale#completion#OmniFunc

  let g:ale_completion_enabled = 0
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_text_changed = 0  
  let g:ale_rust_cargo_use_clippy = 1
  let g:ale_change_sign_column_color = 1
  let g:ale_completion_tsserver_autoimport = 1

  let g:ale_linters = {
    \   'javascript': ['eslint', 'tsserver'],
    \   'rust': ['cargo', 'rls', 'rustc'],
    \   'go': ['gofmt', 'govet', 'golint', 'gopls'],
    \ }

  let g:ale_fixers = {
    \   'css': [],
    \   'javascript': ['eslint'],
    \   'rust': ['rustfmt'],
    \   'scss': [],
    \ }

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
  let g:clever_f_mark_char_color = "IncSearch"
  nnoremap ; <Plug>(clever-f-repeat-forward)
  nnoremap , <Plug>(clever-f-repeat-back)

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

syntax on
filetype plugin indent on

colo nord

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set completeopt=longest,menuone
set cursorline
set expandtab
set fillchars=vert:\│
set grepprg=rg\ -S\ --vimgrep
set hidden
set incsearch
set laststatus=2
set linespace=2
set nobackup
set noshowmode
set nostartofline
set noswapfile
set nowrap
set scrolloff=2
set smartcase
set splitbelow
set splitright
set timeoutlen=1000
set ttimeoutlen=0
set undodir=~/.vim/tmp/undo//
set undofile
set updatetime=100
set wildignore+=/node_modules/**
set wildmenu
set wildmode=longest:list,full

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

function! GetStatusLineMode() abort
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

augroup file_types
  autocmd!
  autocmd FileType gitcommit setlocal spell spelllang=en colorcolumn=72
  autocmd FileType markdown,tex,latex,vimwiki setlocal spell spelllang=en linebreak wrap
  autocmd! User FzfStatusLine setlocal statusline=fzf\ 🦆
  autocmd QuickFixCmdPost grep nested cwindow
augroup end

nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>

nnoremap <Tab> :Buffers<CR>
nnoremap <silent><leader>p :GFiles<CR>

nnoremap <silent> <Leader>s :grep <C-R><C-W><CR>
nnoremap <silent><leader>S :Rg<CR>

nnoremap <silent><leader>aa :ALEGoToDefinition<CR>
nnoremap <silent><leader>ad :ALEDetail<CR>
nnoremap <silent><leader>av :ALEGoToDefinitionInVSplit<CR>
nnoremap <silent><leader>as :ALEGoToDefinitionInSplit<CR>

nnoremap <leader>D :cd ~/Git/

nnoremap <silent><F6> :Goyo<CR>

nnoremap <silent><leader>' :term<CR>
nnoremap <leader>\ :vsp<CR>
nnoremap <leader><bar> :sp<CR>

nnoremap <silent><leader>gb :Twiggy<CR>
nnoremap <silent><leader>gl :GV<CR>
nnoremap <silent><leader>gs :vertical :G<CR>

nnoremap <silent><leader>P :Prettier<CR>

nnoremap <leader>rr :source ~/.vimrc<CR> 
nnoremap <leader>rp :source ~/.vimrc<CR> :PlugInstall<CR>

nnoremap <silent><leader>tf :TestFile<CR>

nnoremap <silent><leader>rf :RustFmt<CR>

nnoremap <silent><leader>u :MundoToggle<CR>
