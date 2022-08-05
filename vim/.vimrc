"filetype plugin indent on
syntax on
set relativenumber
set number 

" indent in blocks
set autoindent

" set tabs to 4 spaces            
set expandtab
set tabstop=4
set shiftwidth=4

" Column and line numbers
set ruler

 set scrolloff=3

 set shortmess+=A
 set shortmess+=I


"set statusline=%<%f%m%r%{Fenc()}%=%15.(%l,%c%V\ %P%)
function! Fenc()
    if &fenc !~ "^$\|utf-8" || &bomb
     return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
    else
        return ""
    endif
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
