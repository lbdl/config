"File:          .vimrc
"Name:          Tim Storey
"Creation Date: in the mists of time...
"Date Modified: 20120327 by timS
"Date Modified: 20120425 by timS
"
"
"
"set number
"move to a sensible work dir
"cd ~/DATA/score
"
"set a common swap file location
set dir=~/DATA/swap
set wrap
set linebreak
"set textwidth=0
"set wrapmargin=0
set showmode
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
filetype indent on
filetype plugin on
"set ofu=syntaxcomplete#Complete
set clipboard=unnamed
set nocompatible

syntax on
"colorscheme yawning
"colorscheme inkpot
"colorscheme mustang
"colorcheme LuciusLight
colorscheme Spacedust
":LuciusLight

"need the following line to disable annoying $() being flagged as error
"in shell scripts...
let g:is_posix = 1

"set gfn=Monaco:h12
set gfn=Menlo:h11
set noerrorbells
set visualbell
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set autoindent
"set h1search
set incsearch
set showmatch
set guioptions-=T
set guioptions-=L
set guioptions-=R
"set transparency=10
"set the guicursor to pickup the iCursor defined in yawning
"also sets the cursor to be a vertical bar at 25% as 100%
"will ignore the guifg value
"set guicursor+=i:ver25-iCursor

"automate the build boys and girls
"set makeprg=gcc\ -o\ %<\ %

"various omnicompletes note the enabled line should in fact set it on
"for everything
"autocmd FileType python set omnifunc=pythoncomplete#Complete
set ofu=syntaxcomplete#Complete

" timeouts etc for terminal operattion
"set notimeout
"set ttimeout
"set timeoutlen=100

"xterm commands to set the cursor when in non gui
    " solid underscore
    if &term =~ "^xterm"
    let &t_SI = "\<Esc>[4"
    " solid block
    let &t_EI = "\<Esc>[2"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
    autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

"======================KEYMAPPINGS===================================
:map <C-Right> :tabn<CR>
:map <C-Left> :tabp<CR>
":map <C-T> :NERDTreeToggle<CR>
:map <A-t> :tabnew<CR>
:map ;m :call ModifyDate()<CR>
:map ;f :call ModifyFileName()<CR>
:map ;s :so ~/.vim/scripts/MyHelpers.vim<CR>
:map ;l :call LoadTemplate()<CR>

:ab cc %+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:ab cs %-------------------------------------------------------------------------------
:ab sc #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:ab sd #-------------------------------------------------------------------------------
"the following 2 lines should allow pasting to system clipboard
"which are in fact not needed if VIM73 is used as that is a default
"behavior, you'll want to do a :version to check your version
"look for the clipboard option if its +clipboard then all is good
"if you get a -clipboard you'll need to recompile.
":vmap <C-c> :call system("pbcopy", getreg("\""))<CR>
":nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

"the below is for latex-suite
let g:tex_flavor='latex'
"disables the annoying \dots elipsis replacement
let g:Tex_SmartKeyDot = 0
"and disable the equally annoying placeholders
let g:Imap_UsePlaceHolders = 0
"attempt to view files from within the suite which...
"of course doesn't in fact work
"let g:Tex_ViewRule_pdf = 'open -a Skim'
"let g:Tex_TreatMacViewerAsUNIX = 1

"the below should fix the annoying Makefile crap where we don't get tabs
autocmd BufEnter ?akefile* set noet ts=4 sw=4

let USERNAME = "T E Storey"
let COMPANY = "BITE Software"
let mapleader = ","
"this loads in all the template files in the skel dir
augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.*  execute '0r ~/.vim/skel/skel.'.expand("<afile>:e")

  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

augroup changepwd
    au!
    autocmd BufEnter * lcd %:p:h
augroup END
    
"we could of course load them in individually as below
"autocmd BufNewFile *.c silent! 0r ~/.vim/templates/tmpl.c
"autocmd BufNewFile *.h silent! 0r ~/.vim/templates
fun! LoadTemplate()
    exe "0r ~/.vim/skel/skel.".expand("%:e")
    %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
endfun

source ~/.vim/scripts/MyHelpers.vim
augroup dateModifiers
    au!
    "autocmd BufWritePre,FileWritePre *.c ks|call ModifyDate()|'s
    "autocmd BufWritePre,FileWritePre *.h ks|call ModifyDate()|'s
augroup END

"reload .vimrc if changed
augroup vimrcReloader
    au!
    autocmd BufWritePost .vimrc source %
augroup END

"pathogen loading, NOTE to use pathogen now we just have to cd into
"~/.vim/bundle and use git to install whatever shiny new tools we want.
"more info here https://github.com/tpope/vim-pathogen
execute pathogen#infect()
