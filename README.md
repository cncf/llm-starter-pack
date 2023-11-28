# A Cloud Native LLM Starter Pack

## Prerequisites

- [Docker](https://docs.docker.com/install/)
- [kind](https://kind.sigs.k8s.io/)
  - kind is "Kubernetes in Docker," used by the Kubernetes project to help test features and run integration tests. It turns out it's a handy way for anyone to spin up a cluster quickly. Big thank you to @bentheelder for developing it 👏🏼 👏🏼
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

Next, we can install the demo app that uses the LLM.

```sh
./demo.sh
```

If you want to remove or tear down just the demo app, you can run 

```sh
./teardown.sh
```

## Shutdown

To shut down the demo, run the following command, which will:

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

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/cncf/llm-starter-pack:latest
```

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new key-pair](https://docs.sigstore.dev/cosign/overview/) with `cosign`. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.

## Acknowledgements

We'd like to thank Docker for sharing their GenAI Stack demo with us. We've used their demo as a starting point for this demo. You can find their demo [here](https://www.docker.com/blog/introducing-a-new-genai-stack/).

We'd also like to thank Weaveworks for their Weaveworks Scope project which we've used to help visualize our Kubernetes cluster. You can find their project [here](https://www.weave.works/oss/scope/).
