#!/bin/bash

#tmux show -g | sed 's/^/set -g /' > ~/.tmux.conf
#sed -i 's/\r$//' filename
#bash --rcfile <(echo '. ~/.bashrc; echo w')

source ~/.bashrc

tmux new-session -d -s O "bash"
tmux new-window -t O:1 "bash"
tmux new-window -t O:2 "bash"

tmux join-pane -s O:1 -t O:0
tmux join-pane -s O:2 -t O:0
tmux select-layout even-horizontal

tmux send-keys -t O.0 "clear && echo hello world" ENTER
tmux send-keys -t O.1 "clear && echo hello world" ENTER
tmux send-keys -t O.2 "clear && echo hello world" ENTER
tmux a -t O