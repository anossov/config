filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype on
filetype plugin on
filetype plugin indent on

set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab
set autoindent

let python_highlight_all = 1

set list
set encoding=utf-8
set fileencodings=utf8,cp1251
set listchars=tab:»·
set listchars+=trail:·
set endofline

set t_Co=256
set background=dark
colorscheme zenburn

set cursorline

set viewoptions=folds,options,cursor,unix,slash

set mouse=a

set nu
set termencoding=utf-8
set foldcolumn=3

highlight rightMargin ctermbg=red guibg=red
autocmd FileType python match rightMargin /.\%>100v/ 

set foldmethod=indent
set foldlevel=99

set hls
set showmatch
set showcmd
set showmode

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap * *N

noremap <F1> :bprev<CR>
noremap <F2> :bnext<CR>

set ff=unix

set linespace=0

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)


set pastetoggle=<F12>
vnoremap < <gv
vnoremap > >gv

cmap w!! w !sudo tee % >/dev/null

set statusline=%f
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%h\ %y
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=%#error#
set statusline+=%*


"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

set history=1000
set scrolloff=5

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest

set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

au! BufWriteCmd *.py call CheckPythonSyntax()
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

command! Q q

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

map <ESC>[F <End>
map <ESC>[H <Home>
imap <ESC>[F <End>
imap <ESC>[H <Home>


map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

nmap <leader>a <Esc>:Ack!


" Abbreviations
iab -* -*- coding: utf-8 -*-
iab defi def __init__(self


let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


" When writing Python file check the syntax
function CheckPythonSyntax()
  " Write the current buffer to a temporary file, check the syntax and
  " if no syntax errors are found, write the file
  let curfile = bufname("%")
  let tmpfile = tempname()
  silent execute "write! ".tmpfile
  let output = system("python -c \"__import__('py_compile').compile(r'".tmpfile."')\" 2>&1")
  if output != ''
    " Make sure the output specifies the correct filename
    let output = substitute(output, fnameescape(tmpfile), fnameescape(curfile), "g")
    echo output
  else
    write
  endif
  " Delete the temporary file when done
  call delete(tmpfile)
endfunction
