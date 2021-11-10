#!/bin/bash

CHANNEL_NAME="mychannel"
CC_NAME="mycc"


setGlobalForPeer0Org1(){
    # export CORE_PEER_TLS_ENABLED=false
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.saintrivers.com/users/Admin@org1.saintrivers.com/msp
    export CORE_PEER_ADDRESS=localhost:7053
}


queryCommitted(){
    setGlobalForPeer0Org1
    peer lifecycle chaincode querycommitted --channelID ${CHANNEL_NAME} --name ${CC_NAME} 
}

queryCommitted


# instantiate the chaincode with this

chaincodeInvokeInit(){
    setGlobalForPeer0Org1
    peer chaincode invoke -o localhost:7060 \
    -C ${CHANNEL_NAME} -n ${CC_NAME} \
    --peerAddresses localhost:7053 \
    --isInit -c '{"Args":[]}'
}

chaincodeInvokeInit

