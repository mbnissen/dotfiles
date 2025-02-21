set PATH /usr/local/bin $PATH
set PATH /Library/TeX/texbin/ $PATH

export ERL_AFLAGS="-kernel shell_history enabled"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias lg "lazygit"
alias vimdiff "nvim -d"

source /opt/homebrew/opt/asdf/libexec/asdf.fish

direnv hook fish | source
