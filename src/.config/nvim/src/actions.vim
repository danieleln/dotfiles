" when entering Goyo
autocmd! User GoyoEnter call GoyoEnterCallback()
function GoyoEnterCallback()
    " enable limelight
    Limelight
    " disable cursor line
    set nocursorline
endfunction

" when leaving Goyo
autocmd! User GoyoLeave call GoyoLeaveCallback()
function GoyoLeaveCallback()
    " disable limelight
    Limelight!
    " enable cursor line
    set cursorline
endfunction
