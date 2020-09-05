#!/usr/bin/env bash
_ttyname=$(tty | tr -d '\r' |sed -e 's/\//_/g')
_dockername="hisi_nnie_${ttyname}"
# For nnie_mapper_12, which must run under data, but with dependence on parent directory.
docker run -it -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v $(pwd)/..:$(pwd)/.. -w $(pwd)/.. \
    -u $(id -u):$(id -g) --name ${_dockername} --rm hisi/nnie_mapper \
        bash -c "cd $(pwd); nnie_mapper_12 $*"