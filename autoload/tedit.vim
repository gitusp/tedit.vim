let g:tedit_prompt_regex = get(g:, 'tedit_prompt_regex', '')
let g:tedit_window_height = get(g:, 'tedit_window_height', 7)
let g:tedit_history_loader = get(g:, 'tedit_history_loader', 'echo "[Since g:tedit_history_loader is not configured, history loading is disabled]"')

function! tedit#f()
  let pos =  getpos('.')
  let line =  getline('.')

  if pos[2] < strlen(line)
    " Just move the cursor to the right.
    startinsert
    call feedkeys("\<Right>")
  else
    let cmd = substitute(line, g:tedit_prompt_regex, '', '')

    " Keep the terminal win id in a function local variable.
    let terminal_win_id = win_getid()

    " Split command editor
    belowright split tedit
    setlocal bufhidden=wipe
    setlocal buftype=nofile
    " NOTE: Best with 'Shougo/deoplete.nvim' and 'zchee/deoplete-zsh'.
    setlocal filetype=zsh
    execute 'resize ' . g:tedit_window_height
    let b:tedit_terminal_win_id = terminal_win_id

    " Load history
    execute 'silent 0read !' . g:tedit_history_loader

    " Append current command and move the cursor to the original position.
    if getline('$') == ''
      call setline('$', cmd)
    else
      call append('$', cmd)
    endif
    normal j$

    " Configure new win's mappings
    imap     <buffer><silent> <CR> <Esc><CR>
    nnoremap <buffer><silent> <CR> :call tedit#exec(0)<CR>
    nnoremap <buffer><silent> <C-C> :call tedit#exec(1)<CR>

    " Close tedit when the cursor will leave.
    augroup tedit
      autocmd!
      " TODO: Back to the buffer and show warning if the buffer is alive.
      autocmd WinLeave <buffer> close
    augroup END
  endif
endfunction

function! tedit#exec(dry)
  let cmd = "\<C-U>" . getline('.') . (a:dry ? '' : "\<CR>")
  call win_gotoid(b:tedit_terminal_win_id)
  " HACK: redraw here to prevent causing an exception.
  redraw
  call jobsend(b:terminal_job_id, cmd)
  startinsert
endfunction

