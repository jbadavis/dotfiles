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
Plug 'tpope/vim-abolish'

Plug 'vimwiki/vimwiki'
  let wiki = {}
  let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
  let wiki.nested_syntaxes = {
    \  'rust': 'rust',
    \  'js': 'javascript',
    \  'docker': 'Dockerfile',
    \  'sh': 'sh',
    \  'go': 'go',
    \ }

Plug 'markonm/traces.vim'
Plug 'chip/vim-fat-finger'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'prettier/vim-prettier'

Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim'
Plug 'ajmwagar/vim-deus'
Plug 'wadackel/vim-dogrun'

Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
  let g:go_term_mode = 'split'
  let g:go_term_enabled = 1

  let g:go_highlight_extra_types = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_function_parameters = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_types = 1
  let g:go_highlight_variable_assignments = 1

  let g:go_fmt_command = "goimports"
  let g:go_fmt_fail_silently = 1

Plug 'dense-analysis/ale'
  set omnifunc=ale#completion#OmniFunc

  let g:ale_completion_enabled = 0
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_text_changed = 0
  let g:ale_change_sign_column_color = 1
  let g:ale_completion_autoimport = 1

  let g:ale_rust_cargo_use_clippy = 1
  let g:ale_rust_cargo_use_check = 1
  let g:ale_rust_rls_toolchain = ''

  let g:ale_scss_sasslint_executable = "sasslint"

  let g:ale_linters = {
    \   'typescript': ['eslint', 'tsserver'],
    \   'javascript': ['eslint', 'tsserver'],
    \   'typescriptreact': ['eslint', 'tsserver'],
    \   'rust': ['cargo', 'rls', 'rustc'],
    \   'go': ['gofmt', 'govet', 'golint', 'gopls'],
    \   'sh': ['shellcheck'],
    \   'markdown': ['mdl', 'writegood'],
    \ }

  let g:ale_fixers = {
    \   'css': [],
    \   'typescript': ['eslint'],
    \   'javascript': ['eslint'],
    \   'typescriptreact': ['eslint'],
    \   'rust': ['rustfmt'],
    \   'go': ['gofmt'],
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ }

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf
  autocmd! User FzfStatusLine setlocal statusline=fzf\ 🦆
  let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 } }

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
set softtabstop=2
set shiftwidth=2
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
set statusline+=%y\
set statusline+=%{strftime('%H:%M')}

" hi statusline guibg=CornflowerBlue guifg=FloralWhite

augroup file_types
  autocmd!
  autocmd FileType gitcommit setlocal spell spelllang=en colorcolumn=72
  autocmd FileType markdown,tex,latex,vimwiki setlocal spell spelllang=en linebreak wrap
  autocmd! User FzfStatusLine setlocal statusline=fzf\ 🦆
  autocmd QuickFixCmdPost grep nested cwindow
augroup end

nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>

nnoremap <Tab> :Buffers<CR>
nnoremap <silent><leader>p :Files<CR>

nnoremap <silent> <Leader>s :grep <C-R><C-W><CR>
nnoremap <silent><leader>S :Rg<CR>

nnoremap <silent><leader>aa :ALEGoToDefinition<CR>
nnoremap <silent><leader>av :ALEGoToDefinition -vsplit<CR>
nnoremap <silent><leader>as :ALEGoToDefinition -split<CR>
nnoremap <silent><leader>ad :ALEDetail<CR>
nnoremap <silent><leader>ar :ALEFindReferences<CR>
nnoremap <silent><leader>at :ALEGoToTypeDefinition<CR>

nnoremap <leader>D :cd ~/Git/nandos-platform/lib/online-ordering-ui/<CR>

nnoremap <silent><F6> :Goyo<CR>

nnoremap <silent><leader>' :term<CR>

nnoremap <silent><leader>td :term yarn dev<CR>
nnoremap <silent><leader>tt :term yarn test<CR>
nnoremap <silent><leader>tw :term yarn test:watch<CR>
nnoremap <silent><leader>tv :term yarn validate<CR>

nnoremap <leader>\ :vsp<CR>
nnoremap <leader><bar> :sp<CR>

nnoremap <silent><leader>gb :Twiggy<CR>
nnoremap <silent><leader>gl :GV<CR>
nnoremap <silent><leader>gs :vertical :G<CR>
nnoremap <leader>gpf :G push origin --force-with-lease
nnoremap <leader>gpo :G push origin
nnoremap <leader>gpp :G push
nnoremap <leader>gco :G checkout -b
nnoremap G :G

nnoremap <silent><leader>P :Prettier<CR>

nnoremap <leader>rr :source ~/.vimrc<CR>
nnoremap <leader>rp :source ~/.vimrc<CR> :PlugInstall<CR>
nnoremap <leader>ru :source ~/.vimrc<CR> :PlugUpdate<CR>

nnoremap <silent><leader>tf :TestFile<CR>

nnoremap <silent><leader>rf :RustFmt<CR>

nnoremap <silent><leader>u :MundoToggle<CR>
