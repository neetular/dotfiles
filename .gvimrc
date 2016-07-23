"---------------------------------------------------------------------------
" neetular's .gvimrc
"---------------------------------------------------------------------------
colorscheme base16-summerfruit
"colorscheme neverland2
"colorscheme base16-eighties
"colorscheme base16-default
"colorscheme base16-monokai
"colorscheme hybrid
"colorscheme jellybeans
"-------
"colorscheme aldmeris

" 背景色変更(黒板色)
" highlight Normal guibg=#005050
" highlight Folded guibg=#004040

set guifont=MyricaMM:h16
"set guifont=Nyashi:h16
"set guifont=Ricty\ Discord:h13
"set guifont=Ricty\ Discord:h17

set guioptions&
set guioptions-=e
set guioptions-=T
set guioptions+=l

set columns=999
set lines=99
set antialias
set iminsert=0
set imsearch=0

highlight Cursor gui=bold guifg=#0c1efe guibg=#dae9e6
"highlight Cursor guifg=bg guibg=#9dd8a7

highlight CursorIM guifg=bg guibg=#c951ab

highlight Pmenu ctermbg=8 guibg=#92CBDD guifg=#1C180E
highlight PmenuSel ctermbg=1 guibg=#FC881B guifg=#000000
highlight PmenuSbar ctermbg=0 guibg=#404040
highlight PmenuThumb ctermbg=0 guibg=#FC881B
" 
highlight Search guifg=NONE guibg=#07678b

highlight CursorLine NONE
highlight CursorLine gui=underline
highlight CursorLineNr gui=bold guifg=#dedfdf
highlight CursorColumn NONE
highlight CursorColumn guibg=#353535
"highlight CursorColumn guibg=#050505

" MacVimのキーバインドを切る
" 参考：
"   help :macmenu
"   $VIMRUNTIME/menu.vim
if has("gui_macvim")
  let g:macvim_skip_cmd_opt_movement = 1

  " macm File.New\ Window				key=<nop>
  macm File.New\ Tab				key=<nop>
  macm File.Open\.\.\.				key=<nop>
  macm File.Open\ Tab\.\.\.<Tab>:tabnew		key=<nop>
  " macm File.Open\ Recent			action=recentFilesDummy:
  macm File.Close\ Window<Tab>:qa		key=<nop>
  macm File.Close				key=<nop>
  macm File.Save<Tab>:w				key=<nop>
  macm File.Save\ All				key=<nop>
  macm File.Save\ As\.\.\.<Tab>:sav		key=<nop>
  macm File.Print				key=<nop>

  macm Edit.Undo<Tab>u				key=<nop>
  macm Edit.Redo<Tab>^R				key=<nop>
  " macm Edit.Cut<Tab>"+x				key=<nop>
  " macm Edit.Copy<Tab>"+y			key=<nop>
  " macm Edit.Paste<Tab>"+gP			key=<nop>
  macm Edit.Select\ All<Tab>ggVG		key=<nop>
  macm Edit.Find.Find\.\.\.			key=<nop>
  macm Edit.Find.Find\ Next			key=<nop>
  macm Edit.Find.Find\ Previous			key=<nop>
  macm Edit.Find.Use\ Selection\ for\ Find	key=<nop>
  " macm Edit.Font.Show\ Fonts			action=orderFrontFontPanel:
  macm Edit.Font.Bigger				key=<nop>
  macm Edit.Font.Smaller			key=<nop>
  macm Edit.Special\ Characters\.\.\.		key=<nop>

  macm Tools.Spelling.To\ Next\ error<Tab>]s	key=<nop>
  macm Tools.Spelling.Suggest\ Corrections<Tab>z=   key=<nop>
  macm Tools.Make<Tab>:make			key=<nop>
  macm Tools.List\ Errors<Tab>:cl		key=<nop>
  macm Tools.Next\ Error<Tab>:cn		key=<nop>
  macm Tools.Previous\ Error<Tab>:cp		key=<nop>
  macm Tools.Older\ List<Tab>:cold		key=<nop>
  macm Tools.Newer\ List<Tab>:cnew		key=<nop>

  macm Window.Minimize		key=<nop>
  macm Window.Minimize\ All	key=<nop>
  macm Window.Zoom		key=<nop>
  macm Window.Zoom\ All		key=<nop>
"  macm Window.Toggle\ Full\ Screen\ Mode	key=<nop>
  macm Window.Select\ Next\ Window		key=<nop>
  macm Window.Select\ Previous\ Window	key=<nop>
  macm Window.Select\ Next\ Tab			key=<nop>
  macm Window.Select\ Previous\ Tab		key=<nop>
  " macm Window.Bring\ All\ To\ Front		action=arrangeInFront:

  macm Help.MacVim\ Help			key=<nop>
  " macm Help.MacVim\ Website			action=openWebsite:
endif

