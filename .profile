# This should really all be in .bashrc, further the file name should be
# .bash_profile and it should load the appropriate .bashrc...


echo loading.profile

export PATH=/usr/local/Crosspack-AVR/bin:/opt/local/bin:/opt/local/sbin:$PATH

#PS1="\n\[\e[0;32m\]<\[\033[0;31m\]\h\[\e[0;32m\]:\[\033[0;37m\]\u\[\033[0;32m\]>
#[\[\033[0;34m\]\D{%F}\[\033[0;32m\]] \[\033[0;36m\]\w\[\033[0;30m\]\n"
PS1="\n\[\e[0;32m\]<\[\033[0;31m\]\h\[\e[0;32m\]:\[\033[0;37m\]\u\[\033[0;32m\]> \[\033[0;36m\]\w\[\033[0;37m\]\n"
alias ll='ls -l'
alias cl='clear'
alias add='git add'
alias commit='git commit'
alias push='git push'
alias status='git status'
alias log='git log'
alias cl='clear'
alias lss='ls -la | grep "^d" && ls -la | grep -v "^d"'
alias vim='vim73'
alias emacs=/usr/local/bin/emacs
mmvim () {
    local f
    for f; do
        test -e "$f" || touch "$f"
    done
    open -a MacVim "$@"
}
export TERM=xterm-color
export LS_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS='ExcxfxfxBxhxhxhxhxhxhx'
#export PATH=~/DATA/scripts:$PATH
export CVSROOT=":ext:tim@10.1.0.77:/Users/_cvs"
#export CVSROOT=":ext:tims@192.168.1.77:/usr/local/cvs"
export CVS_RSH=ssh

#put string [bash] hostname::/full/directory/path in iTerm title
#echo -ne "\033]2;${HOSTNAME%.*}:$PWD\a"
#put penultimate and final directory in the iTerm tab
#echo -ne "\e]1;$(basename $(dirname $PWD))/\W\[\a\]"
#echo -ne "\033]1;$PWD\a"

PROMPT_COMMAND='echo -ne "\033]2;${HOSTNAME%.*}:$PWD\a"'

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
#setTerminalText () {
    ## echo works in bash & zsh
    #local mode=$1 ; shift
    #echo -ne "\033]$mode;$@\007"
#}
#stt_both  () { setTerminalText 0 $@; }
#stt_tab   () { setTerminalText 1 $@; }
#stt_title () { setTerminalText 2 $@; }
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
