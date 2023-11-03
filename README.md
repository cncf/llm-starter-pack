# A Cloud Native LLM Starter Pack

## Prerequisites

- [Docker](https://docs.docker.com/install/)
- [kind](https://kind.sigs.k8s.io/)
  - kind is "Kubernetes in Docker," used by the Kubernetes project to help test features and run integration tests. Turns out, it's a handy way anyone can use to spin up a cluster quickly. Big thank you to @bentheelder for developing it 👏🏼 👏🏼
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  - kubectl is how you interact with k8s using the command line. This allows you to become a k8s whisperer :-)

## Startup

We have crafted a few scripts to make this demo run as quickly as possible on your machine once you've installed the prerequisites.

This script will:

- Create a kind cluster
- Apply the Kubernetes manifests we need for our LLM chatbot demo
- Use port-forwarding to help us access our service in the browser so we can ask our LLM questions

> **Note:** After applying the Kubernetes manifests, our cluster will take roughly 3-4 minutes to download the images, initialize the LLM and start the applications. You can monitor the status of the pods by running `kubectl get pods`

```sh
./startup.sh
```

## Demo

Next, we can install the demo app that makes use of the LLM.

```sh
./demo.sh
```

If you want to remove or tear down just hte demo app, you can run 

```sh
./teardown.sh
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

## Acknowledgements

We'd like to thank Docker for sharing their GenAI Stack demo with us. We've used their demo as a starting point for this demo. You can find their demo [here](https://www.docker.com/blog/introducing-a-new-genai-stack/).

We'd also like to thank Weaveworks for their Weaveworks Scope project which we've used to help visualize our Kubernetes cluster. You can find their project [here](https://www.weave.works/oss/scope/).
