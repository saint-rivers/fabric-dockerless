#!/bin/bash


CHANNEL_NAME="mychannel"
VERSION=1
CC_NAME="mycc"

setGlobalForPeer0Org1(){
    # export CORE_PEER_TLS_ENABLED=false
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.saintrivers.com/users/Admin@org1.saintrivers.com/msp
    export CORE_PEER_ADDRESS=localhost:7053
}

queryInstalled(){
    setGlobalForPeer0Org1
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//;p;}" log.txt )
    echo PackageID is "$PACKAGE_ID"
    echo "======================= Query for installed chaincode on p0o1 ======================="
}
# this function is only used to get the id of the package that was generated
queryInstalled


approveForMyOrg1(){
    setGlobalForPeer0Org1

    peer lifecycle chaincode approveformyorg -o localhost:7060 \
    --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${VERSION} \
    --init-required --package-id "$PACKAGE_ID" --sequence ${VERSION}
    echo "======================= org1 chaincode has been approved ======================="
    # peer lifecycle chaincode approveformyorg -o localhost:7060 --channelID mychannel --name mycc --version 1 --init-required --package-id mycc_1:25e7a311a847c24573871a2dcebd321037d6fd398cec0b9807534e325c70c5d8 --sequence 1
}

approveForMyOrg1