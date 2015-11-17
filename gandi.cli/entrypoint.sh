#!/bin/bash

export GANDI_CONFIG="/root/.config/gandi/config.yaml"
echo "-----> $GANDI_CONFIG"

if [[ -e "$HOME/.config/gandi/config.yaml" ]]; then
    cp "$HOME/.config/gandi/config.yaml" /root/.config/gandi/config.yaml
else
    gandi setup
    echo "---CONFIG BEGIN---"
    cat /root/.config/gandi/config.yaml
fi
