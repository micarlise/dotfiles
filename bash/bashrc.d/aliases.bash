
# Set LS Options differently per ls version
if [ $OS_TYPE = "Darwin" ]; then
    LS_OPTIONS='-G'
else
    LS_OPTIONS='--color=auto'
fi

alias ls='ls $LS_OPTIONS'
alias ll='ls -l'
alias l.='ls -d .*'
