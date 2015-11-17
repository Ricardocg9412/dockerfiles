# to be placed in your $PATH

gandi(){
    # If a config file exists, mount it as a volume in the container
    if [[ -e "$HOME/.config/gandi/config.yaml" ]]; then
        # echo "found config in homedir: $HOME/.config/gandi/config.yaml"
        docker run -it --rm \
            --name gandi \
            -v $HOME/.config/gandi/config.yaml:/home/root/.config/gandi/config.yaml \
            soulshake/gandi.cli "$@"
    else
        # run gandi setup, then copy it to the standard config location
        # echo "no gandi config found in homedir, need to run setup"
        docker run -it --rm \
            --name gandi \
            --entrypoint /entrypoint.sh \
            soulshake/gandi.cli | tee /tmp/gandiconfig.txt
        mkdir -p $HOME/.config/gandi/
        cat /tmp/gandiconfig.txt | grep "^api:" -A20 > /tmp/gandiconfig.txt
        cp /tmp/gandiconfig.txt $HOME/.config/gandi/config.yaml
        rm /tmp/gandiconfig.txt
    fi
}

