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


####------------ BEGINING OF MONERO WALLET_01 ------------

$path1/monero-wallet-cli --testnet --generate-new-wallet $path2/wallet_01 \
--restore-deterministic-wallet --electrum-seed="sequence atlas unveil summon pebbles tuesday beer rudely snake rockets different fuselage woven tagged bested dented vegan hover rapid fawns obvious muppet randomly seasons randomly" \
--password "" --log-file $path2/wallet_01.log

####------------ END OF MONERO WALLET_01 ------------

