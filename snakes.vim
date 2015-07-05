function! MyComplete_Snakes(findstart, base)
    if a:findstart
        return FindWordhead()
    else
        let candidates = s:getCandidates()
        return GetWords(a:base, candidates)
    endif
endfunction

function! s:getCandidates()
    return ['solid', 'liquid', 'solidus']
endfunction
