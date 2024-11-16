if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source

fzf --fish | source

# export TMUX_TMPDIR="/var/tmp"
#
# export PATH=$HOME/.dotnet/tools:$PATH
# export PATH=$HOME/flutter/bin:$PATH
# export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.13.0.11-1.fc41.x86_64
# export PATH=$JAVA_HOME:$PATH

# export PATH="$PATH:/home/solo/.local/bin"

alias cb="xsel --clipboard"

alias lg="lazygit"

alias ll="ls -alh"

# NEOVIM
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# export SUDOEDIT='/usr/bin/nvim'
# export EDITOR='/usr/bin/nvim'
