#!/usr/bin/env bash
docker run -it -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v /home/$(whoami):/home/$(whoami) -v $(pwd):$(pwd) -w $(pwd) \
    -u $(id -u):$(id -g) --name mm --rm lvjf/hisi \
    bash -c "cd $(pwd); $*"
