#!/bin/bash


CURR_DIR=$(dirname $(readlink -f $0))
. ${CURR_DIR}/env.sh

kubectl config use-context k3d-${CLUSTER_NAME}

kubectl cluster-info


kubectl label namespace default istio-injection=enabled
kubectl create namespace istio-system

helm upgrade istio ./applications/istio/ -f ./applications/istio/values.yaml --install -n istio-system
kubectl apply -f ./applications/istio-gateways/localgateway.yaml -n istio-system

