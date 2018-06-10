" ck's vim profile.
se nocp nu
behave mswin
colo evening 
so $VIMRUNTIME/mswin.vim
syn on
se hlsearch

se cindent
se shiftwidth=4
se tabstop=4

se nobackup
se nowritebackup

function PythonBegin()
	call setline(1, "\#! /bin/env python")
	call setline(2, "\# encoding=utf-8")
	call setline(3, "\# kanchen")
	call setline(4, "\# ")
	call setline(5, "")
    call setline(6, "if __name__=='__main__':")
    call setline(7, "    ")
	call setpos('.', [0, 7, 4, 0])
endfunction

filetype on
se expandtab
se smarttab
au Filetype python se formatoptions+=r
"au Filetype python se expandtab
"au FileType python se smarttab
au FileType python se fenc=chinese
au BufNewFile *.py exec ":call PythonBegin()"

se nowrap

"se noexpandtab
se showcmd
se ruler
se wildmenu
se tags=./tags,tags,$HOME/rs/tags

set fencs=ucs-bom,UTF-8,cp936,default,latin1
set encoding=chinese

set list                
set listchars=tab:>-,trail:-

hi Macro ctermfg=red
hi Normal ctermfg=white
hi PreProc ctermfg=red

" deal with file diff.
map <C-J> [czz
map <C-K> ]czz
map <C-M> :diffg<CR>

map <C-N> :noh<CR>
"map <F10> :se enc=chinese<CR>
map <F6> :se fdm=syntax<CR>
map <F7> :se fdm=manual<CR>
map <F8> :%s/\r//g<CR>

map + gt
map _ gT

map <F11> :!p=`pwd\|grep ".*chenkan/[^/]*/[^/]*/" -o`; echo $p; ctags --c++-kinds=+p -R $p; mv tags ~/chenkan/;<CR><CR>:se tags=~/chenkan/tags<CR>
se tags=~/tags

map <C-H> O//---------------------------  --------------------------<ESC>bhi
au Filetype python map <C-H> O##################################################<ESC>bhi

map <C-O> O/**<CR> <CR>/<UP><ESC>$a
map <C-F> O/**<CR>author : chenkan@baidu.com<CR>date : <CR>brief : <CR>/<UP><UP><ESC>$a
map <C-I> $a ///< 
map <C-L> O/*  */<ESC>bhi
map <C-B> <C-Q>

" switch window and resize it max.
map <C-W>f <C-W>w<C-W>200+<C-W>200> 

"tag list
map <C-I> :!ctags --c++-kinds=+pf -R;<CR><CR>:se tags=./tags<CR>
map <C-O> :TlistToggle<CR>
"let Tlist_File_Fold_Auto_Close=1
let Tlist_WinWidth=40

" comdg.vim plug access.
"let loaded_gendocument=0

" FOR GO LANGUAGE.
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/home/users/chenkan/software/go/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go autocmd BufWritePre <buffer> Fmt




