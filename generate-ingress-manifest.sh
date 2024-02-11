#!/bin/bash

CHART_VERSION=4.9.1
APP_VERSION=1.9.6

echo App version $APP_VERSION Chart version $CHART_VERSION ;

echo need below two commands to check the app versions and chart versions
echo helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
echo helm repo update
echo helm search repo ingress-nginx --versions


mkdir -p ./kubernetes/ingress/controller/nginx/manifests/

helm template ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--version ${CHART_VERSION} \
--namespace ingress-nginx \
> ./kubernetes/ingress/controller/nginx/manifests/nginx-ingress.${APP_VERSION}.yaml
