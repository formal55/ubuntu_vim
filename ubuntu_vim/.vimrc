set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

colorscheme molokai 
set t_Co=256


"设置工作目录为当前编辑文件的目录
set bsdir=buffer

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,cp936,cp950

" 设置leader为,
let mapleader=","
let maplocalleader=","

"隐藏工具栏和菜单栏
set guioptions-=m
set guioptions-=T

"搜索忽略大小写
set ignorecase

set guifont=Monospace\ 14
"set guifont=Powerline\ 14 

"搜索逐字符高亮
set incsearch
"搜素时高亮显示被找到的文本
set hlsearch

" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set smarttab
set history=1024

"行内替换
set gdefault

"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
set cursorline

"自动缩进
set noautoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

syntax on
set backspace=2

set nowritebackup

set nobackup

nnoremap <tab> <c-w><c-w>

"mm : 规范行首空格<cr>去除多余字符<cr>删除空白行<cr>规范行数
nmap mm :%s/\r//g<cr>

" no swap files
set noswapfile 





filetype off  
" 此处规定Vundle的路径  
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" vim 管理套件核心
Bundle 'gmarik/vundle'
  
" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

" 美化 status bar
Bundle 'vim-airline/vim-airline'

Bundle 'vim-airline/vim-airline-themes'

Bundle 'scrooloose/nerdtree'
" 於 nerdtree 中 tab 顯示相同 nerdtree
Bundle 'jistr/vim-nerdtree-tabs'

" cmake autocomplete
Bundle 'jansenm/vim-cmake'

" 程式結構 類似 taglist
Bundle 'majutsushi/tagbar'

Bundle 'kien/ctrlp.vim'

Bundle 'rking/ag.vim'

" 讓 vim 同時執行的套件能背景裡面執行
Bundle 'Shougo/vimproc.vim' 

filetype plugin indent on     " required! 



""""""""""""""""""""""""""""""
" YcmCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files =0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-/>'
let g:ycm_confirm_extra_conf=0
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_register_as_syntastic_checker = 1 " 用 ycm sync 
let g:ycm_show_diagnostics_ui = 1 " 用 ycm sync 
let g:ycm_error_symbol = 'X'
let g:ycm_warning_symbol = '**'
let g:ycm_always_populate_location_list = 0
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
	  \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}
nnoremap <leader>jl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
nmap <F3> :YcmForceCompileAndDiagnostics<CR>
nmap <F2> :YcmRestartServer<CR>



""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline_theme ='wombat'
" enable powerline-fonts
let g:airline_powerline_fonts = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1



""""""""""""""""""""""""""""""
" NERDTreeToggle
""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1 
let NERDTreeChDirMode = 2
let NERDTreeWinSize = 25
let NERDTreeWinPos = 'left'
nmap <F5>  :NERDTreeToggle<CR> 

" ------ NERDTreeTabs ---
"  Open NERDTreeTabs on terminal vim startup
let g:nerdtree_tabs_open_on_console_startup=1



""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 50
let g:tagbar_autofocus = 1

" all select
nmap <C-a> ggVG<CR>



""""""""""""""""""""""""""""""
" 生成一個 tag 文件
""""""""""""""""""""""""""""""
nmap <silent>1 <Esc>:!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
" CTRL+]  查找定義function的地方
" CTRL+ O 回去之前指標的位置 (不知道為什麼我不能用Ctrl+T回去)
" CTRL+ i 回去之後指標的位置
" ]]         到function開頭
" [[         到下一個function的開頭
" ctags in vim 
" Keyboard	Command Action
" Ctrl-] 或是 Ctrl-Left_MouseClick	跳到tag所定義的地方
" Ctrl-t 或是 Ctrl-Right_MouseClick         	返回
" :ts <tag>  <RET>	Search for a particular tag
" :tn	Go to the next definition for the last tag
" :tp	Go to the previous definition for the last tag
" :ts	List all of the definitions of the last tag

" 參數說明
" -R:ctags循环生成子目录的tags
" –c++-kinds=+px :ctags记录c++文件中的函数声明和各种外部和前向声明
" –fields=+iaS :ctags要求描述的信息，其中i表示如果有继承，则标识出父类；a表示如果元素是类成员的话，要标明其调用权限（即是public还是private）；S表示如果是函数，则标识函数的signature。
" –extra=+q:强制要求ctags做如下操作—如果某个语法元素是类的一个成员，ctags默认会给其记录一行，可以要求ctags对同一个语法元素再记一行，这样可以保证在VIM中多个同名函数可以通过路径不同来区分。



""""""""""""""""""""""""""""""
" 生成 cscope and ctags 文件
""""""""""""""""""""""""""""""
function Do_CsTag()
    if(executable("cscope") && has("cscope") )
       silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files"
        "silent! execute "!cscope -bkq -i cscope.files"
        "if filereadable("cscope.out")
         "  execute "cs add cscope.out"
	   "endif
	endif
endf
nmap <silent>2 <Esc>:call Do_CsTag()<CR>



""""""""""""""""""""""""""""""
" 生成 cscope and ctags 文件
""""""""""""""""""""""""""""""
" 引入有的 cscope
function Add_CsTag()
    if(executable("cscope") && has("cscope") )
        if filereadable("cscope.out")
           execute "cs add cscope.out"
	   endif
   endif
endf
nmap <silent>3 <Esc>:call Add_CsTag()<CR>


if has("cscope")
	" 不要跳出搜尋視窗
	set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
	set csto=1
	set cst
	set csverb
endif
	
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
	
nmap <C-z>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-z>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-z>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-z>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-z>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-z>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-z>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-z>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-z>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	
" 搜尋下一個
nnoremap <silent> csn :cn<CR>
" 搜尋上一個
nnoremap <silent> csp :cp<CR>
	
" ：cs find s ----查找C語言符號，即查找函數名、宏、枚舉值等出現的地方
" ：cs find g ----查找函數、宏、枚舉等定義的位置，類似ctags所提供的功能
" ：cs find d ----查找本函數調用的函數
" ：cs find c ----查找調用本函數的函數
" ：cs find t: ----查找指定的字符串
" ：cs find e - ---查找egrep模式，相當於egrep功能，但查找速度快多了
" ：cs find f ----查找並打開文件，類似vim的find功能
" ：cs find i ----查找包含本文件的文



""""""""""""""""""""""""""""""
" 我自己的 TODO ... 可列出當下的 project  快捷 : to , 但很慢 , 還是用 cscope 來找比較快 --> cs find t TODO
""""""""""""""""""""""""""""""
nnoremap <silent> to :vimgrep TODO **/*<CR>:cw<CR>



""""""""""""""""""""""""""""""
" 我自己的 取消高亮 ( 搜尋到的高亮 )
""""""""""""""""""""""""""""""
nnoremap <silent> cf :nohl<CR> 
	
