" Ref: https://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless

set nocompatible
packloadall "used for prettier

let mapleader=" "
let maplocalleader=" "

call plug#begin(stdpath('data') . '/plugged')
    Plug 'vim/colorschemes'
    Plug 'lambdalisue/fern.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-sleuth'

    " Git plugin
    Plug 'tpope/vim-fugitive'

    " Control surroundings
    Plug 'tpope/vim-surround'

    Plug 'scrooloose/nerdcommenter'

    " Format
    Plug 'dense-analysis/ale'
    "Plug 'prettier/vim-prettier', { 
      "\ 'do': 'npm install',
      "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
    
    " Language Plugins
    Plug 'ekalinin/dockerfile.vim'
    Plug 'hdima/python-syntax'
    Plug 'davidhalter/jedi-vim'

    " Theme
    Plug 'rainglow/vim'
    Plug 'morhetz/gruvbox'
call plug#end()

let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'python': ['black','autopep8','add_blank_lines_for_python_control_statements'],
    \}
let g:python3_host_prog="/home/linuxbrew/.linuxbrew/bin/python3"

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
set background=dark
colorscheme gruvbox

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" .............................................................................
" junegunn/fzf.vim
" .............................................................................
" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" .............................................................................
" lambdalisue/fern.vim
" .............................................................................
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden:toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
  nmap <buffer> c <Plug>(fern-action-clipboard-copy)
  nmap <buffer> p <Plug>(fern-action-clipboard-paste)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Perform tcd on the root node after enter or leave action
nmap <buffer> <Plug>(fern-my-enter-and-tcd)
      \ <Plug>(fern-action-enter)
      \ <Plug>(fern-wait)
      \ <Plug>(fern-action-tcd:root)

nmap <buffer> <Plug>(fern-my-leave-and-tcd)
      \ <Plug>(fern-action-leave)
      \ <Plug>(fern-wait)
      \ <Plug>(fern-action-tcd:root)

