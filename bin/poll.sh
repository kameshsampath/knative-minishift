#!/bin/bash 

set -e 

export HOST_URL='kelloworld2.myproject.example.com'
export IP_ADDRESS=$(oc get node -o 'jsonpath={.items[0].status.addresses[0].address}'):$(oc get svc knative-ingressgateway -n istio-system -o 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')


while true
do curl -H "Host: ${HOST_URL}" http://${IP_ADDRESS}
echo ""
sleep .1
done

