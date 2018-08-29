" Packages
" ---
" easymotion/vim-easymotion
" ervandew/supertab
" junegunn/fzf.vim
" mxw/vim-jsx
" pangloss/vim-javascript
" prettier/vim-prettier
" tpope/vim-fugitive
" tpope/vim-projectionist
" w0rp/ale

syntax on
filetype plugin on

set background=dark

let g:hybrid_custom_term_colors = 1
colorscheme hybrid

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set cursorline
set expandtab
set hlsearch
set incsearch
set laststatus=2
set linespace=2
set nostartofline
set nowrap
set omnifunc=syntaxcomplete#Complete
set path+=**  
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

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

let g:SuperTabDefaultCompletionType = "context"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetDir = "~/.vim/snippets/"
let g:UltiSnipsSnippetDirectories = ['~/.vim/ultiSnips', 'UltiSnips']

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': [],
\   'scss': [],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

set rtp+=/usr/local/opt/fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   ' --color-path="" -p ~/.ignore',
      \  <bang>0 ? fzf#vim#with_preview('up:40%')
      \        : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0
      \ )

map <Space> <leader>

map <leader> <Plug>(easymotion-prefix)

nnoremap <Tab> :Buffers<CR>
nnoremap <S-Tab> :bn<CR>

nnoremap <silent><leader>p :GFiles<CR> 
nnoremap <silent><leader>f :Ag<CR>
nnoremap <silent><leader>c :Commits<CR> 

nnoremap <silent><leader>' :terminal<CR> 

nnoremap <silent><leader>\ :vsp<CR> 
nnoremap <silent><leader><bar> :sp<CR> 

nnoremap <silent><leader>n :nohlsearch<CR>

nnoremap <silent><leader>j <C-W><C-J>
nnoremap <silent><leader>k <C-W><C-K>
nnoremap <silent><leader>l <C-W><C-L>
nnoremap <silent><leader>h <C-W><C-H>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>m :Magit<CR>

nnoremap <leader>d :ALEGoToDefinition<CR>
