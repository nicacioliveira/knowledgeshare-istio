#!/bin/bash


CURR_DIR=$(dirname $(readlink -f $0))
. ${CURR_DIR}/env.sh

kubectl config use-context k3d-${CLUSTER_NAME}

kubectl cluster-info

kubectl create namespace monitoring

# kubectl apply -f ./cluster/traefik/traefik-dashboard-ingress.yaml

helm install -f ./applications/etcd/values.yaml etcd -n etcd ./applications/etcd
helm install -f ./applications/gitea/values.yaml gitea -n gitea ./applications/gitea
helm install -f ./applications/prometheus/values.yaml prometheus -n monitoring ./applications/prometheus
helm install -f ./applications/refinery/values.yaml refinery -n refinery ./applications/refinery
