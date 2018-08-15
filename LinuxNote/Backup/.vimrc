syntax on
set tabstop=4 
"用于设置Tab键宽度,默认为 8 
set shiftwidth=4
colorscheme slate
"浅色高亮当前行
set cul
set history=1000
"自动缩进
set autoindent 
" 加强版缩进
set smartindent
"搜索时高亮显示被找到的文本
set hlsearch
"输入关键字的时候实时高亮显示
set incsearch
"在状态行中显示（部分）命令
set showcmd
"使用鼠标
set mouse=a
"总是显示状态行
set laststatus=2 

"######## 状态栏 ########

function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

set statusline=%<%1*[BF-%n]%*
set statusline+=%2\*[Total:%{Buf_total_num()}]%*  "+ 号防止覆盖前面的选项
set statusline+=%#filename#\ %t\ %*
set statusline+=%#filetype#\ %Y\ %*
set statusline+=%#filesystem#\ %{&ff}\ %* 
set statusline+=%#globalline#\ %%
set statusline+=%=%#coding#\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \\"}\ %*
set statusline+=%4*\|\ %l:%c%V\ \|%*
set statusline+=%#position#\ \ %m%r%w\ %p%%\|%*
set statusline+=%#scrollpstn#\ %P%*

hi User1 cterm=None ctermfg=232 ctermbg=120 
hi User2 cterm=None ctermfg=169 ctermbg=239 
hi User4 cterm=None ctermfg=249 ctermbg=239 
hi globalline cterm=None ctermfg=249 ctermbg=239 
hi filename cterm=None ctermfg=129 ctermbg=152 
hi filetype cterm=None ctermfg=17 ctermbg=140 
hi filesystem cterm=None ctermfg=129 ctermbg=209 
hi position cterm=None ctermfg=249 ctermbg=239 
hi coding cterm=None ctermfg=249 ctermbg=239 
hi scrollpstn cterm=None ctermfg=249 ctermbg=243

"状态栏剩余部分的颜色取决于最后一个选项的颜色和操作范围

"######## 状态栏 END #######
