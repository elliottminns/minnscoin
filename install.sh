TMP_FOLDER=$(mktemp -d)
CONFIG_FILE="minnscoin.conf"
BINARY_FILE="/usr/local/bin/minnscoind"
sudo apt-get update -y
sudo apt-get install vim git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common libgmp3-dev  -y
sudo apt-get install libboost-all-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libminiupnpc-dev -y
export EXIP=`wget -qO- eth0.me`
sudo apt-get install -y pwgen
export RPC_PASSWORD=`pwgen -1 20 -n`
mkdir $HOME/.minnscoin
printf "rpcuser=user\nrpcpassword=$RPC_PASSWORD\nrpcport=5809\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=256\nrpcallowip=127.0.0.1\nexternalip=$EXIP:58008\n" > $HOME/.minnscoin/$CONFIG_FILE
git clone $REPO $TMP_FOLDER
cd ./src/secp256k1
chmod +x autogen.sh
./autogen.sh
./configure --enable-module-recovery
make
cd ..
mkdir obj/support
mkdir obj/crypto
make -f makefile.unix
cp -a minnscoind $BINARY_FILE
