#!/bin/bash

#---- useful commands, but not needed ----
####
#tmux send-keys -t S.0 "command"
#sed -i 's/\r$//' filename
#bash --rcfile <(echo '. ~/.bashrc; echo w')
####

#---- bash Env ----
source ~/.bashrc

#---- set path ----
path0=~/app/monero/
path1=$path0/monero-linux && path2=$path0/testnet
wdpath=$PWD


#---- START WALLET_04 ----

$path1/monero-wallet-cli --testnet \
--daemon-address 127.0.0.1:48081 --trusted-daemon \
--wallet-file $path2/wallet_04 --password '' \
--log-file $path2/wallet_04.log

#------------

