set completefunc=MyComplete

function! MyComplete(findstart, base)
    if a:findstart
        return FindWordhead()
    else
        let candidates = GetCandidates()
        return AddWords(a:base, candidates)
    endif
endfunction

function! FindWordhead()
    let leftFromCursor = strpart(getline('.'), 0, col('.') - 1)
    return match(leftFromCursor, '[a-zA-Z0-9*$_]*$')
endfunction

function! GetCandidates()
    let words = {}

    for pair in items(LinesWithBufName())
        let words[pair[0]] = []
        for line in pair[1]
            let words[pair[0]] += split(line, '[^a-zA-Z0-9_$]')
        endfor
    endfor

    return words
endfunction

function! LinesWithBufName()
    let n = 1
    let last = bufnr('$')
    let lines = {}

    while n <= last
        if bufname(n) == ''
            let n = n + 1
            continue
        else
            let name = bufname(n)
        endif
        let lines[name] = []
        let lines[name] += getbufline(n, 1, '$')
        let n = n + 1
    endwhile

    return lines
endfunction

function! AddWords(base, candidates)
    let result = []
    let pattern = MakePattern(a:base)

    for pair in items(a:candidates)
        for word in pair[1]
            if word =~# pattern
                call complete_add({'word' : word, 'menu' : pair[0]})
                let result = add(result, word)
            endif
        endfor
    endfor

    return result
endfunction

function! MakePattern(base)
    let result = ''
    for c in split(a:base, '\zs')
        let result .= c . '.*'
    endfor

    return '^' . result
endfunction
