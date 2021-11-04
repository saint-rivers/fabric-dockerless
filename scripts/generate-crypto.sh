#!/bin/bash

rm -rf organizations/*
cryptogen generate --output ./organizations --config=./crypto-config.yaml