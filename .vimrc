"---------------------------------------------------------------------------
" neetular's .vimrc
"---------------------------------------------------------------------------
" 主にShougoさんの.vimrcに基づく

" Initialize:"{{{
"
" Enable no Vi compatible commands.
set nocompatible

let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!executable('xdg-open') &&
      \     system('uname') =~? '^darwin'))

" Use English interface.
if s:is_windows
  " For Windows.
  language message en
else
  " For Linux.
  language message C
endif

let mapleader='\'
let maplocalleader=','

" Use ',' instead of '\'.
" It is not mapped with respect well unless I set it before setting for plug in.
" Use <Leader> in global plugin.
"pending let g:mapleader = ','
"pending " Use <LocalLeader> in filetype plugin.
"pending let g:maplocalleader = 'm'
"pending 
"pending " Release keymappings for plug-in.
"pending nnoremap ;  <Nop>
"pending xnoremap ;  <Nop>
"pending nnoremap m  <Nop>
"pending xnoremap m  <Nop>
"pending nnoremap ,  <Nop>
"pending xnoremap ,  <Nop>

" Too lazy to press Shift key.
noremap ;  :
"noremap :  ;
"nunmap :
"nnoremap : <Nop>
"xnoremap : <Nop>

"nmap  :   [Colon]
"xmap  :   [Colon]
"nnoremap  [Colon]   <Nop>
"xnoremap  [Colon]   <Nop>

if s:is_windows
  " Exchange path separator.
  set shellslash
endif


" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

"del function! s:SID_PREFIX()
"del  return matchstr(expand('<sfile>'), '<SNR>\d\+_')
"del endfunction

" Use this group for any autocmd defined in this file.
augroup MyAutoCmd
  autocmd!
augroup END

if filereadable(expand('~/.secret_vimrc'))
  execute 'source' expand('~/.secret_vimrc')
endif

set shiftwidth=4
set backupdir=$HOME/backup/vim

" Ctrl+Aで「007」を「008」にするには、
set nrformats& nrformats-=octal

" 折り畳み
set foldnestmax=3
set foldcolumn=1

" インクルードファイルへのジャンプ関係
set path& path+=include,../include,inc,../inc
" タグ検索ディレクトリ追加
set tags& tags+=../tags,../../tags,../../../tags,../../../../tags,../../../../../tags

set ambiwidth=double


if has('vim_starting')
  set runtimepath+=~/.vimbundles/neobundle.vim
  "set runtimepath+=expand('~/.vimbundles/neobundle.vim')
  call neobundle#rc(expand('~/.vimbundles'))
endif

"if has('vim_starting')
"  set runtimepath+=~/.vim/bundle/neobundle.vim
"  "set runtimepath+=~/vimfiles/neobundle.vim
"
"  call neobundle#rc(expand('~/.vim/bundle'))
"endif


" neobundle.vim"{{{
"

NeoBundle 'thinca/vim-singleton.git'
" vim-singleton.git "{{{
" 特別に最初に処理
if has('clientserver')
	call singleton#enable()
endif
"}}}

NeoBundleFetch 'Shougo/neobundle.vim', '', 'default'

"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'


"NeoBundle 'git://github.com/Shougo/unite.vim.git'
"pending NeoBundle 'Shougo/unite.vim',
"pending call neobundle#config('unite.vim',{
"pending       \ 'lazy' : 1,
"pending       \ 'autoload' : {
"pending       \   'commands' : [{ 'name' : 'Unite',
"pending       \                   'complete' : 'customlist,unite#complete_source'},
"pending       \                 'UniteWithCursorWord', 'UniteWithInput']
"pending       \ }})
NeoBundle 'Shougo/unite.vim'

"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'

"NeoBundle 'Shougo/vimproc'
"NeoBundle http://github.com/Shougo/vimproc
NeoBundle 'Shougo/vimproc', '', 'default'
call neobundle#config('vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

NeoBundle 'Shougo/unite-ssh'
"NeoBundle 'git://github.com/Shougo/unite-ssh'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tsukkee/unite-tag'

"NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-outline', '', 'default'
call neobundle#config('unite-outline', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'unite_sources' : 'outline'},
      \ })

NeoBundle 'sgur/unite-qf'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-unite-history.git'

NeoBundle 'DirDiff.vim'

NeoBundleLazy 'thinca/vim-fontzoom', {
      \ 'gui' : 1,
      \ 'autoload' : {
      \  'mappings' : [
      \   ['n', '<Plug>(fontzoom-larger)'],
      \   ['n', '<Plug>(fontzoom-smaller)']]
      \ }}

NeoBundle 'Shougo/junkfile.vim'
call neobundle#config('junkfile.vim', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : 'JunkfileOpen',
      \   'unite_sources' : ['junkfile', 'junkfile/new'],
      \ }})

NeoBundle 'tyru/vim-altercmd'
"NeoBundleLazy 'tyru/vim-altercmd'
"NeoBundle 'tyru/vim-altercmd', { 'autoload' : {
"      \ 'mappings' : ':'
"      \ }}

NeoBundleLazy 'yuratomo/w3m.vim', { 'autoload' : {
      \ 'commands' : 'W3m',
      \ }}

NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/solarized'
NeoBundle 'vim-scripts/newspaper.vim'
NeoBundle 'vim-jp/vimdoc-ja.git'
"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kana/vim-tabpagecd'
"NeoBundle 'osyo-manga/vim-reanimate.git'

NeoBundle 'yuratomo/dotnet-complete.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

NeoBundle 'thinca/vim-quickrun'

" coffee関連
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'kakkyz81/evervim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'hrsh7th/vim-versions.git'
NeoBundle 'rhysd/clever-f.vim.git'

" colorscheme
"NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
"NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

NeoBundle 'Shougo/neosnippet'

NeoBundle 'honza/vim-snippets'
NeoBundle 'thinca/vim-ref'

NeoBundle 'Shougo/vim-vcs', {
      \ 'depends' : 'thinca/vim-openbuf',
      \ 'autoload' : {'commands' : 'Vcs'},
      \   }

"NeoBundle 'Kocha/vim-unite-tig'

"NeoBundleLazy 'yomi322/vim-gitcomplete', { 'autoload' : {
NeoBundle 'yomi322/vim-gitcomplete', { 'autoload' : {
      \ 'filetype' : 'vimshell'
      \ }}

"NeoBundle 'rking/ag.vim'

NeoBundle 'Shougo/unite-build', '', 'default'

"NeoBundleLazy 'tyru/restart.vim', {
"      \ 'gui' : 1,
"      \ 'autoload' : {
"      \  'commands' : ['Restart', 'RestartWithSession']
"      \ }}

NeoBundle 'trapd00r/neverland-vim-theme.git'
NeoBundle 'veloce/vim-aldmeris', {'directory': 'aldmeris'}
NeoBundle 'Pychimp/vim-luna.git'
NeoBundleLazy 'thinca/vim-prettyprint', { 'autoload' : {
      \ 'commands' : 'PP'
      \ }}

NeoBundle 'anyakichi/vim-surround', {
      \ 'autoload' : {
      \   'mappings' : [
      \     ['n', '<Plug>Dsurround'], ['n', '<Plug>Csurround'],
      \     ['n', '<Plug>Ysurround'], ['n', '<Plug>YSurround']
      \ ]}}

NeoBundleLazy 'basyura/TweetVim', { 'depends' :
      \ ['basyura/twibill.vim', 'tyru/open-browser.vim'],
      \ 'autoload' : { 'commands' : 'TweetVimHomeTimeline' }}

NeoBundleLazy 'rhysd/accelerated-jk', { 'autoload' : {
      \ 'mappings' : ['<Plug>(accelerated_jk_gj)',
      \               '<Plug>(accelerated_jk_gk)'],
      \ }}

NeoBundleLazy 'Shougo/unite-help', { 'autoload' : {
      \ 'unite_sources' : 'help'
      \ }}

"NeoBundle 'Shougo/unite-session'

NeoBundle 'Shougo/vinarise', '', 'default'
call neobundle#config('vinarise', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : 'Vinarise',
      \ }})

NeoBundle 'davidoc/taskpaper.vim'
"NeoBundle 'hsitz/VimOrganizer'

"NeoBundle 'VOom'
NeoBundle 'vim-scripts/VOoM'

NeoBundle 't9md/vim-textmanip' " easy text manupilation for vim
NeoBundle 'tpope/vim-markdown' " Vim Markdown runtime files
NeoBundle 'kana/vim-arpeggio' " Vim plugin: Mappings for simultaneously pressed keys

NeoBundle 'yomi322/neco-tweetvim'
"NeoBundle 'rhysd/tweetvim-advanced-filter' " A high-configurable filter for TweetVim. https://github.com/basyura/TweetVim
NeoBundle 'yomi322/unite-tweetvim' " unite source for tweetvim

NeoBundle 't9md/vim-quickhl' " quickly highlight <cword> or visually selected word

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'sjl/gundo.vim' " A git mirror of gundo.vim


" <next NeoBundle here>
" NeoBundle ''

filetype plugin indent on

" Enable syntax color.
syntax enable

" Installation check.
NeoBundleCheck
"}}}


"}}}

