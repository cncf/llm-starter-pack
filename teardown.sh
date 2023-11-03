#!/bin/bash

echo "Applying the Kubernetes manifests for this demo..."
kubectl delete -f kind/bot-deployment.yaml
kubectl delete -f kind/bot-service.yaml
kubectl delete -f kind/database-deployment.yaml
kubectl delete -f kind/database-pvc.yaml
kubectl delete -f kind/database-service.yaml
