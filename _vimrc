set nocompatible
filetype off

set rtp+=$VIM/vimfiles/bundle/vundle	" help 'rtp'
call vundle#rc('$VIM/vimfiles/bundle')

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'The-NERD-tree'
Bundle 'AutoComplPop'
Bundle 'SuperTab'
Bundle 'SuperTab-continued.'
Bundle 'minibufexpl.vim'
Bundle 'Tagbar'
Bundle 'EasyMotion'
Bundle 'surround.vim'
Bundle 'snipMate'
Bundle 'a.vim'
Bundle 'clang-complete'
Bundle 'surround.vim'
Bundle 'abolish.vim'
Bundle 'commentary.vim'
Bundle 'MatlabFilesEdition'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"**** My Setting Begins ****"
set autoindent
set smartindent
set nu               " 라인 숫자 보여주기

" 검색 기능 설정
set hls             "검색어 강조기능
set magic           " magic 기능 사용 (search 패턴에 특수문자 사용 "set showcmd " Show (partial) command in status line
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search

"set autowrite      " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)
 
set expandtab       "탭 문자를 공백 문자로 변환
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType make setlocal noexpandtab "Makefile 수정 중에는 TAB 사용
let g:EasyMotion_leader_key='`'
 
set clipboard=unnamed " 클립보드 사용
"set paste
"set fenc=utf-8
set fencs=utf-8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le
set nobackup
set noswapfile

colorscheme summerfruit256
set guifont=나눔고딕코딩:h12
syntax on
let skip_loading_mswin=1

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

