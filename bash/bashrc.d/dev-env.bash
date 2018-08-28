


# Source NVM if installed

if [ -d ~/.nvm ]; then
    export NVM_DIR=~/.nvm
fi

if [ $OS_TYPE = "Darwin" ]; then
    # Assume nvm installed with brew
    if [ -r /usr/local/opt/nvm/nvm.sh ]; then
        . /usr/local/opt/nvm/nvm.sh
    fi
else # Linux
    if [ -r /usr/share/nvm/init-nvm.sh ]; then
        . /usr/share/nvm/init-nvm.sh
    fi
fi

