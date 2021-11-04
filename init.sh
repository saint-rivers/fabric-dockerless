#!/bin/bash

. ./reset.sh

. ./scripts/generate-crypto.sh
. ./scripts/artifacts-init.sh

. ./scripts/orderer-up.sh &

# . ./scripts/couchdb-install.sh

# sleep 5s
. ./scripts/peer-start.sh 