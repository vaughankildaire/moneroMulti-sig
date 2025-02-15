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


####------------ BEGINING OF MONERO WALLET_02 ------------

$path1/monero-wallet-cli --testnet --generate-new-wallet $path2/wallet_02 \
--restore-deterministic-wallet --electrum-seed="deftly large tirade gumball android leech sidekick opened iguana voice gels focus poaching itches network espionage much jailed vaults winter oatmeal eleven science siren winter" \
--password "" --log-file $path2/wallet_02.log

####------------ END OF MONERO WALLET_02 ------------

