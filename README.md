This is forked from https://github.com/xqin/gvimfullscreen

#使用方法

```

- <F11> 切换全屏幕
- <Shift-Y> 增大alpha值(3), 降低透明度
- <Shift-T> 减小alpha值(-3)， 提高透明度
- <Shift-R> 切换顶层模式
```

#vimrc 配置实例:

```
if !hasmapto('<Plug>(toggle-fullscreen)')
	nmap <F11> <Plug>(toggle-fullscreen)
endif
if !hasmapto('<Plug>(vim-increase-alpha)')
	nmap <S-Y> <Plug>(vim-increase-alpha)
endif
if !hasmapto('<Plug>(vim-decrease-alpha)')
	nmap <S-T> <Plug>(vim-decrease-alpha)
endif
if !hasmapto('<Plug>(toggle-top-most)')
	nmap <S-R> <Plug>(toggle-top-most)
endif
```

#dll文件说明

`gvimfullscreen.dll`	for x86(32位)
`gvimfullscreen.dll.x64`	for x64(64位,使用时请将.x64的扩展名去掉)



#全屏后GVim窗口的一些小问题.
* 可能会存在全屏后窗口仍有一部分边框的问题, 可以通过修改`src/gui_w32.c`来解决.

```
diff -r 87ef9ff527dd src/gui_w32.c
--- a/src/gui_w32.c     Tue Nov 05 17:40:53 2013 +0100
+++ b/src/gui_w32.c     Wed Nov 06 10:54:51 2013 +0800
@@ -1516,7 +1516,8 @@
            return FAIL;
     }
     s_textArea = CreateWindowEx(
-       WS_EX_CLIENTEDGE,
+        /*WS_EX_CLIENTEDGE,*/
+        0,
        szTextAreaClass, "Vim text area",
        WS_CHILD | WS_VISIBLE, 0, 0,
        100,                            /* Any value will do for now */
@@ -1565,7 +1566,8 @@
     /*
      * Start out by adding the configured border width into the border offset
      */
-    gui.border_offset = gui.border_width + 2;  /*CLIENT EDGE*/
+    /*gui.border_offset = gui.border_width + 2;        [>CLIENT EDGE<]*/
+    gui.border_offset = gui.border_width;

     /*
      * Set up for Intellimouse processing
```
