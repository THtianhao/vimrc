" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()
:let g:airline_theme='murmur'
:let g:airline#extensions#tabline#enabled = 1
:let g:airline_symbols_ascii = 1
set autoindent
set tabstop=4
" 按下tab的时候，vim缩进的空格数量
set shiftwidth=4
" tab转化为空格
set expandtab
set number
set relativenumber
" 设置折行
set wrap
" 只有遇到字符的时候才折行，单词不折行
set linebreak
" 搜索时高亮
set hlsearch
" 搜索的时候输入一个字符就跳到对应位置
set incsearch
" 搜索的时候忽略大小写
set ignorecase
" 退出之后还可以用u来撤销信息
set undofile

set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//
" 搜索的时候进行Tab进行提示
set wildmenu
set wildmode=longest:list,full
