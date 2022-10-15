alias vim="nvim"
alias open="xdg-open"
alias connectbluetooth="bluetoothctl connect 00:00:AB:CD:30:EB"
alias disconnectbluetooth="bluetoothctl disconnect"
alias jpt="cd ~/iith/FOML && source bin/activate && cd src/ && jupyter-notebook"

# for tmux
export LANG=en_IN.UTF-8

# adding new bin

PATH="$HOME/.local/bin_:$PATH"
PATH="$HOME/go/bin:$PATH"
export GOPATH=$HOME/go
