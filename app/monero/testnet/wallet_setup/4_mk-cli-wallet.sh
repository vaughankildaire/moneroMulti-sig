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


####------------ BEGINING OF MONERO WALLET_04 ------------

$path1/monero-wallet-cli --testnet --generate-new-wallet $path2/wallet_04 \
--restore-deterministic-wallet --electrum-seed="wizard rhythm eight adrenalin getting vigilant pavements lyrics gearbox roped jeers vastness saxophone orange sayings quick oatmeal apricot masterful gearbox tugs chlorine ocean pencil vastness" \
--password "" --log-file $path2/wallet_04.log

####------------ END OF MONERO WALLET_04 ------------

