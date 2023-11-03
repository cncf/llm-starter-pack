#!/bin/bash

echo "Create the kind cluster..."
kind create cluster --config cluster.yaml

echo "Applying the Kubernetes manifests for this demo..."
kubectl apply -f kind/

# Wait for the pod starting with "db" to be running
while [[ $(kubectl get pods --no-headers | grep 'database' | awk '{print $3}') != "Running" ]]; do
  echo "Waiting for the database pod to be running..."
  sleep 5
done

# Wait for the pod starting with "bot" to be running
while [[ $(kubectl get pods --no-headers | grep 'bot' | awk '{print $3}') != "Running" ]]; do
  echo "Waiting for the ChatBot pod to be running..."
  sleep 5
done

echo "Forwarding the Chat Bot pod..."
kubectl port-forward svc/bot 8501:8501 &

echo "Forwarding the Weave Scope App..."
kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040 &

echo "Opening the Chat Bot app..."
open http://localhost:8501

echo "Opening the Weave Scope app..."
open http://localhost:4040
