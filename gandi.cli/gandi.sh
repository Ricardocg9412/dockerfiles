# to be sourced in your profile

gandi(){
    # Run the Gandi CLI in a container.

    # The following envvars are supported:
    # ENV API_ENV      production gandi domain list
    # ENV API_HOST     allow to specify a HTTP URL to connect and to send the API commands.
    # ENV API_KEY      allow to specify an API key for the chosen environment (multiple accounts)

    # If a config file exists, mount it as a volume in the container
    if [[ -e "$HOME/.config/gandi/config.yaml" ]]; then
        # echo "found config in homedir: $HOME/.config/gandi/config.yaml"
        docker run -it --rm \
            --name gandi \
            -v $HOME/.config/gandi/config.yaml:/home/root/.config/gandi/config.yaml \
            -e API_ENV -e API_HOST -e API_KEY \
            soulshake/gandi.cli "$*"
    else
        # run gandi setup, then copy it to the standard config location
        # echo "no gandi config found in homedir, need to run setup"
        docker run -it --rm \
            --name gandi \
            -e API_ENV -e API_HOST -e API_KEY \
            --entrypoint /gen-config.sh \
            soulshake/gandi.cli | tee /tmp/gandi-setup.txt
        cat /tmp/gandi-setup.txt | grep "^api:" -A20 > $HOME/.config/gandi/config.yaml
        /bin/rm /tmp/gandi-setup.txt

    fi
}

gandi-build() {
    cd ~/git/dockerfiles/gandi.cli
    docker build -t soulshake/gandi.cli .
    cd -
}

gandi-attach () {
    docker run --rm -ti --entrypoint bash --name gandi soulshake/gandi.cli "$@"
}
