"=============================================================================
" FILE: fullscreen.vim
" AUTHOR:  archerC<brightcxl at gmail.com>
" License: MIT license
"=============================================================================


if exists('g:loaded_fullscreen')
	finish
endif

let s:this_file_path = expand('<sfile>')
let s:project_root = fnamemodify(s:this_file_path, ':h:h')
let s:gvimfullscreen_dll = glob(s:project_root . '/lib/gvimfullscreen.dll')
let s:gvimfullscreen_dll_x64 = glob(s:project_root . '/lib/gvimfullscreen.dll.x64')

let g:MyVimLib = s:gvimfullscreen_dll_x64


if has('gui_running') && has('libcall')

	"""""""""""""""""""""""""""""""""
	""" ToggleFullScreen
	function! ToggleFullScreen()
		call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
	endfunction

	command! ToggleFullScreen call ToggleFullScreen()
	nnoremap <Plug>(toggle-fullscreen) :ToggleFullScreen<CR>
	nmap <silent> <F11> <Plug>(toggle-fullscreen)
	"""""""""""""""""""""""""""""""""

	"""""""""""""""""""""""""""""""""
	""" SetAlpha
	let g:VimAlpha = 240
	function! SetAlpha(alpha)
		let g:VimAlpha = g:VimAlpha + a:alpha
		if g:VimAlpha < 180
			let g:VimAlpha = 180
		endif
		if g:VimAlpha > 255
			let g:VimAlpha = 255
		endif
		call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
	endfunction

	nnoremap <Plug>(vim-increase-alpha) <Esc>:call SetAlpha(3)<CR>
	nnoremap <Plug>(vim-decrease-alpha) <Esc>:call SetAlpha(-3)<CR>

	"Shift+Y
	nmap <s-y> <Plug>(vim-increase-alpha)
	"Shift+T
	nmap <s-t> <Plug>(vim-decrease-alpha)
	"""""""""""""""""""""""""""""""""

	"""""""""""""""""""""""""""""""""
	""" TopMost
	let g:VimTopMost = 0
	function! SwitchVimTopMostMode()
		if g:VimTopMost == 0
			let g:VimTopMost = 1
		else
			let g:VimTopMost = 0
		endif
		call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
	endfunction

	"Shift+R
	nnoremap <Plug>(toogle-top-most) <Esc>:call SwitchVimTopMostMode()<CR>
	nmap <s-r> <Plug>(toggle-top-most)
	"""""""""""""""""""""""""""""""""
endif

let g:loaded_fullscreen = 1

