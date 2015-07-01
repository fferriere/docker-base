#!/bin/bash

MY_PATH=$(dirname $(realpath $0))

NAME='fferriere/base'
if [ -n "$FFERRIERE_BASE_IMAGE" ]; then
    NAME=$FFERRIERE_BASE_IMAGE
fi

docker build -t $NAME "$@" $MY_PATH/.
