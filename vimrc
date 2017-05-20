"Last Change: 2011年08月02日 15时13分
"
" Version:     1.80
"========================================================================="
let template_load=1
let template_tags_replacing=1
let T_AUTHOR="wh"
let T_DATE_FORMAT="%Y-%m-%d %H:%m:%S"
"==================================================================i=======
set nocompatible            " 关闭 vi 兼容模式

" 配置vundule
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

syntax on                   " 自动语法高亮
"colorscheme monokai        " 设定配色方案
set number                  " 显示行号
set relativenumber          " 相对行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=1             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
                            " 设置在状态行显示的信息
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldmethod=indent        " 设置语法折叠
"set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=99
"set foldclose=all           " 设置为自动关闭折叠                            

" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

"关于tab的快捷键
map tn :tabnext<cr>
map tp :tabprevious<cr>
map td :tabnew .<cr>
map te :tabedit
map tc :tabclose<cr>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict

if MySys() == "windows"                " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let python_highlight_all=1

" ctrlp -----------------------------------------------------------------
Bundle "kien/ctrlp.vim"


" fugitive ----------------------------------------------------------------
Bundle "tpope/vim-fugitive"
" Gstatus/Gdiff


" indentpython ----------------------------------------------------
Bundle "vim-scripts/indentpython.vim"


" nerdtree -----------------------------------------------------------------
Bundle "scrooloose/nerdtree"
let NERDTreeIgnore=['\.pyc$', '\.swp$', '\.pyo$']
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1
nmap <F5> :NERDTreeToggle<CR>"
nmap ,t :NERDTreeFind<CR>

" nerdtree-tabs -----------------------------------------------------------------
Bundle "jistr/vim-nerdtree-tabs"
nmap <F5> :NERDTreeTabsToggle<CR>

" nerdtree-git----------------------------------------------------------------
Bundle "Xuyuanp/nerdtree-git-plugin"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "✚",
    \ "Untracked" : "??",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" powerline -----------------------------------------------------------------
Bundle "Lokaltog/vim-powerline"
let g:Powerline_symbols = 'fancy'           " 状态栏样式/fancy/unicode/compatible
let g:Powerline_stl_path_style = 'filename' " 文件全路径/filename/short/relative/full
set t_Co=256

" syntastic --------------------------------------------------------------------
Bundle "scrooloose/syntastic"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗' 
let g:syntastic_warning_symbol = '⚠' 
let g:syntastic_style_error_symbol = 'S✗' 
let g:syntastic_style_warning_symbol = 'S⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nmap <leader>e :Errors<CR>
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>

" SimpylFold 代码折叠 --------------------------------------------------------------------
Bundle "tmhedberg/SimpylFold"
let g:SimpylFold_docstring_preview=1
nnoremap <space> za


" MiniBufExplorer ---------------------------------
Bundle "fholgado/minibufexpl.vim"
let g:miniBufExplMapCTabSwitchBufs=1   
let g:miniBufExplMapWindowNavVim=1   
let g:miniBufExplMapWindowNavArrows=1   
let g:miniBufExplModSelTarget=1
"let g:miniBufExplMoreThanOne=0
"

" python-mode ---------------------------------------
Bundle "klen/python-mode"
let g:pymode=1								" open all plugins on python-mode
let g:pymode_options_colorcolumn=1		" 79 display the warning line for 79
let g:pymode_virtualenv=0
let g:pymode_run=0
let g:pymode_breakpoint=0
let g:pymode_lint=0							" code checking
let g:pymode_rope = 0
let g:pymode_syntax=1

" signify ----------------------
Plugin 'mhinz/vim-signify'
"this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" window chooser -----------------------------------
Bundle "t9md/vim-choosewin"
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable=1


" tabman ---------------
Bundle "kien/tabman.vim"
let g:tabman_toggle='tl'
let g:tabman_focus='tf'



" youcompleteme ----------------------------
Bundle 'Valloric/YouCompleteMe'
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_global_ycm_extra_conf = $HOME."/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
"let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow

set term=screen-256color



" fuzzy filter (fzf)
Bundle 'junegunn/fzf', {"dir": '~/.fzf', 'do':"./install --all"}
