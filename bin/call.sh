#!/bin/bash 

set -e 

export IP_ADDRESS=$(oc get node -o 'jsonpath={.items[0].status.addresses[0].address}'):$(oc get svc knative-ingressgateway -n istio-system -o 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')

export HOST_URL=$(oc get  services.serving.knative.dev kelloworld  -o jsonpath='{.status.domain}')

curl -H "Host: ${HOST_URL}" http://${IP_ADDRESS}