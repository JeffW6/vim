"~/.vimrc
""vim config file
"Date 2020-07-24
"Created by Jeff

"so ~/.vim/vim/asc.vim
"so ~/.vim/vim/skywind.vim

set nu

"使用空格来替换Tab
set expandtab

"设置所有的Tab和缩进为4个空格
set tabstop=4

"设定<<和>>命令移动时的宽度为4
set shiftwidth=4

"使得按退格键时可以一次删除4个空格
set softtabstop=4
set smarttab

"高亮显示匹配的括号([{和}])
set showmatch

"匹配括号高亮的时间（单位是十分之一秒）
set mat=2

"搜索时不区分大小写
"还可以使用简写（“:set ic”和“:set noic”）
set ignorecase

"用浅色高亮显示当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"输入的命令显示出来，看的清楚
set showcmd

""""""""""""""""""""""""""""""""""""
"""=>编码设置<="""
""""""""""""""""""""""""""""""""""""
"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"设置文件编码
set fileencodings=utf-8

"设置终端编码
set termencoding=utf-8

"设置语言编码
set langmenu=zh_CN.UTF-8
set helplang=cn

"设置高亮相关项"
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black
