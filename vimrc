"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████

"                ╔══════════════════════════════════════════╗
"                ║           ⎋ VIM CONFIG FILE  ⎋           ║
"                ║           ⎋ JEFF CREATE      ⎋           ║
"                ║           ⎋ 2020-07-24       ⎋           ║
"                ╚══════════════════════════════════════════╝
"
"
" so ~/.vim/vim/asc.vim
" so ~/.vim/vim/skywind.vim

set nocompatible    " 关闭vi兼容模式(必须设置在最开头)

call plug#begin('~/.vim/plugged')
Plug 'universal-ctags/ctags' " 符号索引
Plug 'ludovicchabant/vim-gutentags' " 自动索引
Plug 'Yggdroot/LeaderF' " 函数列表，文件切换
Plug 'ycm-core/YouCompleteMe' " 代码补全
Plug 'skywind3000/asyncrun.vim' " Async Compile and Run

Plug 'kana/vim-textobj-user'    " textobj-user全家桶
Plug 'kana/vim-textobj-indent' 
Plug 'kana/vim-textobj-syntax' 
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] } 
Plug 'sgur/vim-textobj-parameter'

Plug 'octol/vim-cpp-enhanced-highlight' " 编辑辅助

" 配色方案 http://vimcolors.com/
Plug 'gryf/wombat256grf' 
Plug 'franbach/miramare'
Plug 'sainnhe/sonokai'

call plug#end()

" 参考：http://michael728.github.io/2018/12/02/tools-vim-plugin-config/ 

"""""for Ctags""""" 
set tags=./.tags;,.tags " Set for Ctags.

"""""vim-gutentags BEGIN"""""
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project'] 

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags' 

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif


" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags 

" 配置 ctags 的参数 
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q'] 
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px'] 
let g:gutentags_ctags_extra_args += ['--c-kinds=+px'] 

" 检测 ~/.cache/tags 不存在就新建 
if !isdirectory(s:vim_tags) 
    silent! call mkdir(s:vim_tags, 'p')
endif

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_define_advanced_commands = 1 " 查看gtags日志，错误输出
let $GTAGSLABEL='native' " 禁用 pygments
"""""vim-gutentags END"""""

"""""YCM Begin"""""
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
"""""YCM End"""""


"""""Asyncrun Begin"""""
let g:asyncrun_open = 10
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>
" noremap <F7> :AsyncRun gcc "$(VIM_FILEPATH)" -o "$(VIM_PATHNOEXT)" <cr>
"""""Asyncrun End"""""


" change colorscheme
"""""""""""""""""""""""""""""""""""""
" colorscheme wombat256grf
"""""""""""""""""""""""""""""""""""""
" set termguicolors  " important!! 
" " the configuration options should be placed before `colorscheme miramare`
" let g:miramare_enable_italic = 1
" let g:miramare_disable_italic_comment = 1
" colorscheme miramare
"""""""""""""""""""""""""""""""""""""
" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai
"""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""

syntax on           " 自动语法高亮
set cursorline      " 突出显示当前行
set nu              " 显示行号  
set expandtab       " 使用空格来替换Tab
set tabstop=4       " 设置所有的Tab和缩进为4个空格
set shiftwidth=4    " 设定<<和>>命令移动时的宽度为4
set softtabstop=4   " 使得按退格键时可以一次删除4个空格
set smarttab
set smartindent     " 开启新行时使用智能自动缩进
set magic           " 设置魔术
set showmatch       " 高亮显示匹配的括号([{和}])
set mat=2           " 匹配括号高亮的时间（单位是十分之一秒）
set ignorecase      " 搜索时不区分大小写,还可以使用简写（“:set ic”和“:set noic”）
autocmd InsertLeave * se nocul " 用浅色高亮显示当前行
autocmd InsertEnter * se cul
set showcmd         " 输入的命令显示出来，看的清楚
set showmode        " Show current mode in command-line.
set incsearch       " Highlight while searching with / or ?.
set hlsearch        " Keep matches highlighted.
set splitbelow      " Open new windows below the current window.
set splitright      " Open new windows right of the current window.
filetype plugin indent on  " Load plugins according to detected filetype.
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set ruler           " 总是显示光标位置
" set paste
" set nopaste

""""""""""""""""""""""""""""""""""""
"""=>编码设置<="""
""""""""""""""""""""""""""""""""""""
set encoding=utf-8 " 设置编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8 " 设置文件编码
set termencoding=utf-8 " 设置终端编码
set helplang=cn
set fileformat=unix " 从Win上复制文件时，避免换行符错误
" 设置高亮相关项"
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black

" 按键映射
" inoremap " ""<Esc>i
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" nnoremap <F9> <Esc>:LeaderfFunction<CR>

" noremap <a-p> :LeaderfFunction!<cr> " Alt + P 无法工作
noremap <F9> :LeaderfFunction!<cr>
" noremap <M-p> :LeaderfFunction!<cr> " Can't Work

" The following config is for myself project.
" For Gstreamer:
set tags+=/usr/include/gstreamer-1.0/gst/.tags
noremap <F7> :AsyncRun gcc "$(VIM_FILEPATH)" -o "$(VIM_PATHNOEXT)" `pkg-config --cflags --libs gstreamer-1.0` <cr>

"""" END """"
