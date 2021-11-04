#!/bin/bash

killall orderer 2> /dev/null

export ORDERER_FILELEDGER_LOCATION=$PWD/ledger
# Change this to control logs verbosity
export FABRIC_LOGGING_SPEC=INFO

#### You may add other vars to override setup in orderer.yaml###
export FABRIC_CFG_PATH=$PWD

orderer