source snakes.vim
source cobras.vim

set completefunc=MyComplete_Snakes

function! Role()
    if &completefunc == 'MyComplete_Snakes'
        set completefunc=MyComplete_Cobras
        echo 'current complete func is Cobras'
    else
        set completefunc=MyComplete_Snakes
        echo 'current complete func is Snakes'
    endif
endfunction

function! FindWordhead()
    let leftFromCursor = strpart(getline('.'), 0, col('.') - 1)
    return match(leftFromCursor, '[a-zA-Z0-9*$_]*$')
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
