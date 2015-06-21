command! T wall | so Main.vim | so Test.vim | call Test()

function! Test()
    call MakePatternTest('sP', '^s.*P.*')
    call MakePatternTest('sC', '^s.*C.*')
    call MakePatternTest('sPC', '^s.*P.*C.*')
    call MakePatternTest('sPC', '^s.*P.*c.*')
    call MakePatternTest('mR', '^m.*R.*')
    call MakePatternTest('moR', '^m.*o.*R.*')
endfunction

function! MakePatternTest(base, expected)
    let actual = MakePattern(a:base)
    if a:expected ==# actual
        echo "OK\n\n"
    else
        echo 'NG | expected : ' . a:expected
        echo '     actual   : ' . actual . "\n\n"
    endif
endfunction
