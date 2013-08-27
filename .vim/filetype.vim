" ファイルタイプ追加
if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.as		setfiletype actionscript
	au! BufRead,BufNewFile *.jpp	setfiletype java
	au! BufRead,BufNewFile *.hta	setfiletype html
	au! BufRead,BufNewFile *vimperatorrc	setfiletype vimperator
	au! BufRead,BufNewFile *.inc,*.ccode,*.cdata	setfiletype cpp
	au! BufRead,BufNewFile *.jsfl	setfiletype javascript
augroup END

