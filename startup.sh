#!/bin/bash

echo "Create the kind cluster..."
kind create cluster --config cluster.yaml

echo "Applying the LLM manifests for this demo..."
kubectl apply -f kind/ollama-deployment.yaml
kubectl apply -f kind/ollama-service.yaml


# Wait for the pod starting with "db" to be running
while [[ $(kubectl get pods --no-headers | grep 'ollama' | awk '{print $3}') != "Running" ]]; do
  echo "Waiting for the LLM pod to be running..."
  sleep 5
done