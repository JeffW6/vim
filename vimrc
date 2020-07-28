"~/.vimrc
"vim config file
"Date 2020-07-24
"Created by Jeff
"so ~/.vim/vim/asc.vim
"so ~/.vim/vim/skywind.vim

call plug#begin('~/.vim/plugged')
Plug 'universal-ctags/ctags' "符号索引
Plug 'ludovicchabant/vim-gutentags' "自动索引
Plug 'Yggdroot/LeaderF' "函数列表，文件切换
call plug#end()

"参考：http://michael728.github.io/2018/12/02/tools-vim-plugin-config/ 

"""""for Ctags""""" 
set tags=./.tags;,.tags "Set for Ctags.

"""""vim-gutentags BEGIN"""""

"gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project'] 

"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags' 

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif


"将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags 

"配置 ctags 的参数 
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q'] 
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px'] 
let g:gutentags_ctags_extra_args += ['--c-kinds=+px'] 

"检测 ~/.cache/tags 不存在就新建 
if !isdirectory(s:vim_tags) 
    silent! call mkdir(s:vim_tags, 'p')
endif

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_define_advanced_commands = 1 "查看gtags日志，错误输出
let $GTAGSLABEL='native' "禁用 pygments
"""""vim-gutentags END"""""

syntax on "自动语法高亮
set cursorline " 突出显示当前行
set nocompatible "关闭vi兼容模式
set nu  "显示行号  
set expandtab "使用空格来替换Tab
set tabstop=4 "设置所有的Tab和缩进为4个空格
set shiftwidth=4 "设定<<和>>命令移动时的宽度为4
set softtabstop=4 "使得按退格键时可以一次删除4个空格
set smarttab
set smartindent "开启新行时使用智能自动缩进
set magic "设置魔术
set showmatch "高亮显示匹配的括号([{和}])
set mat=2 "匹配括号高亮的时间（单位是十分之一秒）
set ignorecase "搜索时不区分大小写,还可以使用简写（“:set ic”和“:set noic”）
autocmd InsertLeave * se nocul "用浅色高亮显示当前行
autocmd InsertEnter * se cul
set showcmd "输入的命令显示出来，看的清楚

""""""""""""""""""""""""""""""""""""
"""=>编码设置<="""
""""""""""""""""""""""""""""""""""""
set encoding=utf-8 "设置编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8 "设置文件编码
set termencoding=utf-8 "设置终端编码
set helplang=cn
set fileformat=unix "从Win上复制文件时，避免换行符错误
"设置高亮相关项"
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black
