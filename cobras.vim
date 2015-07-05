function! MyComplete_Cobras(findstart, base)
    if a:findstart
        return FindWordhead()
    else
        let candidates = s:getCandidates()
        return GetWords(a:base, candidates)
    endif
endfunction

function! s:getCandidates()
    return ['boss', 'pain', 'fear', 'end', 'fury', 'sorrow']
endfunction
