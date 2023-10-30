# A Cloud Native LLM Starter Pack

## Prerequisites

- [Homebrew](https://brew.sh) (MacOS only)
- [Docker](https://docs.docker.com/install/)
- [kind](https://kind.sigs.k8s.io/)
  - kind is "Kubernetes in Docker," used by the Kubernetes project to help test features and run integration tests. Turns out, it's a handy way anyone can use to spin up a cluster quickly. Big thank you to @bentheelder for developing it 👏🏼 👏🏼
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  - kubectl is how you interact with k8s using the command line. This allows you to become a k8s whisperer :-)

## Setup

First, let's create our kind cluster, configured exactly as we want it

```sh
kind create cluster --config cluster.yaml
```

Apply the Kubernetes manifests we need for our LLM chatbot demo

```sh
kubectl apply -f kind/
```

> **Note:** After applying the Kubernetes manifests, our cluster will take roughly 5-10 minutes to download the images, initialize the LLM and start the applications. You can monitor the status of the pods by running `kubectl get pods -w`

We'll use port-forwarding which helps us access our service in the browser so we can ask our LLM questions
  
```sh
kubectl port-forward svc/bot 8501:8501
```

Let's open up our browser and query our LLM

```sh
open http://localhost:8501
```

## Cleanup

This will delete our cluster and keep our machine tidy

```sh
kind delete cluster --name llm
```
