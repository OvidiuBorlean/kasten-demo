#!/bin/bash

echo "Veeam Kasten - Installation script"

wget https://github.com/kastenhq/external-tools/releases/download/7.5.2/k10tools_7.5.2_linux_amd64.tar.gz
tar zxvf ./k10tools_7.5.2_linux_amd64.tar.gz
sudo mv ./k10tools /usr/local/bin
k10tools primer

helm repo add kasten https://charts.kasten.io/
kubectl create ns kasten-io
helm install k10 kasten/k10 --namespace=kasten-io
kubectl --namespace kasten-io port-forward service/gateway 8080:80
echo "Use:  http://127.0.0.1:8080/k10/#/ for access"
