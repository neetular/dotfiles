" Best 
"colorscheme hybrid
"colorscheme jellybeans
"colorscheme aldmeris


"-------
"colorscheme evening
"colorscheme darkspectrum
"colorscheme rdark

"colorscheme corporation
"colorscheme python
"colorscheme pacific
"colorscheme osx_like
"colorscheme norwaytoday
"colorscheme molokai
"colorscheme darkeclipse
"colorscheme darkbone
"colorscheme 3dglasses
"colorscheme advantage
"colorscheme asmanian_blood

" if has("gui_macvim")
"     "set background=light
"     colorscheme macvim
" endif

"colorscheme habiLight
"colorscheme khaki
"colorscheme summerfruit
"colorscheme professional
"colo blackdust
"colo sift

"colo my_h2u_dark
"colorscheme candy
"colorscheme jellybeans

"colorscheme luciusmod
"colorscheme ekinivim

"colorscheme xterm16
"colorscheme wombat256
"colorscheme darkerdesert

"colorscheme wombat

"colorscheme hybrid

colorscheme aldmeris

" set columns=132
" set lines=78
" set guifont=Menlo\ Regular:h12
" set guifontwide=ヒラギノ丸ゴ\ Pro\ W4:h12
set columns=999
"set columns=192
"set columns=116
set lines=99
"set lines=72
"set guifont=Menlo\ Regular:h13
"set guifontwide=ヒラギノ丸ゴ\ Pro\ W4:h13
"set guifont=Menlo\ Regular:h12
"set guifontwide=ヒラギノ丸ゴ\ Pro\ W4:h12
"set guifontwide=ヒラギノ丸ゴ\ Pro\ W4:h12
"
"set guifont=Ricty\ Discord:h13
set guifont=Ricty\ Discord:h18
"set guifont=きろ字:h18
"set guifont=きろ字:h13

set guioptions&
set guioptions-=e
set guioptions-=T
set guioptions+=l

highlight CursorIM guibg=Purple guifg=NONE
highlight Search guibg=DarkBlue guifg=NONE
highlight IMLine guibg=DarkGreen guifg=Black
"highlight Pmenu gui=underline

" from molokai.vim
"hi Pmenu           guifg=#66D9EF guibg=#000000
"hi PmenuSel                      guibg=#808080
"hi PmenuSbar                     guibg=#080808
"hi PmenuThumb      guifg=#66D9EF

"set nomacatsui
set antialias
highlight IMLine guibg=DarkGreen guifg=Black

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guibg=#000000 guifg=#1f82cd
"highlight PmenuSel ctermbg=1 guibg=#dddd00 guifg=#1f82cd
"highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6


" if has("gui_macvim")
"   set guifont=AndaleMono:h13
"   set guifontwide=AndaleMono:h13
"   set nomacatsui
"   set antialias
"   "set gfn=Osaka-Mono:h14
"   "set gfw=Osaka-Mono:h14
"   "set transparency=10
"   "set guioptions-=T
" elseif has("gui_mac")
"   set guifont=Menlo\ Regular:h13
"   "set guifont=Andale\ Mono:h14
"   "set guifontwide=Osaka:h14
"   set guifontwide=ヒラギノ丸ゴ\ Pro\ W4:h13
"   "set guifontwide=ヒラギノ角ゴ\ StdN\ W8:h14
"   " set guifont=AndaleMono:h13
"   " set guifontwide=AndaleMono:h13
"   "set guifontwide=AndaleMono:h13
"   "set gfn=Osaka-Mono:h14
"   "set gfn=M+1VM+IPAG-circle-Regular:h14
"   "set gfw=Osaka-Mono:h14
"   "set gfw=Osaka-Mono:h13
"   set nomacatsui
"   "set macatsui
"   set antialias
"   "set noantialias
"   "set transparency=240
"   
"   highlight IMLine guibg=DarkGreen guifg=Black
"   
"   "   map <D-w> :q<CR>
"   "   "map <D-w> :q<CR>gT
"   "   map <D-t> :tabnew<CR>
"   "   map <D-n> :new<CR>
"   "   map <D-S-t> :browse tabe<CR>
"   "   map <D-S-n> :browse split<CR>
"   "   map <D-]> :tabn<CR>
"   "   map <D-[> :tabp<CR>
"   "   map <D-M-Right> :tabn<CR>
"   "   map <D-M-Left> :tabp<CR>
"   "   imap <D-M-Right> <C-o>:tabn<CR>
"   "   imap <D-M-Left> <C-o>:tabp<CR>
" 
" end

"autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

set iminsert=0
set imsearch=0

if has("gui_macvim")
	"フルスクリーンモード	
	"set fuoptions=maxvert,maxhorz
	"autocmd GUIEnter * set fullscreen 
end


"http://nanasi.jp/dist/download/printrc.vim
"set printencoding=euc-jp
"set printmbcharset=JIS_X_1990
"
"set printmbfont=
"
"" 普通文字のフォント
"set printmbfont+=r:Osaka-Mono
"" 太字 (bold) のフォント
"set printmbfont+=,b:Osaka-Mono
"" 斜体文字 (italic) のフォント。未設定時はrフラグを使用する。
"set printmbfont+=,r:Osaka-Mono
"" 太字斜体文字 (bold-italic) のフォント。未設定時はbフラグを使用する。
"set printmbfont+=,b:Osaka-Mono
"
"set printmbfont+=,c:yes              " ASCII 文字を Courier フォントで出力
""set printmbfont+=,c:no              " デフォルト
"set printmbfont+=,a:yes              " ASCIIコードの範囲を ASCII 文字セットで出力
""set printmbfont+=,a:no              " デフォルト


