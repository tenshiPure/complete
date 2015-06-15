set completefunc=MyComplete

function! MyComplete(findstart, base)
	if a:findstart
		return 0
	else
		let candidates = GetCandidates()
		" 試しに動かしてみる
		return GetWords(a:base, candidates)
	endif
endfunction

function! GetCandidates()
	return ['solid', 'liquid', 'solidus']
endfunction

function! GetWords(base, candidates)
	let pattern = '^' . a:base . '.*'
	return filter(a:candidates, 'v:val =~# pattern')
endfunction

" 要はbaseを投げて配列を返せば良い
" が、もう一手間。単語候補は外から投げた方が作りやすいと思う
