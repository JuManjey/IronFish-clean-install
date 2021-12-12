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