"---------------------------------------------------------------------------
" Encoding:"{{{
"
" The automatic recognition of the character code.

" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
set encoding=utf-8

" Setting of terminal encoding."{{{
if !has('gui_running')
  if &term ==# 'win32' &&
        \ (v:version < 703 || (v:version == 703 && has('patch814')))
    " Setting when use the non-GUI Japanese console.

    " Garbled unless set this.
    set termencoding=cp932
    " Japanese input changes itself unless set this.  Be careful because the
    " automatic recognition of the character code is not possible!
    set encoding=japan
  else
    if $ENV_ACCESS ==# 'linux'
      set termencoding=euc-jp
    elseif $ENV_ACCESS ==# 'colinux'
      set termencoding=utf-8
    else  " fallback
      set termencoding=  " same as 'encoding'
    endif
  endif
elseif s:is_windows
  " For system.
  set termencoding=cp932
endif
"}}}

" The automatic recognition of the character code."{{{
if !exists('did_encoding_settings') && has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

  " Does iconv support JIS X 0213?
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " Build encodings.
  let &fileencodings = 'ucs-bom'
  if &encoding !=# 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'ucs-2le'
    let &fileencodings = &fileencodings . ',' . 'ucs-2'
  endif
  let &fileencodings = &fileencodings . ',' . s:enc_jis

  if &encoding ==# 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'cp932'
  elseif &encoding =~# '^euc-\%(jp\|jisx0213\)$'
    let &encoding = s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'cp932'
  else  " cp932
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
  endif
  let &fileencodings = &fileencodings . ',' . &encoding

  unlet s:enc_euc
  unlet s:enc_jis

  let did_encoding_settings = 1
endif
"}}}

if has('kaoriya')
  " For Kaoriya only.
  "set fileencodings=guess
endif

" When do not include Japanese, use encoding for fileencoding.
function! s:ReCheck_FENC() "{{{
  if &fileencoding =~# 'iso-2022-jp' &&
        \ search("[^\x01-\x7e]", 'n', 100, 100) == 0
    let &fileencoding=&encoding
  endif
endfunction"}}}

autocmd MyAutoCmd BufReadPost * call s:ReCheck_FENC()




" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac
" A fullwidth character is displayed in vim properly.
set ambiwidth=double

" Command group opening with a specific character code again."{{{
" In particular effective when I am garbled in a terminal.
" Open in UTF-8 again.
command! -bang -bar -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
" Open in iso-2022-jp again.
command! -bang -bar -complete=file -nargs=? Iso2022jp edit<bang> ++enc=iso-2022-jp <args>
" Open in Shift_JIS again.
command! -bang -bar -complete=file -nargs=? Cp932 edit<bang> ++enc=cp932 <args>
" Open in EUC-jp again.
command! -bang -bar -complete=file -nargs=? Euc edit<bang> ++enc=euc-jp <args>
" Open in UTF-16 again.
command! -bang -bar -complete=file -nargs=? Utf16 edit<bang> ++enc=ucs-2le <args>
" Open in UTF-16BE again.
command! -bang -bar -complete=file -nargs=? Utf16be edit<bang> ++enc=ucs-2 <args>

" Aliases.
command! -bang -bar -complete=file -nargs=? Jis  Iso2022jp<bang> <args>
command! -bang -bar -complete=file -nargs=? Sjis  Cp932<bang> <args>
command! -bang -bar -complete=file -nargs=? Unicode Utf16<bang> <args>
"}}}

" Tried to make a file note version."{{{
" Don't save it because dangerous.
command! WUtf8 setlocal fenc=utf-8
command! WIso2022jp setlocal fenc=iso-2022-jp
command! WCp932 setlocal fenc=cp932
command! WEuc setlocal fenc=euc-jp
command! WUtf16 setlocal fenc=ucs-2le
command! WUtf16be setlocal fenc=ucs-2
" Aliases.
command! WJis  WIso2022jp
command! WSjis  WCp932
command! WUnicode WUtf16
"}}}

" Appoint a line feed."{{{
command! -bang -complete=file -nargs=? WUnix
      \ write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WDos
      \ write<bang> ++fileformat=dos <args> | edit <args>
command! -bang -complete=file -nargs=? WMac
      \ write<bang> ++fileformat=mac <args> | edit <args>
"}}}

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

"}}}

"---------------------------------------------------------------------------
" Search:"{{{
"

" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"}}}

"---------------------------------------------------------------------------
" Edit:"{{{
"

"set grepprg=grep\ -nH
if executable('ag')
	"set grepprg=ag\ --nocolor\ --nogroup
	"set grepprg=ag\ --nocolor\ --nogroup\ --smart-case
	set grepprg=ag\ --nocolor\ --nogroup\ --smart-case\ --skip-vcs-ignores
else
	set grepprg=internal
endif

" 編集に関する設定:
"
" タブの画面上での幅
" set tabstop=8
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1  " ぶら下り可能幅

" Use clipboard register.
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100


"}}}

"---------------------------------------------------------------------------
" View:"{{{
"

set list
if s:is_windows
  set listchars=tab:>-,trail:-,extends:>,precedes:<
else
  set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
endif

" Splitting a window will put the new window below the current one.
set splitbelow
" Splitting a window will put the new window right the current one.
set splitright
" Set minimal width for current window.
set winwidth=10
"set winwidth=30
" Set minimal height for current window.
" set winheight=20
set winheight=1
" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=10
set helpheight=12

" Don't redraw while macro executing.
set lazyredraw

" When a line is long, do not omit it in @.
set display=lastline

set history=200
set showcmd " コマンドをステータス行に表示

" 補完関連
set completeopt=menuone
"set complete=.
set complete=.,w,b,t
set pumheight=20
"set pumheight=32
set showfulltag

" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
"set cmdheight=2
" タイトルを表示
set title

if !exists('g:colors_name')  " Don't override colorscheme on reloading.
  colorscheme desert
endif

" ステータスライン
let &statusline = ''
let &statusline .= '%<'
let &statusline .= '%f %h%m%r%w'
let &statusline .= '%{fugitive#statusline()}'
let &statusline .= '%='
let &statusline .= '[%{&fileencoding == "" ? &encoding : &fileencoding}]'
let &statusline .= '[%{&fileformat}]'
let &statusline .= '[ts=%{&tabstop}]'
let &statusline .= '  %-14.(%l,%c%V%) %P'

function! s:my_tabline()  "{{{
  let s = ''

  " カレントディレクトリ名を'/'で分割した部分が3つ未満かどうかで短縮方法分岐
  let modpath = fnamemodify( getcwd(), ':~' )
  if len(split(modpath, '/')) < 3
    let pathtxt = modpath
  else
    " 末端2階層以外を短縮
    let pathtxt = pathshorten(fnamemodify( getcwd(), ':~:h' ))
    let pathtxt .= '/'
    let pathtxt .= fnamemodify( getcwd(), ':t' )
  endif

  let s .= '%#Folded#'
  let s .= '%-50('
  let s .= '[' . (tabpagenr() - 1) . ']'
  let s .= ' ' . pathtxt . ' '
  let s .= '%)'
  let s .= '%#TabLineFill#'
  let s .= ' '

  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let curbufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears

    let no = (i <= 10 ? i-1 : '#')  " display 0-origin tabpagenr.
    let mod = len(filter(bufnrs, 'getbufvar(v:val, "&modified")')) ? '+' : ' '
    let name = bufname(curbufnr)
    if len(name)
      let title = ''
      if !isdirectory(name)
        let title .= (fnamemodify(name,':t'))
      else
        let title .= '<dir>'
      endif
    else
      let title = '[No Name]'
    endif

    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= '[' . no
    let s .= mod . ']'

"	"test
"	let s .= ' ' . pathshorten(gettabvar(i, 'cwd')) . ' '
	"
    let s .= title
    let s .= '%#TabLineFill#'
    let s .= ' '
  endfor

  return s
endfunction "}}}
let &tabline = '%!' . s:SID_PREFIX() . 'my_tabline()'
set showtabline=2



"}}}

"---------------------------------------------------------------------------
" Syntax:"{{{
"
" Enable smart indent.
set autoindent smartindent

augroup MyAutoCmd

  " Close help and git window by pressing q.
  autocmd FileType help,git-status,git-log,
        \gitcommit,quickrun,qfreplace,ref,vcs-commit,vcs-status,vcs-log
        \ nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>
  autocmd FileType * if (&readonly || !&modifiable) && !hasmapto('q', 'n')
        \ | nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>| endif

augroup END

"}}}

"---------------------------------------------------------------------------
" Plugin:"{{{
"
" neocomplcache.vim"{{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

let bundle = neobundle#get('neocomplcache')
function! bundle.hooks.on_source(bundle)
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 0
  " Use camel case completion.
  let g:neocomplcache_enable_camel_case_completion = 0
  " Use underbar completion.
  let g:neocomplcache_enable_underbar_completion = 0
  " Use fuzzy completion.
  let g:neocomplcache_enable_fuzzy_completion = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  " Set auto completion length.
  let g:neocomplcache_auto_completion_start_length = 2
  " Set manual completion length.
  let g:neocomplcache_manual_completion_start_length = 0
  " Set minimum keyword length.
  let g:neocomplcache_min_keyword_length = 3
  " let g:neocomplcache_enable_cursor_hold_i = v:version > 703 ||
  "       \ v:version == 703 && has('patch289')
  let g:neocomplcache_enable_cursor_hold_i = 0
  let g:neocomplcache_cursor_hold_i_time = 300
  let g:neocomplcache_enable_insert_char_pre = 0
  let g:neocomplcache_enable_prefetch = 0
  let g:neocomplcache_skip_auto_completion_time = '0.6'

  if !exists('g:neocomplcache_wildcard_characters')
    let g:neocomplcache_wildcard_characters = {}
  endif
  let g:neocomplcache_wildcard_characters._ = '-'

  " For auto select.
  let g:neocomplcache_enable_auto_select = 1

  let g:neocomplcache_enable_auto_delimiter = 1
  "let g:neocomplcache_disable_caching_buffer_name_pattern = '[\[*]\%(unite\)[\]*]'
  let g:neocomplcache_disable_auto_select_buffer_name_pattern = '\[Command Line\]'
  " let g:neocomplcache_lock_buffer_name_pattern = '\.txt'
  "let g:neocomplcache_disable_auto_complete = 0
  let g:neocomplcache_max_list = 100
  let g:neocomplcache_force_overwrite_completefunc = 1
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
  endif

  " For clang_complete.
  let g:neocomplcache_force_overwrite_completefunc = 1
  let g:neocomplcache_force_omni_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_force_omni_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_use_library   = 1

  " For jedi-vim.
  let g:jedi#auto_initialization = 1
  let g:jedi#popup_on_dot = 0
  let g:jedi#rename_command = '<leader>R'
  let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ }
        "\ 'scheme' : expand('~/.gosh_completions'),
        "\ 'scala' : expand('$DOTVIM/dict/scala.dict'),
        "\ 'ruby' : expand('$DOTVIM/dict/ruby.dict'),
        "\ 'int-termtter' : expand('~/.vimshell/int-history/int-termtter'),

  let g:neocomplcache_omni_functions = {
        \ 'cs' : 'cs#complete',
        \ }
"        \ 'ruby' : 'rubycomplete#Complete',

  " Define keyword pattern.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  " let g:neocomplcache_keyword_patterns.default = '\h\w*'
  let g:neocomplcache_keyword_patterns['default'] = '[0-9a-zA-Z:#_]\+'
  let g:neocomplcache_keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  " let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  " let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.php = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.mail = '^\s*\w\+'
  let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_caching_limit_file_size = 500000

  if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
  endif
  "let g:neocomplcache_same_filetype_lists.perl = 'ref'

  " let g:neocomplcache_source_look_dictionary_path = $HOME . '/words'
  let g:neocomplcache_source_look_dictionary_path = ''

  " Set $RSENSE_HOME path.
  let g:neocomplcache#sources#rsense#home_directory = '/opt/rsense'

  let g:neocomplcache_vim_completefuncs = {
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' :
        \      'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' :
        \      'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' :
        \      'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \ 'Ref' : 'ref#complete',
        \ 'Vinarise' : 'vinarise#complete',
        \}

  if !exists('g:neocomplcache_source_completion_length')
    let g:neocomplcache_source_completion_length = {
          \ 'look' : 4,
          \ }
  endif

  " Test."{{{
  "let g:neocomplcache_auto_completion_start_length = 1
  "let g:neocomplcache_plugin_completion_length = {
  "\ 'snippets_complete' : 1,
  "\ 'buffer_complete' : 2,
  "\ 'syntax_complete' : 2,
  "\ 'tags_complete' : 3,
  "\ 'vim_complete' : 4,
  "\ }
  let g:neocomplcache_source_disable = {
        \ 'tags_complete' : 1,
        \}
  "}}}

  " mappings."{{{
  " <C-f>, <C-b>: page move.
  inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
"  " <C-y>: paste.
"  inoremap <expr><C-y>  pumvisible() ? neocomplcache#close_popup() :  "\<C-r>\""
"  " <C-e>: close popup.
"  inoremap <expr><C-e>  pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
  " <C-k>: unite completion.
"  imap <C-k>  <Plug>(neocomplcache_start_unite_complete)
  " - unite quick match.

  " imap <expr> -  pumvisible() ?
  "       \ "\<Plug>(neocomplcache_start_unite_quick_match)" : '-'

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  " <C-n>: neocomplcache.
  inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
  " <C-p>: keyword completion.
  inoremap <expr><C-p>  pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
  inoremap <expr>'  pumvisible() ? neocomplcache#close_popup() : "'"

  inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()

  imap <C-s>  <Plug>(neosnippet_start_unite_snippet)
  "imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)

"pending  " <CR>: close popup and save indent.
"pending  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"pending  function! s:my_cr_function()
"pending    return neocomplcache#smart_close_popup() . "\<CR>"
"pending  endfunction

  " <TAB>: completion.
  " 2013/06/18 neosnippet 優先のため調整
"  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplcache#start_manual_complete()

  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

  " For cursor moving in insert mode(Not recommended)
  inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

  "inoremap <expr><C-j>  neocomplcache#manual_omni_complete()

  "}}}
endfunction

function! CompleteFiles(findstart, base)
  if a:findstart
    " Get cursor word.
    let cur_text = strpart(getline('.'), 0, col('.') - 1)

    return match(cur_text, '\f*$')
  endif

  let words = split(expand(a:base . '*'), '\n')
  let list = []
  let cnt = 0
  for word in words
    call add(list, {
          \ 'word' : word,
          \ 'abbr' : printf('%3d: %s', cnt, word),
          \ 'menu' : 'file_complete'
          \ })
    let cnt += 1
  endfor

  return { 'words' : list, 'refresh' : 'always' }
endfunction

unlet bundle
"}}}
"
" unite.vim"{{{

" The prefix key.
nnoremap    [unite]   <Nop>
xnoremap    [unite]   <Nop>
nmap    U [unite]
xmap    U [unite]
"nmap    f [unite]
"xmap    f [unite]

nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>

nnoremap <silent> [unite]b  :<C-u>Unite -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

"nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]r  :<C-u>UniteResume<CR>
nnoremap <silent> [unite]R  :<C-u>Unite resume<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>

"nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=vimfiler directory_mru<CR>
nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>

"nnoremap <silent> [unite]g  :<C-u>Unite grep -buffer-name=search<CR>
nnoremap <silent> [unite]t  :<C-u>Unite tag  -buffer-name=tag<CR>
"nnoremap <silent> [unite]f  :<C-u>Unite tag/file -buffer-name=files<CR>
"nnoremap <silent> [unite]l  :<C-u>Unite line -buffer-name=line<CR>
nnoremap <silent> [unite]q  :<C-u>Unite qf   -buffer-name=QuickFix<CR>

nnoremap <silent> [unite]k  :<C-u>Unite -buffer-name=files bookmark buffer file_mru file<CR>
nnoremap <silent> [unite]j  :<C-u>Unite -buffer-name=files buffer file_mru<CR>
nnoremap <silent> [unite]h  :<C-u>Unite history/command<CR>

nnoremap <silent> [unite]m  :<C-u>Unite menu<CR>

nnoremap [unite]s  :<C-u>Unite source<CR>
nnoremap [unite]S  :<C-u>Unite source -start-insert<CR>
"nnoremap [unite]U  :<C-u>Unite source -start-insert<CR>
"nnoremap [unite]f  :<C-u>Unite source<CR>

nnoremap [unite]u  q:Unite<Space>
"nnoremap [unite]U  q:Unite<Space>

nnoremap <silent> [unite]g
      \ :<C-u>Unite grep -buffer-name=search -auto-preview -no-quit -resume<CR>
nnoremap <silent> [Window]G
      \ :<C-u>Unite grep -buffer-name=search -auto-preview -no-quit -resume<CR>

nnoremap <expr><silent> [unite]l
  \ ":\<C-u>Unite -buffer-name=line -input=" . @/ . " -no-start-insert line\<CR>"

"nnoremap <expr><silent> N
"      \ ":\<C-u>Unite -buffer-name=search -input=" . @/ . " -no-start-insert line\<CR>"
"nnoremap <silent> n   :UniteResume search<CR>

" 無視パターン
"del let g:unite_source_file_mru_ignore_pattern = '\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/media/\)'
"del let g:unite_source_directory_mru_ignore_pattern = '\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/media/\)'

" <C-t>: Tab pages
"nnoremap <silent> <C-t>       :<C-u>Unite tab<CR>
nnoremap <silent> <C-t>       :<C-u>Unite tab menu:tweetvim -start-insert<CR>
nmap <silent> T <C-t>
"nnoremap <silent> T       :<C-u>Unite tab -start-insert<CR>

"pending if s:is_windows
"pending   nnoremap <silent> [Window]s
"pending         \ :<C-u>Unite -buffer-name=files -no-split -multi-line
"pending         \ jump_point file_point buffer_tab
"pending         \ file_rec:! file file/new file_mru<CR>
"pending else
"pending   nnoremap <silent> [Window]s
"pending         \ :<C-u>Unite -buffer-name=files -no-split -multi-line
"pending         \ jump_point file_point buffer_tab
"pending         \ file_rec/async:! file file/new file_mru<CR>
"pending endif
"pending nnoremap <silent> [Window]w
"pending       \ :<C-u>Unite window<CR>
nnoremap <silent> [Space]b
      \ :<C-u>UniteBookmarkAdd<CR>

" Search.
nnoremap <silent> Kl
      \ :<C-u>Unite -buffer-name=search -no-split -start-insert line<CR>
nnoremap <expr><silent> KL
      \ ":\<C-u>Unite -buffer-name=search -input=" . @/ . " -auto-highlight -no-start-insert line\<CR>"
"nnoremap <silent> KL
"      \ :<C-u>Unite -buffer-name=search -auto-highlight -start-insert line<CR>

"pending nnoremap <silent> /
"pending       \ :<C-u>Unite -buffer-name=search -no-split -start-insert line<CR>
"pending nnoremap <expr> g/  <SID>smart_search_expr('g/',
"pending      \ ":\<C-u>Unite -buffer-name=search -auto-preview -start-insert line_migemo\<CR>")
"pending nnoremap [Alt]/  g/
"pending nnoremap <silent> ?
"pending       \ :<C-u>Unite -buffer-name=search -auto-highlight -start-insert line:backward<CR>
"pending nnoremap <silent> *
"pending       \ :<C-u>UniteWithCursorWord -no-split -buffer-name=search line<CR>
"pending nnoremap [Alt]/       /
"pending nnoremap [Alt]?       ?
cnoremap <expr><silent><C-g>        (getcmdtype() == '/') ?
      \ "\<ESC>:Unite -buffer-name=search -no-split line -input=".getcmdline()."\<CR>" : "\<C-g>"

function! s:smart_search_expr(expr1, expr2)
  return line('$') > 5000 ?  a:expr1 : a:expr2
endfunction

"pending nnoremap <silent> n
"pending       \ :<C-u>UniteResume search -no-start-insert<CR>

let g:unite_source_history_yank_enable = 1

" For unite-menu.
let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.enc = {
      \     'description' : 'Open with a specific character code again.',
      \ }
let g:unite_source_menu_menus.enc.command_candidates = [
      \       ['utf8', 'Utf8'],
      \       ['iso2022jp', 'Iso2022jp'],
      \       ['cp932', 'Cp932'],
      \       ['euc', 'Euc'],
      \       ['utf16', 'Utf16'],
      \       ['utf16-be', 'Utf16be'],
      \       ['jis', 'Jis'],
      \       ['sjis', 'Sjis'],
      \       ['unicode', 'Unicode'],
      \     ]
"nnoremap <silent> ;e :<C-u>Unite menu:enc<CR>

let g:unite_source_menu_menus.fenc = {
      \     'description' : 'Change file fenc option.',
      \ }
let g:unite_source_menu_menus.fenc.command_candidates = [
      \       ['utf8', 'WUtf8'],
      \       ['iso2022jp', 'WIso2022jp'],
      \       ['cp932', 'WCp932'],
      \       ['euc', 'WEuc'],
      \       ['utf16', 'WUtf16'],
      \       ['utf16-be', 'WUtf16be'],
      \       ['jis', 'WJis'],
      \       ['sjis', 'WSjis'],
      \       ['unicode', 'WUnicode'],
      \     ]
"nnoremap <silent> ;f :<C-u>Unite menu:fenc<CR>

let g:unite_source_menu_menus.ff = {
      \     'description' : 'Change file format option.',
      \ }
let g:unite_source_menu_menus.ff.command_candidates = {
      \       'unix'   : 'WUnix',
      \       'dos'    : 'WDos',
      \       'mac'    : 'WMac',
      \     }
"nnoremap <silent> ;w :<C-u>Unite menu:ff<CR>

let g:unite_source_menu_menus.unite = {
      \     'description' : 'Start unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = {
      \       'history'    : 'Unite history/command',
      \       'quickfix'   : 'Unite qf -no-quit',
      \       'resume'     : 'Unite -buffer-name=resume resume',
      \       'directory'  : 'Unite -buffer-name=files '.
      \             '-default-action=lcd directory_mru',
      \       'mapping'    : 'Unite mapping',
      \       'message'    : 'Unite output:message',
      \     }
"nnoremap <silent> :u :<C-u>Unite menu:unite -resume<CR>

let g:unite_source_menu_menus.tweetvim = {
      \     'description' : 'Execute tweetvim command',
      \ }
let g:unite_source_menu_menus.tweetvim.command_candidates = {
      \       'tweetvim_home_timeline'    : 'tabedit | TweetVimHomeTimeline',
      \     }

let bundle = neobundle#get('unite.vim')
function! bundle.hooks.on_source(bundle)
  autocmd MyAutoCmd FileType unite call s:unite_my_settings()

  " Set "-no-quit" automatically in grep unite source.
  call unite#set_profile('source/grep', 'context', {'no_quit' : 1})

  " Custom filters."{{{
  call unite#custom#source(
        \ 'file_mru,buffer,file,', 'sorters',
        \ ['sorter_nothing'])
  call unite#custom#source(
        \ 'buffer,file_rec/async,file_mru', 'matchers',
        \ ['matcher_glob'])
  " call unite#custom#source(
  "       \ 'buffer,file_rec/async,file_mru', 'matchers',
  "       \ ['matcher_fuzzy'])
  call unite#custom#source(
        \ 'junkfile', 'sorters',
        \ ['sorter_word', 'sorter_reverse'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  "}}}

  function! s:unite_my_settings() "{{{
    "call unite#custom#alias('file', 'h', 'left')
    call unite#custom#alias('openable', 'h', 'left')
    call unite#custom#alias('openable', 'j', 'below')
    call unite#custom#alias('openable', 'k', 'above')
    call unite#custom#alias('openable', 'l', 'right')
    call unite#custom#alias('common',   ';', 'ex')

    " Overwrite settings.
    "setlocal cursorline

    " default
    let g:unite_quick_match_table =
    			\ get(g:, 'unite_quick_match_table', {
    			\     'a' : 0, 's' : 1, 'd' : 2, 'f' : 3, 'g' : 4, 'h' : 5, 'j' : 6, 'k' : 7, 'l' : 8, ';' : 9,
    			\     'q' : 10, 'w' : 11, 'e' : 12, 'r' : 13, 't' : 14, 'y' : 15, 'u' : 16, 'i' : 17, 'o' : 18, 'p' : 19,
    			\     '1' : 20, '2' : 21, '3' : 22, '4' : 23, '5' : 24, '6' : 25, '7' : 26, '8' : 27, '9' : 28, '0' : 29,
    			\ })
"	let g:unite_quick_match_table = {
"				\ 'a' : 1, 's' : 2, 'd' : 3, 'f' : 4, 'g' : 5,
"				\ 'h' : 6, 'k' : 7, 'l' : 8, ';' : 9,
"				\ 'q' : 10, 'w' : 11, 'e' : 12, 'r' : 13, 't' : 14,
"				\ 'y' : 15, 'u' : 16, 'i' : 17, 'o' : 18, 'p' : 19,
"				\ '1' : 20, '2' : 21, '3' : 22, '4' : 23, '5' : 24,
"				\ '6' : 25, '7' : 26, '8' : 27, '9' : 28, '0' : 29,
"				\}

    " Custom actions."{{{
    let my_tabopen = {
          \ 'description' : 'my tabopen items',
          \ 'is_selectable' : 1,
          \ }
    function! my_tabopen.func(candidates) "{{{
      call unite#take_action('tabopen', a:candidates)

      let dir = isdirectory(a:candidates[0].word) ?
            \ a:candidates[0].word : fnamemodify(a:candidates[0].word, ':p:h')
      execute g:unite_kind_openable_lcd_command '`=dir`'
    endfunction "}}}
    call unite#custom_action('file,buffer', 'tabopen', my_tabopen)
    unlet my_tabopen
    "}}}

	nmap <buffer> <ESC>      <Plug>(unite_exit)
	imap <buffer> jj      <Plug>(unite_insert_leave)
	imap <buffer><expr> j unite#smart_map('j', '')
	imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
	"pending      imap <buffer> <TAB>   <Plug>(unite_select_next_line)
	imap <buffer> '     <Plug>(unite_quick_match_default_action)
	nmap <buffer> '     <Plug>(unite_quick_match_default_action)
	imap <buffer><expr> x
				\ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
	nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
	nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
	imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)

	" <C-l>: manual neocomplcache completion.
	"inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>
	inoremap <silent> <buffer> <expr> <C-f> unite#do_action('vimfiler')
	nnoremap <silent> <buffer> <expr> <C-f> unite#do_action('vimfiler')

	inoremap <silent> <buffer> <expr> <C-s> unite#do_action('vimshell')
	nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('vimshell')

	"pending      nmap <silent><buffer> <Tab>     :call <SID>NextWindow()<CR>

	nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
	imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
	imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
	nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
	nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
	nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
	nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
				\ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
	" Start insert.
	"let g:unite_enable_start_insert = 1
  endfunction "}}}

  " Variables.
  let g:unite_enable_split_vertically = 0
  let g:unite_winheight = 20
  let g:unite_enable_start_insert = 0
  let g:unite_enable_short_source_names = 0
  "let g:unite_enable_short_source_names = 1
  
  let g:unite_source_file_mru_limit = 300
  let g:unite_source_directory_mru_limit = 300
  let g:unite_cursor_line_highlight = 'TabLineSel'
  
  " For optimize.
  "let g:unite_source_file_mru_filename_format = ''
  let g:unite_source_file_mru_time_format= 		'(%m/%d %H:%M) '
  let g:unite_source_directory_mru_time_format = 	'(%m/%d %H:%M) '
  
  let g:unite_source_file_mru_filename_format = ':~:.'

  if s:is_windows
  else
    " Like Textmate icons.
    let g:unite_marked_icon = '✗'

    " Prompt choices.
    "let g:unite_prompt = '❫ '
    let g:unite_prompt = '» '
  endif

  if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    "let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
    "let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --smart-case'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --smart-case --skip-vcs-ignores'
    let g:unite_source_grep_recursive_opt = ''
  elseif executable('jvgrep')
    " For jvgrep.
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
  elseif executable('ack-grep')
    " For ack.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
  endif

endfunction
unlet bundle

" unite.vim "}}}

" vimshell "{{{
"
let bundle = neobundle#get('vimshell')
function! bundle.hooks.on_source(bundle)
  "let g:vimshell_user_prompt = 'getcwd()'
  "let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~") ' . 'vcs#info("(%s)-[%b]%p", "(%s)-[%b|%a]%p")'
  "let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  "let g:vimshell_right_prompt = 'vcs#info("(%s)-[ %b ]%p", "(%s)-[ %b | %a ]%p")'

  let g:vimshell_user_prompt = s:SID_PREFIX() . 'vimshell_make_user_prompt()'
  function! s:vimshell_make_user_prompt()
    " 出力行数等
    " return 'L+' . max([0, (line('.') - max(keys(b:vimshell.prompt_current_dir)) - 1)])
    "   \ . ' {' . strftime("%H:%M:%S") . '} '
    "   \ . vcs#info("(%s)-[ %b ] %p", "(%s)-[ %b | %a ] %p")

    " カレントディレクトリ
    return fnamemodify(getcwd(), ":~") . ' ' . vcs#info("(%s)-[ %b ] %p", "(%s)-[ %b | %a ] %p")
    "return fnamemodify(getcwd(), ":~") . ' ' . vcs#info("(%s)-[%b]%p", "(%s)-[%b|%a]%p")
  endfunction

  "let g:vimshell_right_prompt = 'fugitive#statusline()'
  let g:vimshell_prompt = '% '
  let g:vimshell_force_overwrite_statusline = 1
  let g:vimshell_enable_transient_user_prompt = 0

  " 現在時刻出してみた
  " let g:vimshell_prompt_expr =  'escape(strftime("%H:%M:%S"), "\\[]()?! ")." > "'
  " let g:vimshell_prompt_pattern = '^\%(\d\|:\)\+ > '

  " カレントディレクトリ
  " let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~"), "\\[]()?! ")." > "'
  " let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+ > '

  " 出力行数
  " 表示されたあと再度switchすると1減る
  " 正確にするのは大変そう
  let g:vimshell_prompt_expr = '"{" . strftime("%H:%M:%S") . "} L+" . max([0, (line("$") - max(keys(b:vimshell.prompt_current_dir)) - 1)]) . " > "'
  let g:vimshell_prompt_pattern = '{\%(\d\|:\)\+} L+\%(\d\)\+ > '
  " let g:vimshell_prompt_expr = '"L+" . max([0, (line("$") - max(keys(b:vimshell.prompt_current_dir)) - 1)]) . " > "'
  " let g:vimshell_prompt_pattern = '^L+\%(\d\)\+ > '

  "let g:vimshell_editor_command = v:progname . ' --servername=VIM2 --remote-tab-wait-silent'
  "  if has('gui_macvim')
  "      " MacVim check.
  "      if executable('/Applications/MacVim.app/Contents/MacOS/Vim')
  "    	  let progname = '/Applications/MacVim.app/Contents/MacOS/Vim -g'
  "    	  "let g:vimshell_editor_command = progname . ' --servername=VIM2 --remote-tab-wait-silent'
  "    	  "let g:vimshell_editor_command = progname . ' --servername VIM2 --remote-tab-wait-silent'
  "    	  "let g:vimshell_editor_command = progname
  "    	  "let g:vimshell_editor_command = progname . ' --cmd "let g:singleton#disable=1" --servername VIM --remote-tab-wait-silent'
  "    	  let g:vimshell_editor_command = 'open -a /Applications/MacVim.app'
  "      endif
  "  endif

  autocmd MyAutoCmd FileType vimshell call s:vimshell_settings()
  function! s:vimshell_settings()
    nunmap <buffer> <C-K>
    nunmap <buffer> <C-N>
    nunmap <buffer> <C-P>

    " Use zsh history.
	let g:unite_source_vimshell_external_history_path = expand('~/.zsh_history')
    "let g:vimshell_external_history_path = expand('~/.zsh-history')

	" altercmd
	call vimshell#altercmd#define('u', 'cdup')
    call vimshell#altercmd#define('g', 'git')
    call vimshell#altercmd#define('i', 'iexe')
    call vimshell#altercmd#define('q', 'exit')
    "call vimshell#altercmd#define('t', 'texe')

	" alias
    call vimshell#set_alias('ll', 'ls -l')
    call vimshell#set_alias('la', 'ls -a')
    call vimshell#set_alias('t', 'vim --split=tabedit $$args')
	call vimshell#set_alias('up', 'cdup')
    "call vimshell#set_alias('t', ':VimShellTab')
    "call vimshell#set_alias('l.', 'ls -d .*')
    "call vimshell#set_alias('gvim', 'gexe gvim')
    "call vimshell#set_alias('edit', 'vim --split=tabedit $$args')
    "call vimshell#set_alias('e', 'edit')
	
    "call vimshell#set_alias('e', 'vim --split=""')
    "call vimshell#set_alias('edit', 'vim --split=""')
    "call vimshell#set_alias('e', 'edit')
    "call vimshell#set_alias('tw', ':TweetVimHomeTimeline')

	" galias
	call vimshell#set_galias('L', '| less')
	call vimshell#set_galias('G', '| grep')
	call vimshell#set_galias('W', '| wc')
	call vimshell#set_galias('H', '| head')
	call vimshell#set_galias('T', '| tail')
	call vimshell#set_galias('X', '| xargs')
	call vimshell#set_galias('...', '../..')
	call vimshell#set_galias('....', '../../..')
	call vimshell#set_galias('.....', '../../../..')
    "call vimshell#set_galias('L', 'ls -l')
    "call vimshell#set_galias('time', 'exe time -p')


    inoremap <buffer><expr>' pumvisible() ? "\<C-y>" : "'"
    imap <buffer><BS> <Plug>(vimshell_another_delete_backward_char)
    imap <buffer><C-h> <Plug>(vimshell_another_delete_backward_char)
    imap <buffer><C-k> <Plug>(vimshell_zsh_complete)
	inoremap <buffer> <expr><silent> <C-p>  unite#sources#vimshell_history#start_complete(!0)

    nnoremap <buffer>gi GA
    nmap <buffer>tj <Plug>(vimshell_next_prompt)
    nmap <buffer>tk <Plug>(vimshell_previous_prompt)
    nmap <buffer><C-S-K> <Plug>(vimshell_delete_previous_output)

    " Auto jump.
    call vimshell#set_alias('j', ':Unite -buffer-name=files
          \ -default-action=lcd -no-split -input=$$args directory_mru')

    call vimshell#set_alias('k', ':UniteWithCurrentDir -buffer-name=files
          \  -buffer-name=files -no-split file_mru buffer file args')

	call vimshell#hook#add('chpwd', 'my_chpwd', s:vimshell_hooks.chpwd)

  endfunction

  let s:vimshell_hooks = {}
  function! s:vimshell_hooks.chpwd(args, context)
	  if len(split(glob('*'), '\n')) < 100
		  call vimshell#execute('ls')
	  else
		  call vimshell#execute('echo "Many files."')
	  endif
  endfunction

endfunction
unlet bundle

"}}}

" vimfiler "{{{

nnoremap <silent>   [Space]v   :<C-u>VimFiler -find<CR>
nnoremap <silent>   [Space]f   :<C-u>VimFiler -find<CR>
nnoremap            [Space]F  :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>
"nnoremap    [Space]ff   :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>

call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'vim')

let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

"
let g:vimfiler_tree_leaf_icon   = '|'
let g:vimfiler_tree_opened_icon = '-'
let g:vimfiler_tree_closed_icon = '+'
let g:vimfiler_file_icon        = '-'
let g:vimfiler_marked_file_icon = '*'

" This variable controls default vimfiler sort type.
let g:vimfiler_sort_type = 'Time'
"let g:vimfiler_enable_auto_cd = 1

" Use trashbox.
" Windows only and require latest vimproc.
"let g:unite_kind_file_use_trashbox = 1
"

if s:is_mac
	" Mac OS X.
	let g:vimfiler_quick_look_command = 'qlmanage -p'
endif

autocmd MyAutoCmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings() "{{{
  nunmap <buffer> <C-j>
  nunmap <buffer> S
  nunmap <buffer> K
  nunmap <buffer> U

  nnoremap <silent><buffer> J
        \ :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
  nmap <buffer> s  <Plug>(vimfiler_select_sort_type)
  nmap <buffer> F  <Plug>(vimfiler_make_directory)
  nmap <buffer> u  <Plug>(vimfiler_clear_mark_all_lines)
  nnoremap <silent><buffer><expr> gy vimfiler#do_action('tabopen')

  " ちゃんと動いてない 2013/06/09
  nmap <buffer> '  <Plug>(vimfiler_quick_look)

  nmap <silent><buffer> >
        \ <Plug>(vimfiler_cd_vim_current_dir)K>

  setlocal cursorline
  setlocal nonumber

endfunction "}}}

" vimfiler "}}}

" EasyMotion "{{{
"
let g:EasyMotion_leader_key = ','
let g:EasyMotion_do_shade = 1
"let g:EasyMotion_keys = 'asdfghjkl'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_grouping = 1 "2


"}}}

" fontzoom.vim"{{{
nmap + <Plug>(fontzoom-larger)
nmap _ <Plug>(fontzoom-smaller)
"}}}

" altercmd.vim{{{
let bundle = neobundle#get('vim-altercmd')
function! bundle.hooks.on_source(bundle)
  call altercmd#load()

  AlterCommand <cmdwin> u[nite] Unite
  AlterCommand u[nite] Unite
  AlterCommand <cmdwin> e[dit] Edit
  AlterCommand e[dit] Edit
  AlterCommand <cmdwin> r[ead] Read
  AlterCommand r[ead] Read
  AlterCommand <cmdwin> so[urce] Source
  AlterCommand so[urce] Source
  AlterCommand <cmdwin> w[rite] Write
  AlterCommand w[rite] Write
endfunction
unlet bundle
"}}}

" ctrlp.vim{{{
  "nnoremap <silent> <S-CR>  :<C-u>CtrlP<Return>
  ""nnoremap <silent> KK  :<C-u>CtrlPMRUFiles<Return>
  ""nnoremap <silent> <C-m>  :<C-u>CtrlPMRUFiles<Return>
  ""nnoremap <silent> <C-l>  :<C-u>CtrlP<Return>
  ""let g:ctrlp_map = '<c-l>'
  "let g:ctrlp_use_migemo = 1
  "let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
  "let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
  "let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
  "let g:ctrlp_working_path_mode = 'ra'
  "let g:ctrlp_by_filename = 1 " ファイル名部分で検索 <c-d> でフルパスモードとトグル



"}}}

" tabpagecd{{{
autocmd MyAutoCmd TabEnter * NeoBundleSource vim-tabpagecd
"}}}

" reanimate{{{

" 2013/05/15 Saveで書き込めずうまく使えてない

" 保存先のディレクトリ
" let g:reanimate_save_dir = "~/reanimate"
"let g:reanimate_save_dir = "~/.vim/reanimate"

" :ReanimateSave<CR>
" のように引数がない場合に使用される名前です
" let g:reanimate_default_save_name = "latest"

" sessionoptions
"let g:reanimate_sessionoptions="curdir,folds,help,localoptions,slash,tabpages,winsize"

"}}}

" fugitive{{{
nnoremap [Space]gg :<C-u>Git<Space>
nnoremap [Space]gs :<C-u>Gstatus<cr>

augroup MyAutoCmd
	" autocmd User fugitive
	" 			\ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	" 			\   nnoremap <buffer> .. :edit %:h<CR> |
	" 			\ endif
	" autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

"}}}

" gitv{{{
nnoremap [Space]gv :<C-u>Gitv --all<cr>
nnoremap [Space]gV :<C-u>Gitv! --all<cr>
vnoremap [Space]gV :<C-u>Gitv! --all<cr>
"cabbrev git Git
"highlight diffAdded guifg=#00bf00
"highlight diffRemoved guifg=#bf0000
"let g:Gitv_WrapLines = 1
let g:Gitv_TruncateCommitSubjects = 1

autocmd MyAutoCmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  "nmap  <buffer>  S [Window]
  "nunmap <buffer> S "FileTypeのタイミングではうまくいかない

  setlocal iskeyword+=/,-,.
  nnoremap <buffer> C :<C-u>Git checkout <C-r><C-w><Space>
  "nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>

  " この要領でやりたいこと追加可能
  " nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=<SID>gitv_get_current_hash()<CR><Space>
  " nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=<SID>gitv_get_current_hash()<CR><CR>
  " nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=<SID>gitv_get_current_hash()<CR><CR>
  " nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=<SID>gitv_get_current_hash()<CR>

  nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
  nnoremap <silent><buffer> f <C-w>w<C-f><C-w>w
  nnoremap <silent><buffer> b <C-w>w<C-b><C-w>w
endfunction

function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

autocmd MyAutoCmd FileType git call s:my_git_settings()
function! s:my_git_settings()
"  nmap  <buffer>  S [Window]
  "nunmap <buffer> S "FileTypeのタイミングではうまくいかない
  setlocal nofoldenable foldlevel=0
endfunction

function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction

autocmd MyAutoCmd FileType gitcommit call s:my_gitcommit_settings()
function! s:my_gitcommit_settings()
  "nunmap <buffer> S "FileTypeのタイミングではうまくいかない
  highlight link gitcommitSelectedFile diffAdded
  "highlight gitcommitSelectedFile guifg=#00bf00
endfunction

"}}}

" open-browser.vim{{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gw <Plug>(openbrowser-smart-search)
vmap gw <Plug>(openbrowser-smart-search)
"nmap gx <Plug>(openbrowser-smart-search)
"vmap gx <Plug>(openbrowser-smart-search)
"}}}

" evervim "{{{
"let g:evervim_devtoken='SECRET'

nnoremap <silent> [Space]el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> [Space]et :<C-u>EvervimListTags<CR>
nnoremap <silent> [Space]en :<C-u>EvervimCreateNote<CR>
"nnoremap <silent> [Space]ew :<C-u>EvervimOpenBrowser<CR>
"nnoremap <silent> [Space]ec :<C-u>EvervimOpenClient<CR>
nnoremap [Space]es<SPACE> :<C-u>EvervimSearchByQuery<SPACE>
nnoremap [Space]est :<C-u>EvervimSearchByQuery<SPACE>tag:
nnoremap [Space]esr :<C-u>EvervimSearchByQuery<SPACE>updated:day-1
"nnoremap <silent> [Space]et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
"nnoremap <silent> [Space]eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
"let g:evervim_splitoption=''

"}}}

" vim-versions.git "{{{
" 2013/06/09 ちゃんと動いてない

"}}}

" clever-f.vim "{{{
let g:clever_f_not_overwrites_standard_mappings = 1
map f  <Plug>(clever-f-f)
map F  <Plug>(clever-f-F)
" nmap t  <Plug>(clever-f-t)
" nmap T  <Plug>(clever-f-T)

"}}}

" neosnippet "{{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate/snippets/'
"let g:neosnippet#snippets_directory = '~/.vim/snippets/,~/.vim/bundle/vim-snippets/snippets/'
let g:neosnippet#snippets_directory = '~/.vim/snippets/,~/.vimbundles/vim-snippets/snippets/'

"}}}

" ref.vim "{{{

"}}}

" surround.vim"{{{
let g:surround_no_mappings = 1
autocmd MyAutoCmd FileType * call s:define_surround_keymappings()

function! s:define_surround_keymappings()
  if !&l:modifiable
    silent! nunmap <buffer> ds
    silent! nunmap <buffer> cs
    silent! nunmap <buffer> ys
    silent! nunmap <buffer> yS
  else
    nmap <buffer>         ds   <Plug>Dsurround
    nmap <buffer>         cs   <Plug>Csurround
    nmap <buffer>         ys   <Plug>Ysurround
    nmap <buffer>         yS   <Plug>YSurround
  endif
endfunction
"}}}

" TweetVim "{{{
" Start TweetVim.
nnoremap <silent> [unite]w :<C-u>Unite tweetvim<CR>
autocmd MyAutoCmd FileType tweetvim call s:tweetvim_my_settings()
function! s:tweetvim_my_settings() "{{{
  nunmap <buffer> t
  nmap <buffer> t <Leader>
  nmap <buffer> tt <Leader><Leader>

  " Open say buffer.
  nnoremap <silent><buffer> o :TweetVimSay<CR>
  nnoremap <silent><buffer> q :close<CR>
  "nmap <silent><buffer> j <Plug>(accelerated_jk_gj)
endfunction "}}}

let g:tweetvim_display_separator = 1
"}}}

" accelerated-jk "{{{
if neobundle#is_installed('accelerated-jk')
  " accelerated-jk
  nmap <silent>j <Plug>(accelerated_jk_gj)
  nmap gj j
  nmap <silent>k <Plug>(accelerated_jk_gk)
  nmap gk k
endif
"}}}

" vinarise.vim"{{{
let g:vinarise_enable_auto_detect = 1
"}}}

" taskpaper "{{{
let g:task_paper_date_format = "%Y-%m-%d %H%M" " ':' が邪魔
"let g:task_paper_date_format = "%Y-%m-%d %H:%M"

function! s:taskpaper_setup() "{{{
  nmap <buffer> t  <Leader>t

  " Your settings
  nnoremap <buffer> <silent> <Leader>tn
        \    :<C-u>call taskpaper#toggle_tag('next', '')<CR>
  nnoremap <buffer> <silent> <Leader>tN
        \    :<C-u>call taskpaper#delete_tag('next', '')<CR>

  " nextを消しつつdoneをトグル、次の行へ
  nmap <buffer> <silent> <Leader>t<Space>  tNtdj
  nmap <buffer> <silent> <Leader>ta        tD

  "inoremap <buffer> <Tab>   <Space><BS><Esc>>>A
  "inoremap <buffer> <S-Tab> <Space><BS><Esc><<A
  inoremap <buffer><expr><TAB>    pumvisible() ? "\<C-n>" : "\<Space>\<BS>\<Esc>>>A"
  inoremap <buffer><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<Space>\<BS>\<Esc><<A"

  Arpeggio nnoremap <buffer> an  /-.*next<CR>
  Arpeggio nnoremap <buffer> vn  /-.*next<CR>
endfunction"}}}

augroup vimrc-taskpaper
autocmd!
autocmd FileType taskpaper call s:taskpaper_setup()
augroup END

"}}}

" vim-textmanip "{{{
" 選択したテキストの移動
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" 行の複製
xmap <C-d> <Plug>(textmanip-duplicate-down)
"}}}

" vim-arpeggio "{{{
let bundle = neobundle#get('vim-arpeggio')
function! bundle.hooks.on_source(bundle)
	Arpeggio inoremap jk  <Esc>
	Arpeggio inoremap jl  <Esc>
	Arpeggio xnoremap jk  <Esc>
	Arpeggio xnoremap jl  <Esc>
endfunction

unlet bundle
"}}}

" vim-quickhl "{{{
nmap [Space]m <Plug>(quickhl-toggle)
xmap [Space]m <Plug>(quickhl-toggle)
nmap [Space]M <Plug>(quickhl-reset)
xmap [Space]M <Plug>(quickhl-reset)
nmap [Space]j <Plug>(quickhl-match)
"}}}


" lightline.vim "{{{
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ }
      \ }
      "\ 'separator': { 'left': '⮀', 'right': '⮂' },
      "\ 'subseparator': { 'left': '⮁', 'right': '⮃' }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? 'x' : ''
  "return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') : 
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? ''.fugitive#head() : ''
  "return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
"}}}

" <next plugin setting> "{{{

"}}}

"
"}}} 

"---------------------------------------------------------------------------
" Key-mappings: "{{{

" Ordinary " {{{
nnoremap    K   <Nop>
xnoremap    K   <Nop>
nnoremap <silent> KA  :<C-u>Unite -buffer-name=files args<CR>
nnoremap <silent> KK  :<C-u>UniteWithCurrentDir -buffer-name=files args file_mru buffer file<CR>
nnoremap <silent> Kk  :<C-u>Unite               -buffer-name=files args file_mru buffer file<CR>

nnoremap <silent> KR  :<C-u>Unite -buffer-name=files file_rec/async buffer file<CR>
"nnoremap <silent> KK  :<C-u>Unite -buffer-name=files buffer file_mru file<CR>
"nnoremap <silent> KK  :<C-u>CtrlPMRUFiles<Return>
"nmap <silent> KP  KK<c-p>
nnoremap <silent> KF  :<C-u>Unite -buffer-name=files file<CR>
"nnoremap <silent> KF  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

nnoremap <silent> KO  :<C-u>Unite outline -start-insert -resume<CR>
"nnoremap <silent> KO  :<C-u>Unite outline<CR>

"nnoremap <silent> KJ  :<C-u>Unite -buffer-name=files -default-action=cd directory_mru<CR>
nnoremap <silent> KJ  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
"nnoremap <silent> KH  :<C-u>VimShellPop<CR>
nnoremap <silent> KM  :<C-u>Unite menu<CR>
nnoremap KS  :<C-u>Unite source<CR>
nnoremap KU  q:Unite<Space>
"nnoremap <expr><silent> KL
"  \ ":\<C-u>Unite -buffer-name=line -input=" . @/ . " -no-start-insert line\<CR>"

nnoremap <silent> KB  :<C-u>Unite -buffer-name=files bookmark<CR>

"nnoremap <silent> K>  :<C-u>Unite -buffer-name=files -start-insert file_rec/async<CR>

xnoremap <silent> K"
      \ d:<C-u>Unite -buffer-name=register register history/yank<CR>
nnoremap <silent> K"
      \ :<C-u>Unite -buffer-name=register register history/yank<CR>

nnoremap <silent> K:
      \ :<C-u>Unite -buffer-name=commands history/command<CR>

" -resume なし
nnoremap <silent> KG
      \ :<C-u>Unite grep -buffer-name=search -auto-preview -no-quit<CR>

nnoremap <silent> [Space]h  :<C-u>VimShellBufferDir<CR>
"nnoremap <silent> [Space]h  :<C-u>VimShell<CR>
"nnoremap <silent> [Space]h  :<C-u>VimShellPop<CR>

"nmap :  <Plug>(vimshell_split_switch)
nmap :  <Plug>(vimshell_switch)
"nmap [Colon]  <Plug>(vimshell_switch)
"nmap :  <Plug>(vimshell_switch)
"nmap <silent> KH  <Plug>(vimshell_switch)
"nnoremap <silent> K:  :<C-u>VimShellBufferDir<CR>
"nnoremap <silent> KB  :<C-u>VimShellBufferDir<CR>
"nnoremap <silent> KH  :<C-u>VimShellPop<CR>
"nmap <CR> <Plug>(vimshell_switch)
"nmap <C-@> <Plug>(vimshell_switch)
"でいつでもvimshellを呼んでいるとはそこまでvimshellが重要だったのか

nnoremap KW  :<C-u>TweetVimHomeTimeline<CR>

" }}}

" neetular Tag jumping  " {{{

nnoremap    [Tag]   <Nop>
"nmap    <C-T> [Tag]
nmap    t [Tag]

" ``T'' is also disabled for consistency.
"noremap           T          <Nop>

" Alternatives for the original actions.
noremap           [Space]t   t
noremap           [Space]T   T

nnoremap          [Tag]t         <C-]>
vnoremap          [Tag]t         <C-]>
nnoremap <silent> [Tag]j         :<C-u>tag<Return>
nnoremap <silent> [Tag]k         :<C-u>pop<Return>
nnoremap <silent> [Tag]l         :<C-u>tags<Return>
nnoremap <silent> [Tag]n         :<C-u>tnext<Return>
nnoremap <silent> [Tag]p         :<C-u>tprevious<Return>
nnoremap <silent> [Tag]P         :<C-u>tfirst<Return>
nnoremap <silent> [Tag]N         :<C-u>tlast<Return>
nnoremap <silent> [Tag]s         :<C-u>tselect<Return>

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" neetular }}}

" neetular Quickfix  " {{{

" the prefix key.
nnoremap [Quickfix]   <Nop>
nmap    q  [Quickfix]

" alternative key for the original action.
" -- Ex-mode will be never used and recordings are rarely used.
nnoremap          Q          q

" For quickfix list  "
nnoremap <silent> [Quickfix]j         :Execute cnext [count]<Return>
nnoremap <silent> [Quickfix]k         :Execute cprevious [count]<Return>
nnoremap <silent> [Quickfix]r         :Execute crewind [count]<Return>
nnoremap <silent> [Quickfix]K         :Execute cfirst [count]<Return>
nnoremap <silent> [Quickfix]J         :Execute clast [count]<Return>
nnoremap <silent> [Quickfix]fj        :Execute cnfile [count]<Return>
nnoremap <silent> [Quickfix]fk        :Execute cpfile [count]<Return>
nnoremap <silent> [Quickfix]l         :<C-u>clist<Return>
nnoremap <silent> [Quickfix]q         :Execute cc [count]<Return>
nnoremap <silent> [Quickfix]o         :Execute copen [count]<Return>
nnoremap <silent> [Quickfix]c         :<C-u>cclose<Return>
nnoremap <silent> [Quickfix]p         :Execute colder [count]<Return>
nnoremap <silent> [Quickfix]n         :Execute cnewer [count]<Return>
nnoremap <silent> [Quickfix]m         :<C-u>make<Return>
nnoremap          [Quickfix]M         :<C-u>make<Space>
nnoremap          [Quickfix]<Space>   :<C-u>make<Space>
nnoremap          [Quickfix]g         :<C-u>grep<Space>

" カーソル下の単語grep
" (バイナリファイルを誤って対象にしてしまうのを防ぐため、
" デフォルトで .h を対象とする)

" grep
"nnoremap ,,                  :<C-u>grep <C-r><C-w> **/*.h
" ag
nnoremap ,,                  :<C-u>grep \\b<C-r><C-w>\\b
nnoremap ,.                  :<C-u>grep <C-r><C-w>


" For location list (mnemonic: Quickfix list for the current Window)  "
nnoremap <silent> [Quickfix]wj        :Execute lnext [count]<Return>
nnoremap <silent> [Quickfix]wk        :Execute lprevious [count]<Return>
nnoremap <silent> [Quickfix]wr        :Execute lrewind [count]<Return>
nnoremap <silent> [Quickfix]wK        :Execute lfirst [count]<Return>
nnoremap <silent> [Quickfix]wJ        :Execute llast [count]<Return>
nnoremap <silent> [Quickfix]wfj       :Execute lnfile [count]<Return>
nnoremap <silent> [Quickfix]wfk       :Execute lpfile [count]<Return>
nnoremap <silent> [Quickfix]wl        :<C-u>llist<Return>
nnoremap <silent> [Quickfix]wq        :Execute ll [count]<Return>
nnoremap <silent> [Quickfix]wo        :Execute lopen [count]<Return>
nnoremap <silent> [Quickfix]wc        :<C-u>lclose<Return>
nnoremap <silent> [Quickfix]wp        :Execute lolder [count]<Return>
nnoremap <silent> [Quickfix]wn        :Execute lnewer [count]<Return>
nnoremap <silent> [Quickfix]wm        :<C-u>lmake<Return>
nnoremap          [Quickfix]wM        :<C-u>lmake<Space>
nnoremap          [Quickfix]w<Space>  :<C-u>lmake<Space>
nnoremap          [Quickfix]wg        :<C-u>lgrep<Space>
" カーソル下の単語grep
nnoremap [Quickfix]w,                 :<C-u>lgrep <C-r><C-w> **/*.h

function! s:Count(...)
  if v:count == v:count1  " count is specified.
    return v:count
  else  " count is not specified.  (the default '' is useful for special value)
    return a:0 == 0 ? '' : a:1
  endif
endfunction

command! -nargs=* -complete=expression -range -count=0 Execute
      \ call s:Execute(<f-args>)
function! s:Execute(...)
  let args = []
  for a in a:000
    if a ==# '[count]'
      let a = s:Count()
    endif
    call add(args, a)
  endfor
  execute join(args)
endfunction

" neetular }}}

" neetular Input: datetime  " {{{
"
" Input the current date/time (Full, Date, Time).
"
" FIXME: use timezone of the system, instead of static one.
" FIXME: revise the {lhs}s, compare with the default keys of textobj-datetime.

inoremap <Leader>dF  <C-r>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<Return>
inoremap <Leader>df  <C-r>=strftime('%Y-%m-%dT%H:%M:%S')<Return>
inoremap <Leader>dd  <C-r>=strftime('%Y%m%d')<Return>
inoremap <Leader>d/  <C-r>=strftime('%Y/%m/%d')<Return>
inoremap <Leader>d-  <C-r>=strftime('%Y-%m-%d')<Return>
"inoremap <Leader>dd  <C-r>=strftime('%Y-%m-%d')<Return>
inoremap <Leader>dT  <C-r>=strftime('%H:%M:%S')<Return>
inoremap <Leader>dt  <C-r>=strftime('%H:%M')<Return>

" neetular }}}

" neetular Misc.  " {{{

"noremap j gj
"noremap k gk

" ウィンドウ間の移動
nnoremap <C-j> <C-W>w
nnoremap <C-k> <C-W>W

" タブ切り替え
nnoremap <C-N> gt
nnoremap <C-P> gT
nnoremap <C-TAB> gt
nnoremap <C-S-TAB> gT

" 2010-06-30 変更 今編集しているファイルのあるディレクトリにlcd
"nnoremap g.  :<C-u>lcd %:h<CR>

" Like gv, but select the last changed text.
nnoremap gm  `[v`]
vnoremap gm  :<C-u>normal gm<Return>
onoremap gm  :<C-u>normal gm<Return>

" Y を D や C と同じ挙動に
nnoremap Y  y$

" ウィンドウの高さを選択範囲と同じになるよう調整
" by id:ka-nacht
vnoremap <silent> _ <Esc>`<zt:execute (line("'>") - line("'<") + 1) 'wincmd' '_'<Return>

nnoremap <C-h>  :<C-u>vertical botright help<Space>
nnoremap <C-h><C-h>  :<C-u>vertical botright help<Space><C-r><C-w><Return>
nnoremap <C-h><C-t>  :<C-u>exe "vertical botright help " . getbufvar(bufnr('%'), '&filetype')<CR>

" TODO: ヘルプバッファ存在してウィンドウ閉じてまた開いた時などのため改善
autocmd MyAutoCmd FileType help vertical resize 80
"nnoremap <C-h>  :<C-u>rightbelow help<Space>
"nnoremap <C-h><C-h>  :<C-u>rightbelow help<Space><C-r><C-w><Return>

" 候補補完の仕方をzshライクに
cnoremap <C-p>  <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n>  <Down>
cnoremap <Down>  <C-n>

" neetular }}}

" Command-line mode keymappings:"{{{
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
"pending " <C-b>: previous char.
"pending cnoremap <C-b>          <Left>
" <C-d>: delete char.
"pending cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
"pending " <C-f>: next char.
"pending cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-k>, K: delete to end.
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
"}}}

" Command line buffer."{{{
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-u>

"nmap ::  <SID>(command-line-enter)
"xmap ::  <SID>(command-line-enter)
nmap ;;  <SID>(command-line-enter)
xmap ;;  <SID>(command-line-enter)

" test
"cnoremap <buffer><expr> ; col('.') == 1 ?
"	\ "\<C-f>" : ";"

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
autocmd MyAutoCmd CmdwinLeave * call s:quit_cmdwin()
"autocmd MyAutoCmd CmdwinLeave * let g:neocomplcache_enable_auto_select = 1

function! s:init_cmdwin()
  "NeoBundleSource vim-altercmd

  let g:neocomplcache_enable_auto_select = 0
  let b:neocomplcache_sources_list = ['vim_complete']

  nnoremap <buffer><silent> q :<C-u>quit<CR>
  nnoremap <buffer><silent> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> neocomplcache#close_popup()."\<CR>"
  inoremap <buffer><expr><C-h> col('.') == 1 ?
        \ "\<ESC>:quit\<CR>" : neocomplcache#cancel_popup()."\<C-h>"
  inoremap <buffer><expr><BS> col('.') == 1 ?
        \ "\<ESC>:quit\<CR>" : neocomplcache#cancel_popup()."\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ?
        \ "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>\<C-p>"

  startinsert!
endfunction

function! s:quit_cmdwin()
  let g:neocomplcache_enable_auto_select = 1
  "nmap :  <Plug>(vimshell_switch)
endfunction

"}}}


" [Space]: Other useful commands "{{{
" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap, disappeared [Space].
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>

" neetular {{{
nnoremap          [Space]o   <Nop>

nnoremap          [Space]of  <Nop>
nnoremap <silent> [Space]ofw :<C-u>setlocal fenc=cp932 ff=dos<Return>
nnoremap <silent> [Space]ofu :<C-u>setlocal fenc=utf-8 ff=unix<Return>

nnoremap          [Space]s   <Nop>
nnoremap <silent> [Space]s.  :<C-u>source $MYVIMRC<Return>
nnoremap <silent> [Space]ss  :<C-u>source %<Return>

" tabstop 切り替え
"nnoremap <silent> [Space]8   :setl tabstop=8<Return>
"nnoremap <silent> [Space]4   :setl tabstop=4<Return>
nnoremap <silent> [Space]2 :<C-u>setl tabstop=2 shiftwidth=2 softtabstop=2<CR>
nnoremap <silent> [Space]4 :<C-u>setl tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <silent> [Space]8 :<C-u>setl tabstop=8 shiftwidth=8 softtabstop=8<CR>

" 引数リスト編集 (カレントファイルの操作に特化)
nnoremap          [Space]a   <Nop>
nnoremap          [Space]ar  :<C-u>args %<Return>
nnoremap          [Space]aa  :<C-u>argadd %<Return>
nnoremap          [Space]ad  :<C-u>argdelete %<Return>

" neetular }}}

" Toggle relativenumber.
nnoremap <silent> [Space].
      \ :<C-u>call ToggleOption('relativenumber')<CR>
nnoremap <silent> [Space]p
      \ :<C-u>call ToggleOption('paste')<CR>:set mouse=<CR>
" Toggle highlight.
nnoremap <silent> [Space]/
      \ :<C-u>call ToggleOption('hlsearch')<CR>
" Toggle cursorline.
nnoremap <silent> [Space]cl
      \ :<C-u>call ToggleOption('cursorline')<CR>
"pending " Set autoread.
"pending nnoremap [Space]ar
"pending       \ :<C-u>setlocal autoread<CR>
" Output encoding information.
"nnoremap <silent> [Space]en
"      \ :<C-u>setlocal encoding? termencoding? fenc? fencs?<CR>
" Set spell check.
nnoremap [Space]sp
      \ :<C-u>call ToggleOption('spell')<CR>
nnoremap [Space]w
      \ :<C-u>call ToggleOption('wrap')<CR>
" Echo syntax name.
nnoremap <silent> [Space]sy
      \ :<C-u>echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>

" Easily edit .vimrc and .gvimrc "{{{
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> [Space]eg  :<C-u>edit $MYGVIMRC<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> [Space]rv :<C-u>source $MYVIMRC \|
      \ if has('gui_running') \|
      \   source $MYGVIMRC \|
      \ endif \| echo "source $MYVIMRC"<CR>
nnoremap <silent> [Space]rg
      \ :<C-u>source $MYGVIMRC \|
      \ echo "source $MYGVIMRC"<CR>
"}}}

" Useful save mappings.
"pending nnoremap <silent> <Leader><Leader> :<C-u>update<CR>

" Change current directory.
" TODO: g. に変えたり save_dir がないのをなんとかしたり
"nnoremap <silent> [Space]cd :<C-u>call <SID>cd_buffer_dir()<CR>
nnoremap <silent> g.  :<C-u>call <SID>cd_buffer_dir()<CR>
nnoremap <silent> [Space]cd :<C-u>call <SID>cd_buffer_dir()<CR>
function! s:cd_buffer_dir() "{{{
  let filetype = getbufvar(bufnr('%'), '&filetype')
  if filetype ==# 'vimfiler'
    let dir = getbufvar(bufnr('%'), 'vimfiler').current_dir
  elseif filetype ==# 'vimshell'
    let dir = getbufvar(bufnr('%'), 'vimshell').current_dir
  else
    let dir = isdirectory(bufname('%')) ? bufname('%') : fnamemodify(bufname('%'), ':p:h')
  endif

  cd `=dir`
endfunction"}}}

" Delete windows ^M codes.
nnoremap <silent> [Space]<C-m> mmHmt:<C-u>%s/\r$//ge<CR>'tzt'm

"pending " Delete spaces before newline.
"pending nnoremap <silent> [Space]ss mmHmt:<C-u>%s/<Space>$//ge<CR>`tzt`m

"pending " Easily syntax change.
"pending nnoremap <silent> [Space]ft :<C-u>Unite -start-insert filetype<CR>

" Change tab width. "{{{
nnoremap <silent> [Space]ot2 :<C-u>setl shiftwidth=2 softtabstop=2<CR>
nnoremap <silent> [Space]ot4 :<C-u>setl shiftwidth=4 softtabstop=4<CR>
nnoremap <silent> [Space]ot8 :<C-u>setl shiftwidth=8 softtabstop=8<CR>
"}}}

"}}}

" s: Windows and buffers(High priority) "{{{
" The prefix key.
nnoremap    [Window]   <Nop>
nmap    S [Window]
"nmap    s [Window]
"nnoremap <silent> [Window]s  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]S  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]p  :<C-u>split<CR>
nnoremap <silent> [Window]P  :<C-u>split<CR>
"nnoremap <silent> [Window]p  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>
nnoremap <silent> [Window]V  :<C-u>vsplit<CR>
nnoremap <silent> [Window]c  :<C-u>call <sid>smart_close()<CR>
nnoremap <silent> [Window]C  :<C-u>call <sid>smart_close()<CR>
nnoremap <silent> -  :<C-u>call <SID>smart_close()<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]O  :<C-u>only<CR>

" A .vimrc snippet that allows you to move around windows beyond tabs
nnoremap <silent> <Tab> :call <SID>NextWindow()<CR>
nnoremap <silent> <S-Tab> :call <SID>PreviousWindowOrTab()<CR>

function! s:smart_close()
  if winnr('$') != 1
    close
  endif
endfunction

function! s:NextWindow()
  if winnr('$') == 1
    silent! normal! ``z.
  else
    wincmd w
  endif
endfunction

function! s:NextWindowOrTab()
  if tabpagenr('$') == 1 && winnr('$') == 1
    call s:split_nicely()
  elseif winnr() < winnr("$")
    wincmd w
  else
    tabnext
    1wincmd w
  endif
endfunction

function! s:PreviousWindowOrTab()
  if winnr() > 1
    wincmd W
  else
    tabprevious
    execute winnr("$") . "wincmd w"
  endif
endfunction

nnoremap <silent> [Window]<Space>  :<C-u>call <SID>ToggleSplit()<CR>
" If window isn't splited, split buffer.
function! s:ToggleSplit()
  let prev_name = winnr()
  silent! wincmd w
  if prev_name == winnr()
    SplitNicely
  else
    call s:smart_close()
  endif
endfunction
" Split nicely."{{{
command! SplitNicely call s:split_nicely()
function! s:split_nicely()
  " Split nicely.
  if winwidth(0) > 80*2
  "if winwidth(0) > 2 * winheight(0)
  "if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction
"}}}
" Delete current buffer."{{{
nnoremap <silent> [Window]d  :<C-u>call <SID>CustomBufferDelete(0)<CR>
" Force delete current buffer.
nnoremap <silent> [Window]D  :<C-u>call <SID>CustomBufferDelete(1)<CR>
function! s:CustomBufferDelete(is_force)
  let current = bufnr('%')

  call unite#util#alternate_buffer()

  if a:is_force
    silent! execute 'bdelete! ' . current
  else
    silent! execute 'bdelete ' . current
  endif
endfunction
"}}}

" JunkFile
" nnoremap <silent> [Window]e  :<C-u>JunkfileOpen<CR>
nnoremap <silent> [Window]e  :<C-u>Unite junkfile/new junkfile -start-insert<CR>
nnoremap <silent> [Window]E  :<C-u>Unite junkfile/new junkfile -start-insert<CR>

" neetular {{{
" タブ操作 
nnoremap          [Window]H   :<C-u>tabrewind<Return>
nnoremap          [Window]J   :<C-u>tabclose<Return>
nnoremap          [Window]K   <C-w>T
nnoremap          [Window]L   :<C-u>tabedit<Return>
nnoremap          [Window]T   :<C-u>VimShellTab<Return>
nnoremap          [Window]:   :<C-u>VimShellTab<Return>
nnoremap          [Window]F   :<C-u>VimFilerTab<Return>
nnoremap          [Window]U   :<C-u>GundoToggle<CR>
" neetular }}}
"}}}

" Easy escape."{{{
inoremap jj           <ESC>
inoremap kk           <ESC>
" inoremap <expr> j       getline('.')[col('.') - 2] ==# 'j' ? "\<BS>\<ESC>" : 'j'
cnoremap <expr> j       getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
onoremap jj           <ESC>

inoremap j<Space>     j<Space>
onoremap j<Space>     j<Space>
"}}}

"}}}

"---------------------------------------------------------------------------
" Commands:"{{{
"
" Toggle options. "{{{
function! ToggleOption(option_name)
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction  "}}}
" Toggle variables. "{{{
function! ToggleVariable(variable_name)
  if eval(a:variable_name)
    execute 'let' a:variable_name.' = 0'
  else
    execute 'let' a:variable_name.' = 1'
  endif
  echo printf('%s = %s', a:variable_name, eval(a:variable_name))
endfunction  "}}}

"command! SessionLoad :source ~/.vim/.session
"command! SessionSave :mksession! ~/.vim/.session

"}}}

"---------------------------------------------------------------------------
" Functions:"{{{
"

"}}}

"---------------------------------------------------------------------------
" Platform depends:"{{{
"

"}}}

"---------------------------------------------------------------------------
" Others:"{{{
"

" Default home directory.
let t:cwd = getcwd()

" dotnet-complete.git
augroup MyAutoCmd
	autocmd BufNewFile,BufRead *.cs      setl omnifunc=cs#complete
	autocmd BufNewFile,BufRead *.cs      setl bexpr=cs#balloon()
	autocmd BufNewFile,BufRead *.cs      setl ballooneval
augroup END

"}}}

" coffee {{{
augroup MyAutoCmd
	" vimにcoffeeファイルタイプを認識させる
	autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
	" インデントを設定
	autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 "etなし
	"autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
augroup END

" taglistの設定 coffeeを追加
" let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

" QuickRunのcoffee
" let g:quickrun_config['coffee'] = {
"      \'command' : 'coffee',
"      \'exec' : ['%c -cbp %s']
"      \}

"------------------------------------
" vim-coffee-script
"------------------------------------
" 保存時にコンパイル
autocmd MyAutoCmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"------------------------------------
" jasmine.vim
"------------------------------------
" ファイルタイプを変更
function! JasmineSetting()
  augroup MyAutoCmd
    autocmd BufRead,BufNewFile *Helper.js,*Spec.js  set filetype=jasmine.javascript
    autocmd BufRead,BufNewFile *Helper.coffee,*Spec.coffee  set filetype=jasmine.coffee
    autocmd BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee  let b:quickrun_config = {'type' : 'coffee'}
  augroup END
  call jasmine#load_snippets()
  map <buffer> <leader>m :JasmineRedGreen<CR>
  command! JasmineRedGreen :call jasmine#redgreen()
  command! JasmineMake :call jasmine#make()
endfunction
autocmd MyAutoCmd BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors=1
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=5
"let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

augroup MyAutoCmd
	autocmd VimEnter,Colorscheme * : hi IndentGuidesOdd  guifg=#333333 guibg=#0b1b27 ctermbg=235
	autocmd VimEnter,Colorscheme * : hi IndentGuidesEven guifg=#000000 guibg=#1b2b37 ctermbg=237
	autocmd FileType coffee,ruby,javascript,python IndentGuidesEnable
augroup END
nmap <silent><Leader>ig <Plug>IndentGuidesToggle


"}}}

" Testing
"set scrolljump=10

" hack 104 http://vim-users.jp/2009/11/hack104/ {{{
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" }}}

" Vim-users.jp - Hack #203: 定義されているマッピングを調べる
" http://vim-users.jp/2011/02/hack203/
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>

" restart.vim {{{
" 使うと大文字マークが消える？（VとかNとか）
" let g:restart_save_window_values = 0
" nnoremap <silent> [Space]re  :<C-u>Restart<CR>

" " セッション有りはうまくいかない
" command!
" \   RestartWithSession
" \   let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
" \   | Restart

"}}}

if argc() == 0
  autocmd MyAutoCmd VimEnter * VimShell
endif

if s:is_windows
  nnoremap <silent> [unite]U
        \ :<C-u>Unite -buffer-name=files -no-split -multi-line
        \ jump_point file_point buffer_tab
        \ file_rec:! file file/new file_mru<CR>
else
  nnoremap <silent> [unite]U
        \ :<C-u>Unite -buffer-name=files -no-split -multi-line
        \ jump_point file_point buffer_tab
        \ file_rec/async:! file file/new file_mru<CR>
endif


" いまいち
function! s:vimrc_vimshell_less()
  "if bufname('%') =~ '^less-git log -u'
  if bufname('%') =~ 'diff'
    set filetype=diff
  endif
endfunction
autocmd MyAutoCmd FileType vimshell-less call <SID>vimrc_vimshell_less()

" Don't move on *
nnoremap * *<c-o>
"nnoremap <silent> * :exe "silent! normal! *<c-o>"<CR>

" Keep search matches in the middle of the window.
"nnoremap n nzzzv
"nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
"nnoremap <c-o> <c-o>zz

"---------------------------------------------------------------------------

"
" vim: foldmethod=marker