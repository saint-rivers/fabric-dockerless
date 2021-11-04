#!/bin/bash

killall peer
killall orderer

# docker ps
# docker container stop couchdb
# docker container rm couchdb

rm -rf ./artifacts/* 2> /dev/null
rm -rf ./blocks-inspected/* 2> /dev/null
rm -rf ./organizations/* 2> /dev/null
rm -rf ./ledger/* 2> /dev/null
rm -rf ./lifecycle/* 2> /dev/null
rm -rf ./chaincodes/* 2> /dev/null
rm -rf ./externalbuilder/* 2> /dev/null
rm -rf ./ledgersData/* 2> /dev/null
rm -rf ./lifecycle/* 2> /dev/null
rm -rf ./snapshots/* 2> /dev/null
rm -rf ./transientstore/* 2> /dev/null
rm mychannel.block 2> /dev/null
rm -rf ./CouchDB/* 2> /dev/null


