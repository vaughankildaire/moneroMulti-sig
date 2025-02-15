#!/bin/bash

#---- useful commands, but not needed ----
####
#tmux show -g | sed 's/^/set -g /' > ~/.tmux.conf
#sed -i 's/\r$//' filename
#bash --rcfile <(echo '. ~/.bashrc; echo w')
####

#---- bash Env ----
source ~/.bashrc

#---- set path ----
path0=~/app/monero/
path1=$path0/monero-linux && path2=$path0/testnet
wdpath=$PWD

#---- make 1 tmux session (bash) called O:0 and then
#---- attach 2 more windows called O:[1-2], total 3 (bash) ----
tmux new-session -d -s O "bash"
tmux new-window -t O:1 "bash"
tmux new-window -t O:2 "bash"

#---- join all 3 tmux windows as 3 panes, 1 window (all bash) ----
tmux join-pane -s O:1 -t O:0
tmux join-pane -s O:2 -t O:0
#---- flip to have vertical columns of even horizontal spacing ----
tmux select-layout even-horizontal


####------------ BEGINING OF MONERO NODES ------------

#---- start monerod for node_01 in pane O:0 ----
tmux send-keys -t O.0  "\
$path1/monerod --testnet \
--p2p-bind-port 28080 \
--rpc-bind-port 28081 \
--zmq-rpc-bind-port 28082 --no-igd --hide-my-port --log-level 1 --data-dir $path2/node_01 \
--p2p-bind-ip 127.0.0.1 \
--add-exclusive-node 127.0.0.1:38080 \
--add-exclusive-node 127.0.0.1:48080 \
--fixed-difficulty 100 --disable-rpc-ban --max-connections-per-ip 4" ENTER

#---- start monerod for node_02 in pane O:1 ----
tmux send-keys -t O.1 "\
$path1/monerod --testnet \
--p2p-bind-port 38080 \
--rpc-bind-port 38081 \
--zmq-rpc-bind-port 38082 --no-igd --hide-my-port --log-level 1 --data-dir $path2/node_02 \
--p2p-bind-ip 127.0.0.1 \
--add-exclusive-node 127.0.0.1:28080 \
--add-exclusive-node 127.0.0.1:48080 \
--fixed-difficulty 100 --disable-rpc-ban --max-connections-per-ip 4" ENTER

#---- start monerod for node_03 in pane O:2 ----
tmux send-keys -t O.2 "\
$path1/monerod --testnet \
--p2p-bind-port 48080 \
--rpc-bind-port 48081 \
--zmq-rpc-bind-port 48082 --no-igd --hide-my-port --log-level 1 --data-dir $path2/node_03 \
--p2p-bind-ip 127.0.0.1 \
--add-exclusive-node 127.0.0.1:28080 \
--add-exclusive-node 127.0.0.1:38080 \
--fixed-difficulty 100 --disable-rpc-ban --max-connections-per-ip 4" ENTER


####------------ END OF MONERO NODES ------------


#---- reset path to old(cur) wd path ----
path=$wdpath

#---- attache the O tmux session ----
tmux a -t O
