#!/bin/bash

export FABRIC_CFG_PATH=$PWD

setGlobalForPeer0Org1(){
    # export CORE_PEER_TLS_ENABLED=false
    export CORE_PEER_LOCALMSPID="Org1MSP"
    # export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.saintrivers.com/users/Admin@org1.saintrivers.com/msp
    export CORE_PEER_ADDRESS=localhost:7053
    # export CORE_PEER_LISTENADDRESS=localhost:7051
}

setGlobalForOrderer(){
    export CORE_PEER_LOCALMSPID="OrdererMSP"
    export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/ordererOrganizations/saintrivers.com/users/Admin@saintrivers.com/msp
}


presetup(){
    pushd ./atcc || exit
    GO111MODULE=on go mod vendor
    popd || exit
}
presetup


CHANNEL_NAME="mychannel"
CC_RUNTIME_LANGUAGE="golang"
VERSION=1
CC_SRC_PATH="./atcc"
CC_NAME="mycc"

packageChaincode(){
    rm -rf ${CC_NAME}.tar.gz 2> /dev/null
    setGlobalForPeer0Org1
    peer lifecycle chaincode package ${CC_NAME}.tar.gz \
        --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} \
        --label ${CC_NAME}_${VERSION}
    echo "======================== Chaincode packaged successfully ========================"
}

packageChaincode

# peer lifecycle chaincode package atcc.tar.gz --path ./atcc/ --lang golang --label basic_1.0

# export ORDERER_GENERAL_TLS_ENABLED=false



# peer lifecycle chaincode install atcc.tar.gz 
# peer chaincode install -p ./atcc.tar.gz -n mycc -v v0




installChaincode(){
    setGlobalForPeer0Org1
    # export BASE_DOCKER_NS="hyperledger"
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "======================== Installed chaincode on peer 0 org 1 ========================"
}
installChaincode