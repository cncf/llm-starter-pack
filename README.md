# A Cloud Native LLM Starter Pack

## Prerequisites

- [Docker](https://docs.docker.com/install/)
- [kind](https://kind.sigs.k8s.io/)
  - kind is "Kubernetes in Docker," used by the Kubernetes project to help test features and run integration tests. Turns out, it's a handy way anyone can use to spin up a cluster quickly. Big thank you to @bentheelder for developing it 👏🏼 👏🏼
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  - kubectl is how you interact with k8s using the command line. This allows you to become a k8s whisperer :-)

## Startup

We have crafted a script to make this demo run as quickly as possible on your machine, once you've installed the prerequisites.

This script will:

- Create a kind cluster
- Apply the Kubernetes manifests we need for our LLM chatbot demo
- Use port-forwarding to help us access our service in the browser so we can ask our LLM questions

> **Note:** After applying the Kubernetes manifests, our cluster will take roughly 3-4 minutes to download the images, initialize the LLM and start the applications. You can monitor the status of the pods by running `kubectl get pods`

```sh
./startup.sh
```

## Shutdown

To shutdown the demo, simply run the following command, which will:

- Remove the Kubernetes manifests
- Remove the port-forwarding
- Delete the kind cluster

```sh
./shutdown.sh
```

## Operating System Information

This demo has been tested on the following operating systems and will work if you have the prerequisites installed.

- macOS
- Linux
- Windows
