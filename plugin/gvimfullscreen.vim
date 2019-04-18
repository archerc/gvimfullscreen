" gvimfullscreen.vim - set gvim  fullscreen for windows
"
" Maintainer: brightcxl (at) gmail.com
" Homepage: https://github.com/archerc/
"
" Last Modified: 2019/04/28 11:36
"
"     :ToggleFullscreen
"
" Settings:
"
" Variables:
"
" Requirements:
"
" Examples:
"
" Additional:
"
" vim: set et fenc=utf-8 ff=unix sts=4 sw=2 ts=2 :

if exists('g:did_gvimfullscreen')
  finish
endif

let g:gvimfullscreen_dll = glob(expand('<sfile>:h:h') . '/lib/gvimfullscreen.dll.x64')

if filereadable(g:gvimfullscreen_dll)
  echom g:gvimfullscreen_dll
  if has('gui_running') && has('libcall')
    function ToggleFullScreen()
      call libcallnr(g:gvimfullscreen_dll, "ToggleFullScreen", 0)
    endfunction
    command -nargs=0 ToggleFullscreen :call ToggleFullscreen()
    "Alt+Enter
    nnoremap <Plug>(toggle-fullscreen) <Esc>:call ToggleFullScreen()<CR>
    map <F11> <Plug>(toggle-fullscreen)
  endif
endif

let g:did_gvimfullscreen = 1
