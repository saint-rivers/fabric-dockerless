#!/bin/bash

# delete all old artifacts 
rm -rf ./artifacts/*
# for the love of god don't forget to delete the old ledger files
rm -rf ./ledger/*

## not sure what this is for yet
export FABRIC_CFG_PATH=$PWD

# just set the channel name
export CHANNEL_NAME=mychannel

# create a genesis block for the orderer using profile:TwoOrgsOrdererGenesis from configtx.yaml 
configtxgen -channelID mynet-sys-channel -profile TwoOrgsOrdererGenesis -outputBlock ./artifacts/orderer.genesis.block 
# create a channel configuration block from profile:OneOrgChannel 
configtxgen -channelID $CHANNEL_NAME -profile OneOrgChannel -outputCreateChannelTx ./artifacts/channel.tx
# create an anchor peer update block from profile:OneOrgChannel
configtxgen -channelID $CHANNEL_NAME -profile OneOrgChannel -outputAnchorPeersUpdate ./artifacts/org1.saintrivers.anchors.tx -asOrg Org1


# get data in json
configtxgen --inspectBlock ./artifacts/channel.tx > ./blocks-inspected/channel.tx.json
configtxgen --inspectBlock ./artifacts/orderer.genesis.block > ./blocks-inspected/orderer.genesis.block.json
configtxgen --inspectBlock ./artifacts/org1.saintrivers.anchors.tx > ./blocks-inspected/org1.saintrivers.anchors.tx.json
