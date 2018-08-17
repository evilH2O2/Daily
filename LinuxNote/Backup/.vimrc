syntax on
" set nu
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

function! s:hi(name, cmfg, cmbg)
	execute printf('hi %s ctermfg=%d ctermbg=%d', a:name, a:cmfg, a:cmbg)
endfunction

function! FileSize()
	let bytes = getfsize(expand('%:p'))
	if (bytes >= 1024)
		let kbytes = bytes / 1024
	endif
	if (exists('kbytes') && kbytes >= 1024)
		let mbytes = kbytes / 1024.0
	endif

	if bytes <= 0
		return '0'
	endif
	if (exists('mbytes'))
		return mbytes . 'MB'
	elseif (exists('kbytes'))
		return (kbytes . "KB")
	else
		return bytes . ' B'
	endif
endfunction

function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction


let logo = ["\u2721", "\u2618", "\u2622", "\u273F", "\u2724"]
" logo = [✡, ☘, ☢, ✿, ✤]


" 左
set statusline=
set statusline+=%#buf#\❖\ \B-%n\ \%*
set statusline+=%#tot#\⌘\ \TOT:%{Buf_total_num()}\ %* 
set statusline+=%#filename#\⚝\ %t\ %*
set statusline+=%#filetype#\%{logo[3]}\ \ %Y\ %*
set statusline+=%#filesystem#\%{logo[2]}\ %{&ff}\ %*
set statusline+=%#filesize#\ %{FileSize()}\ %*
set statusline+=%#globalline#\ \ \ \ \ \ >^_^<

" 右
set statusline+=%=
set statusline+=%#coding#\ %{(&fenc!=''?&fenc:&enc)}\ %*
set statusline+=%#hanglie#\|\ %l:%c%V\ \|%*
set statusline+=%#position#\ \ %m%r%w\ %p%%\|%*
set statusline+=%#scrollpstn#\ %P%*
set statusline+=%#time#\ %{logo[0]}\ %{strftime('%R')}\ %* 



call s:hi('buf', 226, 244)
call s:hi('tot', 51, 241)
call s:hi('filename', 231, 245)
call s:hi('filetype', 197, 241)
call s:hi('filesystem', 0, 250)
call s:hi('filesize', 228, 240)
call s:hi('globalline', 255, 243)

call s:hi('coding', 232, 243)
call s:hi('hanglie', 232, 243)
call s:hi('position', 232, 243)
call s:hi('scrollpstn', 232, 246)
call s:hi('time', 232, 249)


"######## 状态栏 END #######
