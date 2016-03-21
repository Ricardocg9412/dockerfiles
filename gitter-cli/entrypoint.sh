#!/bin/bash

sudo -E gitter-cli authorize $GITTER_TOKEN
sudo -E gitter-cli "$@"
