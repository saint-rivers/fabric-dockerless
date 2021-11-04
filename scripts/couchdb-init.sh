#!/bin/bash

docker run  -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password --name=couchdb -p 5984:5984 -d couchdb:2.2.0 --restart unless-stopped

# 2. Verify that the container is up
sleep 2s
curl localhost:5984