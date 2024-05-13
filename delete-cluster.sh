#!/bin/bash

CURR_DIR=$(dirname $(readlink -f $0))
. ${CURR_DIR}/env.sh

k3d cluster delete -c ./cluster/config.yaml