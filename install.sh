#update
apt-get update && apt-get upgrade
wget -q -O ironfish.sh https://api.nodes.guru/ironfish.sh && chmod +x ironfish.sh && sudo /bin/bash ironfish.sh
#Load variables
. $HOME/.bashrc
. $HOME/.bash_profile
#check the config
cat $HOME/.ironfish/config.json
#set the NODE name
ironfish config:set nodeName $IRONFISH_NODENAME
ironfish config:set blockGraffiti $IRONFISH_NODENAME
#Create wallet:
ironfish accounts:create $IRONFISH_WALLET
#Set created wallet as default wallet:
ironfish accounts:use $IRONFISH_WALLET
#Check your balance:
ironfish accounts:balance $IRON
ironfish status -f
#Send a transaction using your default account:
ironfish accounts:pay
#If you want to send the transaction from another account, you can use the `-f` flag
ironfish accounts:pay -f MySecondAccount
#In order to receive a transaction, you just need to tell the sender the public key of your account. If you do not know your public key, run the following command:
ironfish accounts:publickey
#To get the public key of your another account running the command:
ironfish accounts:publickey -a MySecondAccount
#View the list of accounts on your node:
ironfish accounts:list
#Export an account to a file:
ironfish accounts:export AccountName filename
#Import an account from a file:
ironfish accounts:import filename
#Delete your account:
ironfish accounts:remove MyAccount
#You can get information about connection status and errors by running the following command:
ironfish peers:list -fe
#Export keys:
mkdir -p $HOME/.ironfish/keys
ironfish accounts:export $IRONFISH_WALLET $HOME/.ironfish/keys/$IRONFISH_WALLET.json
#Import keys:
ironfish accounts:import PATH_TO_THE_KEY
#Check ironfish status:
ironfish status -f
#Check the node:
journalctl -u ironfishd -f
#Check the miner:
journalctl -u ironfishd-miner -f
#Stop the node:
service ironfishd stop
#Stop the miner:
service ironfishd-miner stop
