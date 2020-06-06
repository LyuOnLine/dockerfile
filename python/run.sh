#!/usr/bin/env bash

docker run -it -e HOME=/home/$(whoami) -v /home/$(whoami):/home/$(whoami) -w $(pwd)  -u $(id -u):$(id -g) --name dpython --rm lvjf/python bash -c "$*"
