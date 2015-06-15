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
