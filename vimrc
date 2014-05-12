""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " Get rid of Vi compatibility mode. SET FIRST!
execute pathogen#infect()
filetype plugin indent on       " Use plugins when available.
set isk+=_,$,@,%,#,-     " Make these characters count as part of a word.
set viminfo+=!           " Make sure we can save viminfo.
"set viminfo='100,f1      " Save local and global marks for 100 files.
autocmd BufRead *.thtml set filetype=php
autocmd BufRead *.htm set filetype=php
set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable            " Enable syntax highlighting (previously syntax on).

" Change color scheme.
colorscheme ir_black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler                " Always show info along bottom.
set noerrorbells         " Disable error bells.
set number
set lbr                  " Lets words wrap visually
set backspace=2          " Delete anything


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch            " Show matching braces and brackets.
set mat=2                " How many tenths of a second to show a match.
set nohlsearch           " Don't continue to highlight searched phrases.
set incsearch            " But do highlight as you type your search.
set ignorecase           " Case-insensitive searching.
set visualbell           " Blink instead of beep.
set so=5                 " Keep 5 lines for scope.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn             " See help (complex).
"set ai                   " Auto-indent.
"set si                   " Smart indent.
"set cindent              " C-style indenting.
set tabstop=4            " Tab spacing (settings below correspond to unify.
set softtabstop=4        " Unify.
set shiftwidth=4         " Indent/outdent by 3 columns.
set shiftround           " Always indent/outdent to the nearest tabstop.
set expandtab            " Use spaces instead of tabs.
"set smarttab             " Use tabs at the start of a line, spaces elsewhere.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding                                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable           " Turn on folding.
set foldmethod=syntax    " Make folding indent sensitive.
set foldlevel=100        " Don't autofold for me.
set foldopen-=search     " Don't open folds when you search into them.
set foldopen-=undo       " Don't open folds when you undo stuff.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap F1 to escape, since this is a common mistype:
noremap <F1> <C-c>
inoremap <F1> <C-c>
cnoremap <F1> <C-c>
noremap <F14> <C-c>
inoremap <F14> <C-c>
cnoremap <F14> <C-c>

" Turn on/off search highlighting.
:map <silent> <F10> :se invhlsearch<CR>

" Turn on/off highlighting of misspelled words.
if version >= 700
    map <F7> <Esc>:setlocal spell spelllang=en_us<CR>
    map <F6> <Esc>:setlocal nospell<CR>
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP:
iab fun function

" HTML:
iab httemp <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"><C-M>
    \<Tab><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><C-M>
    \<head><C-M>
	\<title>Page title here</title><C-M>
	\<style type="text/css" media="screen">@import "/css/screen.css";</style><C-M>
	\<meta name="DC.title" content="Title here" /><C-M>
	\<meta name="DC.subject" content="Keywords here" /><C-M>
	\<meta name="DC.description" content="Description here" /><C-M>
	\<meta name="DC.format" content="text/html" /><C-M>
	\<meta name="DC.publisher" content="Publisher here" /><C-M>
	\<meta name="DC.language" content="en" /><C-M>
	\<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /><C-M>
    \</head><C-M>
    \<body><C-M>
	\<div id="container"><C-M>
	\</div><C-M>
    \</body><C-M>
    \</html>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart tab completion.
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore last edited position.
au BufReadPost * if line("'\"") > 0 && 
   \  line("'\"") <= line("$") | exe "normal g'\"" | endif

" Allow 256 Colors
set t_Co=256

" Fast window switching
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

" Project shortcut
nmap <silent> <Leader>P :Project<CR> 

" Allow mouse selection and block selection
set mouse=a
set ttymouse=xterm
noremap <C-LeftMouse> <LeftMouse><Esc><C-V>
noremap <C-LeftDrag> <LeftDrag>

" Keepin it real in perl
set cinkeys-=0#

" Buffergator options
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>

if version >= 700
    autocmd FileType svn setlocal spell spelllang=en_us

   " Tab stuff
   set showtabline=2
   set tabpagemax=30
endif

inoremap <LF> <ESC>o
noremap <LF> o
vnoremap  "+y
vnoremap  "+d

set path=**
map <C-Up> dd-P
map <C-Down> ddp
set runtimepath+='~/workspace/vl_repo'

" Reformat/reindent pasted text.
nnoremap <Esc>P P'[v']=
nnoremap <Esc>p p'[v']= 
map <C-x><C-v> :set paste<CR>"*p:set paste!<CR>
inoremap <C-r>* <ESC>:set paste<CR>"*p:set paste!<CR>a
inoremap [Z <ESC>/[})>\]]<CR>
nnoremap [Z <ESC>/[})>\]]<CR>a
nnoremap t :call OF()<CR>
inoremap t <ESC>:call OF()<CR>

let b:php_noindent_switch=0
nmap <leader>l :ls<cr>:buf
vmap <leader>f (%i

" PHP array / column adjustment
vmap <leader>= :!sed 's/^\s*//' \| column -t -s= \| sed -r 's/(\s*)   (>\| )/\1 =\2/'<CR>gv=

" Switch single-to-double and double-to-single quotes
vmap <leader>" :s/'/"/g<CR>
vmap <leader>' :s/"/'/g<CR>
nmap <leader>' di"hr'plr'
nmap <leader>" di'hr"plr"

" Omni-complete class functions:
imap :: ::<C-x><C-o>
imap -> -><C-x><C-o>
set completeopt=longest,menuone

set guifont=Monaco:h15

" Clear trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
