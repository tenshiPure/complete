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
    let words = []

    for line in s:lines()
        let words += split(line, '[^a-zA-Z0-9_$]')
    endfor

    return words
endfunction

function! s:lines()
    let n = 1
    let last = bufnr('$')
    let lines = []

    while n <= last
        let lines += getbufline(n, 1, '$')
        let n = n + 1
    endwhile

    return lines
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
