#!/bin/bash

# Specify config location so we can `cat` it reliably
export GANDI_CONFIG="/tmp/config.yaml"

gandi setup
cat eval$($GANDI_CONFIG)
