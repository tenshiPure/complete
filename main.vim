set completefunc=MyComplete

function! MyComplete(findstart, base)
	if a:findstart
		return 0
	else
		" 試しに動かしてみる
		return GetWords(a:base)
	endif
endfunction

function! GetWords(base)
	if a:base == 's'
		return ['solid', 'solidus']
	else
		return ['solid', 'liquid', 'solidus']
	endif
endfunction

" 要はbaseを投げて配列を返せば良い
" :let $base = 's'
" :echo $base
" :command! Run wall | so ~/Dropbox/dev/complete/main.vim | echo GetWords($base)
