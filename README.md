set up nodes via tmux:
./All_node.sh

make wallets (as many as you want, 3  for 2/3 multisig + 1 other normal wallet to recive payment from multisig):

./wallet_setup/1_mk-cli-wallet.sh

./wallet_setup/2_mk-cli-wallet.sh

./wallet_setup/3_mk-cli-wallet.sh

./wallet_setup/4_mk-cli-wallet.sh


when wallet opens, run this each time to stop locking:
set inactivity-lock-timeout 0

start wallets:

./1_walletStart.sh

./2_walletStart.sh

./3_walletStart.sh

./4_walletStart.sh


2 and 3 share node by default

Then these are to set up 2/3 multisig:
{
	set enable-multisig-experimental 1

	prepare_multisig

	#----Pre----#
wallet referanced in ()

	(1)
	make_multisig 2 [2] [3]

	(2)
	make_multisig 2 [3] [1]

	(3)
	make_multisig 2 [1] [2]


	#----Ex.1----#

	(1)
	exchange_multisig_keys [2] [3]

	(2)
	exchange_multisig_keys [3] [1]

	(3)
	exchange_multisig_keys [1] [2]


	#----Ex.2 (if 2/3, not needed if 2/2)----#

	(1)
	exchange_multisig_keys [2] [3]

	(2)
	exchange_multisig_keys [3] [1]

	(3)
	exchange_multisig_keys [1] [2]

}

############################################################

I have set up a private monero testnet and funded a 2/3 multisig wallet, but
when i try to transfer:

```transfer 9vqKgExsF2ECccu4znPr4pbW66oZysKx5ciib646aARsWUD6JKp2EU6Y9J7LbmZLRjHvQRkJmGHNPDz8ER3CEaDX18hbeXf 50```

then it says this:

```Error: internal error: Multisig wallets cannot spend non rct outputs```

how to resolve Monero 2/3 multisig problem, and What are these rct outputs?

I am looking for a solution where I can find documentation on how to set up a private test-net monero multisig wallet, that can send the outputs it receives.

(1.) for creating the wallets and nodes, I used this:
https://github.com/moneroexamples/private-testnet

(2.) for the documentation I followed to set up multisig, I used this:
https://docs.getmonero.org/multisignature/

(3.) for the version of monerod and the monero-wallet-cli I downloaded, it was monero-linux-x64-v0.18.3.4.tar.bz2 (v0.18 linux) from:
https://www.getmonero.org/downloads/

(https://downloads.getmonero.org/cli/linux64)

please If anyone can help, I would be much appreciative.
