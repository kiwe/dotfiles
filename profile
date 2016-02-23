# Setup som extra bin paths
[[ -d ~/.local/bin ]] && PATH="$PATH:~/.local/bin"
[[ -d ~/bin ]] && PATH="$PATH:~/bin"
[[ -d ~/Dropbox/bin ]] && PATH="$PATH:~/Dropbox/bin"
[[ -d ~/.composer/vendor/bin ]] && PATH="$PATH:~/.composer/vendor/bin"
[[ -d /opt/cisco/anyconnect/bin ]] && PATH="$PATH:/opt/cisco/anyconnect/bin"

# Environment variables
export PATH
export LESS="-RS"
