#!/bin/bash

echo "Removing the Kubernetes manifests from this demo..."
kubectl delete -f kind/bot-deployment.yaml
kubectl delete -f kind/bot-service.yaml
kubectl delete -f kind/database-deployment.yaml
kubectl delete -f kind/database-pvc.yaml
kubectl delete -f kind/database-service.yaml

# Find all kubectl port-forward processes and kill them
echo "Identifying all kubectl port-forward processes..."

# Use pgrep to find the PIDs of the processes with 'kubectl port-forward' command
pids=$(pgrep -f "kubectl port-forward")

if [ -z "$pids" ]; then
    echo "No kubectl port-forward processes found."
else
    # Display the PIDs and kill them
    for pid in $pids; do
        echo "Terminating process with PID: $pid"
        kill $pid
        if [ $? -eq 0 ]; then
            echo "Successfully terminated process with PID: $pid"
        else
            echo "Failed to terminate process with PID: $pid. You may need to run the script as root or use 'sudo'."
        fi
    done
fi

echo "All kubectl port-forward processes have been terminated."
