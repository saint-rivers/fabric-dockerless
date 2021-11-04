#!/bin/bash

export CONFIG_DIRECTORY=$PWD
export FABRIC_CFG_PATH=$PWD
export FABRIC_LOGGING_SPEC=INFO

export CORE_PEER_LISTENADDRESS=0.0.0.0:7053
export CORE_PEER_ADDRESS=0.0.0.0:7053
export CORE_PEER_FILESYSTEMPATH=$PWD/$CORE_LEDGER_STATE_STATEDATABASE


# Identity set to Admin
export CORE_PEER_MSPCONFIGPATH=$PWD/organizations/peerOrganizations/org1.saintrivers.com/users/Admin@org1.saintrivers.com/msp
echo "Configured !!" + "$CORE_PEER_MSPCONFIGPATH"

# State Data persistence in CouchDB
export CORE_LEDGER_STATE_STATEDATABASE=CouchDB
# For Couch DB
export CORE_LEDGER_STATE_COUCHDBCONFIG_COUCHDBADDRESS=localhost:5984
export CORE_LEDGER_STATE_COUCHDBCONFIG_USERNAME=admin
export CORE_LEDGER_STATE_COUCHDBCONFIG_PASSWORD=password

export NODECHAINCODE=/vagrant/nodechaincode

# Default Chaincode variables
export CC_NAME=gocc
export CC_VERSION=1.0
export CC_LABEL="$CC_NAME.$CC_VERSION-1.0"
export CC_PACKAGE_FILE=$HOME/packages/$CC_LABEL.tar.gz

export WAIT_TIME=4s
export ORDERER_ADDRESS="localhost:7060"


## kill all existing peers
killall peer

# Check if orderer is up
if pgrep -x "orderer" > /dev/null
then
    echo "2. Orderer is running."
else
    echo "2. Please launch the Orderer & run init again"
    exit 1
fi

# create the channel
peer channel create -o $ORDERER_ADDRESS -c mychannel -f "$CONFIG_DIRECTORY"/artifacts/channel.tx 

# start a peer
peer node start &

# wait for some time to buffer?
sleep $WAIT_TIME

# join channel
peer channel join -o $ORDERER_ADDRESS -b ./mychannel.block
