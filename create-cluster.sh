#!/bin/bash

CURR_DIR=$(dirname $(readlink -f $0))
. ${CURR_DIR}/env.sh

k3d cluster create -c ./cluster/config.yaml --verbose

kubectl taint nodes k3d-${CLUSTER_NAME}-server-0 node-role.kubernetes.io/master:NoSchedule

