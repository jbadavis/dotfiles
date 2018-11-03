call plug#begin('~/.vim/plugged')

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'ervandew/supertab'
Plug 'jreybert/vimagit', {'on': ['Magit']}
Plug 'junegunn/goyo.vim', {'on': ['Goyo']}
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive', {'on': ['Gstatus']}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/denite.nvim', {'on': ['Denite']}
Plug 'hail2u/vim-css3-syntax'
Plug 'lambdalisue/gina.vim'

Plug 'w0ng/vim-hybrid'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-two-firewatch'
Plug 'jnurmine/zenburn'
Plug 'nightsense/snow'
Plug 'cocopon/iceberg.vim'

Plug 'w0rp/ale'
  let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'css': [],
      \   'scss': [],
      \}
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_text_changed = 'never'

Plug 'dyng/ctrlsf.vim'
  let g:ctrlsf_winsize = '30%'
  let g:ctrlsf_default_root = 'project'
  let g:ctrlsf_default_view_mode = 'compact'
  let g:ctrlsf_auto_close = {
      \    "normal" : 0,
      \    "compact": 0
      \}
  let g:ctrlsf_auto_focus = {
      \    "at": "start"
      \}

Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf

  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noruler
     \| autocmd BufLeave <buffer> set laststatus=2 ruler

  let g:fzf_layout = { 'down': '~25%' }
  let $FZF_DEFAULT_OPTS .= ' --inline-info --border'

  command! -bang -nargs=* Ag
      \call fzf#vim#ag(
      \    <q-args>, ' --color-path="" -p ~/.ignore',
      \    <bang>0 ? fzf#vim#with_preview('up:40%')
      \            : fzf#vim#with_preview('right:50%:hidden', '?'),
      \    <bang>0)

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

Plug 'airblade/vim-gitgutter'
  let g:gitgutter_signs = 0

Plug 'sodapopcan/vim-twiggy', {'on': ['Twiggy']}
  let g:twiggy_local_branch_sort = 'mru'
  let g:twiggy_group_locals_by_slash = 0
  let g:twiggy_num_columns = 50

call plug#end()

if has("gui_running")
  au! GUIEnter * set vb t_vb=
  set guioptions=
  set macligatures
  set gfn=Fira\ Code\ Retina:h12

  colo iceberg
  let g:airline_theme='iceberg'
else
  colo hybrid
  let g:hybrid_reduced_contrast = 1
endif

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set cursorline
set expandtab
set incsearch
set laststatus=2
set linespace=2
set nostartofline
set nowrap
set ruler
set scrolloff=2
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set splitbelow
set splitright
set statusline+=%F
set undofile
set updatetime=100
set wildignore+=/node_modules/**
set wildmenu
set wildmode=longest:list,full
set noshowmode
set termguicolors
set background=dark

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

syntax on

filetype plugin on
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType gitcommit setlocal spell spelllang=en
autocmd FileType markdown,tex,latex setlocal spell spelllang=en linebreak wrap

nnoremap <Tab> :Buffers<CR>
nnoremap <silent><leader>f :Ag<CR>
nnoremap <silent><leader>p :GFiles<CR>

nnoremap <leader>s :CtrlSF<CR>
nnoremap <leader>S :CtrlSF 

nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <F6> :Goyo<CR>

nnoremap <silent><leader>' :term<CR><C-W>L
nnoremap <leader>\ :vsp<CR>
nnoremap <leader><bar> :sp<CR>

nnoremap <leader>ht :GitGutterSignsToggle<CR>
nnoremap <leader>gb :Twiggy<CR>
nnoremap <leader>gd :Git! diff --staged<CR>
nnoremap <leader>gl :GV<CR>
nnoremap <silent><leader>gs :GitGutterSignsEnable<CR> :Gstatus<CR>
