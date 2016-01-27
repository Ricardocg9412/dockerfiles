#!/bin/bash
# remove -b requirement
# in each dockerfile repo, have a file called 'env' or 'args' or whatever, and make 
# the script look for that
# it could contain some envvar like 
# docker-volumes + list of mappings, or whatever

if [ -z "$DOCKER_HUB_USER" ]
then
  echo "Please export DOCKER_HUB_USER environment variable."
  exit 1
fi

# name is the argument, if provided, otherwise the name of the current dir
dir_name=$(basename "$PWD")
dockerbin="$HOME/bin/dockerfunc"

if [ "$1" == '-b' ] ; then
    shift
    docker build -t $DOCKER_HUB_USER/$dir_name .
else
    # create a script in the current directory by copying the template from the parent dir
    echo "creating executable $dir_name"
    cp -i ../template.sh ./$dir_name && chmod +x ./$dir_name

    # create a symlink in ~/bin/dockerfunc to the containerized application
    echo "linking $dockerbin/$dir_name to `pwd`/$dir_name"
    ln -si `pwd`/"$dir_name" $dockerbin/"$dir_name"

    echo "done! now you can run \`$dir_name\`."
fi
