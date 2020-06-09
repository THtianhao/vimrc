" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'       " add beautiful icons besides files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
Plug 'preservim/nerdcommenter'
Plug 'leafgarland/typescript-vim'
"wmate Initialize plugin system
call plug#end()
"======= keymap start =======
let mapleader=","
map <C-n> :NERDTreeToggle<CR>
map <leader>v "+gp
map <leader>c "+y
"======= keymap end =======

"======= nerdTree settting start ======
:let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
:let g:NERDTreeShowBookmarks=1
:let g:NERDTreeShowIgnoredStatus = 1
" 不显示隐藏文件
:let g:NERDTreeHidden=0
" 过滤: 所有指定文件和文件夹不显示
:let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"======== nerdtree setting end  ======
"======== ctrlp setting start ======
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta,*.png
":let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
":let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|DS_Store|meta)$'
":let g:ctrlp_by_filename = 1
" 默认打开缓冲区
let g:ctrlp_cmd = 'exe "CtrlP".get(["Buffer", "", "MRU"], v:count)'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|Ds_Store|meta|png)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
"function! IsNERDTreeOpen()
    "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"function! SyncTree()
    "if &modifiable && ISNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        "NERDTreeFind
        "wincmd p
    "endif
"endfunction
"autocmd BufEnter * call SyncTree()
"======== ctrlp setting end ====== 
"======== vim setting start ========
colorscheme default
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
"set backupdir=~/.vim/.backup//
"set undodir=~/.vim/.undo//
" 搜索的时候进行Tab进行提示
set wildmenu
set wildmode=longest:list,full
"======== vim setting end ======
"======= coc setting start =======
function! SetupCommandAbbrs(from, to)
      exec 'cnoreabbrev <expr> '.a:from
              \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
              \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
   let col = col('.') - 1
     return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
           \ pumvisible() ? "\<C-n>" :
           \ <SID>check_back_space() ? "\<Tab>" :
           \ coc#refresh()
"======= coc setting end======= 
:let g:airline_theme='murmur'
:let g:airline#extensions#tabline#enabled = 1
:let g:airline_symbols_ascii = 1
