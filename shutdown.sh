#!/bin/bash

echo "Deleting the Kubernetes manifest for this demo..."
kubectl delete -f kind/

echo "Delete the kind cluster to clean up our machine..."
kind delete cluster -n llm