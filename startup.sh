#!/bin/bash

echo "Create the kind cluster..."
kind create cluster --config cluster.yaml

echo "Applying the Kubernetes manifests for this demo..."
kubectl apply -f kind/

# Wait for the pod starting with "ollama" to be running
while [[ $(kubectl get pods --no-headers | grep 'ollama' | awk '{print $3}') != "Running" ]]; do
  echo "Waiting for the LLM pod to be running..."
  sleep 5
done

echo "Forwarding the Chat Bot pod..."
kubectl port-forward svc/bot 8501:8501 &

echo "Opening the Chat Bot app..."
open http://localhost:8501