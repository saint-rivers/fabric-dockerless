#!/bin/bash

. ./scripts/generate-crypto.sh
. ./scripts/artifacts-init.sh

. ./scripts/orderer-up.sh &

. ./scripts/peer-start.sh