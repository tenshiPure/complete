set completefunc=MyComplete

function! MyComplete(findstart, base)
    if a:findstart
        return FindWordhead()
    else
        let candidates = GetCandidates()
        return GetWords(a:base, candidates)
    endif
endfunction

function! FindWordhead()
    let leftFromCursor = strpart(getline('.'), 0, col('.') - 1)
    return match(leftFromCursor, '[a-zA-Z0-9*$_]*$')
endfunction

function! GetCandidates()
    return ['serviceCount', 'serviceCode', 'mockResponse', 'makeRequest', 'servicePlan', 'servicePrice', 'servicePerContract']
endfunction

function! GetWords(base, candidates)
    let pattern = MakePattern(a:base)
    return filter(a:candidates, 'v:val =~# pattern')
endfunction

function! MakePattern(base)
    let result = ''
    for c in split(a:base, '\zs')
        let result .= c . '.*'
    endfor

    return '^' . result
endfunction
