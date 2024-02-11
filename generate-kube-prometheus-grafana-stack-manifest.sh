#!/bin/bash

CHART_VERSION=56.6.2
APP_VERSION=v0.71.2

echo App version $APP_VERSION Chart version $CHART_VERSION ;

echo need below two commands to check the app versions and chart versions
echo helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
echo helm repo update
echo helm search repo prometheus-community/kube-prometheus-stack --versions


mkdir -p ./kubernetes/kube-prometheus-stack/manifests/

helm template kube-prometheus-stack prometheus-community/kube-prometheus-stack   \
--repo https://prometheus-community.github.io/helm-charts/ \
--version ${CHART_VERSION} \
--namespace prometheus \
> ./kubernetes/kube-prometheus-stack/manifests/kube-prometheus-stack.${APP_VERSION}.yaml
