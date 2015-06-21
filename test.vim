command! T wall | so Main.vim | so Test.vim | call Test()

function! Test()
    call MakePatternTest('sP', '^s.*P.*')
    call MakePatternTest('sC', '^s.*C.*')
    call MakePatternTest('sPC', '^s.*P.*C.*')
    call MakePatternTest('sPC', '^s.*P.*c.*')
    call MakePatternTest('mR', '^m.*R.*')
    call MakePatternTest('moR', '^m.*o.*R.*')

    call GetWordsTest('sP', ['servicePlan', 'servicePrice', 'servicePerContract'])
    call GetWordsTest('sC', ['serviceCount', 'serviceCode', 'servicePerContract'])
    call GetWordsTest('sC', ['serviceCount', 'serviceCode'])
    call GetWordsTest('sPC', ['servicePerContract'])
    call GetWordsTest('mR', ['mockResponse', 'makeRequest'])
    call GetWordsTest('moR', ['mockResponse'])
    call GetWordsTest('mP', [])
endfunction

function! MakePatternTest(base, expected)
    let actual = MakePattern(a:base)
    if a:expected ==# actual
        echo "OK\n\n"
    else
        echo 'NG'
        echo a:expected
        echo actual
        echon "\n\n"
    endif
endfunction

function! GetWordsTest(base, expected)
    let actual = GetWords(a:base, GetCandidates())
    if a:expected ==# actual
        echo "OK\n\n"
    else
        echo 'NG'
        echo a:expected
        echo actual
        echon "\n\n"
    endif
endfunction
