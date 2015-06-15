set completefunc=MyComplete

function! MyComplete(findstart, base)
	if a:findstart
		" func みたいな行で<C-p>
		" 1桁目からカーソルまでがa:baseになる
		return 1
	else
		" いきなり<C-p>してみる
		" 補完候補が下記になる
		return ['stan', 'kyle', 'cartman', 'kenny']
	endif
endfunction

function! Hello()
	echo 'hello world'
endfunction

" so %
" :call Hello()

command! H call Hello()

" so %
" :H

" :command! Run so ~/Dropbox/dev/complete/main.vim | H

" hello world!!!
