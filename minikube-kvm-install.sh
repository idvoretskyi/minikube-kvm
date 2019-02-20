### QEMU/KVM and libvirt installation

_NOTE: skip if already installed_

```shell
sudo apt install libvirt-clients libvirt-daemon-system qemu-kvm \
    && sudo usermod -a -G libvirt $(whoami) \
    && newgrp libvirt
```

### kubectl (Kubernetes CLI) installation

_NOTE: skip if already installed_

```shell
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && sudo install kubectl /usr/local/bin
```

## Installation

### Minikube KVM driver installation

```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 \
    && sudo install docker-machine-driver-kvm2 /usr/local/bin/
```

### Minikube installation

```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### To use the KVM2 driver:

```shell
minikube start --vm-driver kvm2
```

### Set KVM2 as a default VM driver for Minikube

```shell
minikube config set vm-driver kvm2
```

and run minikube as usual:

```shell
minikube start
```

## Verify the installation

Verify if Minikube was installed properly:

```shell
minikube version
```

Check out if the Kubernetes cluster is up and running:

```shell
kubectl get nodes
```

Run a sample simple app (nginx in our case)

```shell
kubectl run nginx --image=nginx
```

And check out if the Kubernetes pods are properly provisioned

```shell
kubectl get pods
```
