" tedit.vim - Edit shell commands in the vim way
" Maintainer: usp <https://usui.sh>
" Version:    0.1

if exists('g:loaded_tedit')
  finish
elseif !has('nvim')
  echomsg 'Currently tedit.vim supports Neovim only.'
  finish
else
  let g:loaded_tedit = 'yes'
endif

tnoremap <silent> <C-F> <C-\><C-N>:call tedit#f()<CR>

