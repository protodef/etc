""" encoding and <EOL>

set encoding=utf-8
	" Sets the character encoding used inside Vim. It applies to
	" text in the buffers, registers, Strings in expressions, text
	" stored in the viminfo file, etc.

"set fileencoding=utf-8
	" Sets the character encoding for the file of this buffer.
	"
	" When 'fileencoding' is different from 'encoding', conversion
	" will be done when writing the file.
	" When 'fileencoding' is empty, the same value as 'encoding'
	" will be used (no conversion when reading or writing a file).
	"
	" When reading a file 'fileencoding' will be set from
	" 'fileencodings'. To read a file in a certain encoding it won't
	" work by setting 'fileencoding', use the ++enc argument. One
	" exception: when 'fileencodings' is empty the value of
	" 'fileencoding' is used.
	" For a new file the global value of 'fileencoding' is used.

set fileencodings=utf-8,utf-16,cp949
	" This is a list of character encodings considered when starting
	" to edit an existing file. When a file is read, Vim tries to
	" use the first mentioned character encoding. If an error is
	" detected, the next one in the list is tried. When an encoding
	" is found that works, 'fileencoding' is set to it. If all fail,
	" 'fileencoding' is set to an empty string, which means the
	" value of 'encoding' is used.

"set fileformats=unix,dos
	" This gives the end-of-line (<EOL>) formats that will be tried
	" when starting to edit a new buffer and when reading a file
	" into an existing buffer.


""" <TAB>

"set tabstop=8
	" Number of spaces that a <Tab> in the file counts for.

"set softtabstop=0
	" Number of spaces that a <Tab> counts for while performing
	" editing operations, like inserting a <Tab> or using <BS>. It
	" "feels" like <Tab>s are being inserted, while in fact a mix of
	" spaces and <Tab>s is used. This is useful to keep the 'ts'
	" setting at its standard value of 8, while being able to edit
	" like it is set to 'sts'.
	" When 'expandtab' is not set, the number of spaces is minimized
	" by using <Tab>s.

"set expandtab
	" In Insert mode: Use the appropriate number of spaces to insert
	" a <Tab>. Spaces are used in indents with the '>' and '<'
	" commands and when 'autoindent' is on. To insert a real tab
	" when 'expandtab' is on, use CTRL-V<Tab>.

nmap <silent> <Leader><Tab>e :set expandtab! expandtab?<CR>
imap <silent> <Leader><Tab>e <C-O>:set expandtab!<CR>


""" indentation

"set shiftwidth=8
	" Number of spaces to use for each step of (auto)indent. Used
	" for 'cindent', >>, <<, etc.

"set autoindent
	" Copy indent from current line when starting a new line (typing
	" <CR> in Insert mode or when using the "o" or "O" comand).
	" When 'smartindent' or 'cindent' is on the indent is changed in
	" a different way.

"set cindent
	" Enables automatic C program indenting. See 'cinkeys' to set
	" the keys that trigger reindenting in insert mode and
	" 'cinoptions' to set your preferred indent style.

set smartindent
	" Do smart autoindenting when starting a new line. Works for
	" C-like programs, but can also be used for other languages.
	" 'cindent' does something like this, works better in most
	" cases, but is more strict, see C-indenting. When 'cindent' is
	" on or 'indentexpr' is set, setting 'si' has no effect.
	" 'indentexpr' is a more advanced alternative.


""" tab pages

nmap <silent> <Leader>te :tabedit<CR>
nmap <silent> <Leader>ts :tab split<CR>
nmap <silent> <Leader>to :tabonly<CR>


""" search

"set hlsearch
	" When there is a previous search pattern, highlight all its
	" matches.

"set incsearch
	" While typing a search command, show where the pattern, as it
	" was typed so far, matches.

nmap <silent> <Leader>n :nohlsearch<CR>


""" information

set showcmd
	" Show (partial) command in the last line of the screen.

"set number
	" Print the line number in front of each line.

nmap <silent> <Leader>0a :se number!<CR>

"set relativenumber
	" Show the line number relative to the line with the cursor in
	" front of each line.

nmap <silent> <Leader>0r :se relativenumber!<CR>

set listchars=eol:¬,tab:»·,trail:·,extends:>,precedes:<

nmap <silent> <Leader>i :se list!<CR>


""" syntax

set background=dark

syntax enable
	" The :syntax enable command will keep your current color
	" settings. This allows using :highlight commands to set your
	" preferred colors before or after using this command. If you
	" want Vim to overrule your settings with the defaults, use
	" :syntax on.


""" mapping

"let mapleader='\'
	" To define a mapping which uses the "mapleader" variable, the
	" special string "<Leader>" can be used. It is replaced with the
	" string value of "mapleader". If "mapleader" is not set or
	" empty, a backslash is used instead.


""" tags

set tags=tags,./tags;

nnoremap <silent> <C-]> g<C-]>
nmap <silent> <Leader>t] :tab tjump <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>]t :tag<CR>
	" Jump to newer entry the tag stack.

nmap <Leader>]s :tags<CR>
	" Show the contents of the tag stack.

nmap <Leader>]n :tnext<CR>
nmap <Leader>]N :tprevious<CR>
	" Jump to next/previous matching tag.


""" cscope

if has("cscope")
	set cscopetag
		" Use both cscope and ctags for ":tag" and CTRL-] as
		" well as "vim -t"

	"set cscopetagorder=0

	if filereadable("cscope.out")
		cs add cscope.out
	endif

	set cscopeverbose

	cnoreabbrev csa cs f a
	cnoreabbrev csc cs f c
	cnoreabbrev csd cs f d
	cnoreabbrev cse cs f e
	cnoreabbrev csf cs f f
	cnoreabbrev csg cs f g
	cnoreabbrev csi cs f i
	cnoreabbrev css cs f s
	cnoreabbrev cst cs f t

	nmap <silent> <Leader>ca :csa <cword><CR>
	nmap <silent> <Leader>cc :csc <cword><CR>
	nmap <silent> <Leader>cd :csd <cword><CR>
	nmap <silent> <Leader>ce :cse <cword><CR>
	nmap <silent> <Leader>cf :csf <cfile><CR>
	nmap <silent> <Leader>cg :csg <cword><CR>
	nmap <silent> <Leader>ci :csi <cfile><CR>
	nmap <silent> <Leader>cs :css <cword><CR>
	nmap <silent> <Leader>ct :cst <cword><CR>

	nmap <silent> <Leader>tca :tab csa <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>tcc :tab csc <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>tcd :tab csd <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>tce :tab cse <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>tcf :tab csf <C-R>=expand("<cfile>")<CR><CR>
	nmap <silent> <Leader>tcg :tab csg <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>tci :tab csi <C-R>=expand("<cfile>")<CR><CR>
	nmap <silent> <Leader>tcs :tab css <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>tct :tab cst <C-R>=expand("<cword>")<CR><CR>

	nmap <silent> <Leader>vca :vert csa <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>vcc :vert csc <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>vcd :vert csd <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>vce :vert cse <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>vcf :vert csf <C-R>=expand("<cfile>")<CR><CR>
	nmap <silent> <Leader>vcg :vert csg <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>vci :vert csi <C-R>=expand("<cfile>")<CR><CR>
	nmap <silent> <Leader>vcs :vert css <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <Leader>vct :vert cst <C-R>=expand("<cword>")<CR><CR>
endif
