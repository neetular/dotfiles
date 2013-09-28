let s:save_cpo = &cpo
set cpo&vim

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .=
      \ ' setl shiftwidth<'
      \ . ' softtabstop<'
      \ . ' tabstop<'
      \ . ' smarttab<'
      \ . ' expandtab<'
      \ . ' smartindent<'
      \ . ' cinkeys<'
      \ . ' indentkeys<'
      \ . ' suffixesadd<'
      \ . ' | iunmap <buffer> #'

setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal smarttab
setlocal expandtab
setlocal smartindent

" Make sure "#" doesn't jump to the start of the line.
" setlocal cinkeys-=0# indentkeys-=0#
" ↑set cindent してないと効かない

" :help smartindent
inoremap <buffer> # X#

" For gf.
setlocal suffixesadd=.py

let &cpo = s:save_cpo
