Kubernetes local deployment with Minikube and KVM
=================================================

[Minikube](https://github.com/kubernetes/minikube) is a cross-platform, community-driven [Kubernetes](https://kubernetes.io/) distribution, which is targeted to be primarily used at the local environments. It deploys a single-node cluster, which is a great option for having a simple Kubernetes cluster up&running on localhost.

Minikube is designed to be used as a virtual machine (VM), and the default VM runtime is Virtualbox. At the same time, extensibility is one of the key benefits of Minikube, so it's possible to use it without Virtualbox, but with other [drivers](https://github.com/kubernetes/minikube/blob/master/docs/drivers.md).

By default, Minikube uses Virtualbox as a runtime for running the virtual machine. Virtualbox is a cross-platform solution, which can be used on the various sorts of operating systems, including GNU/Linux, Windows and macOS.

At the same time, QEMU/KVM is a Linux-native virtualization solution, which may offer more benefits comparing to Virtualbox. Specifically, it's way easier to use KVM on the headless GNU/Linux server.

Also, Virtualbox and KVM can't be used simultaneously, so if you are already running any KVM workloads on some machine, and willing to run Minikube there as well, using the KVM minikube driver is a preferred way to go.

In this guide we'll focus on running Minikube with the KVM driver.

Disclaimer
----------

This is not an official minikube guide. You may find a detailed information on running and using Minikube on it's official [webpage](https://github.com/kubernetes/minikube/blob/master/docs/drivers.md), where different usecases, operating systems, environemtns, etc. are covered. Instead, the purpose of this quide - to provide some easy and clear guidelines on running Minikube with KVM on a Linux.

Prereqs
-------

-	Any Linux you like (in this tutorial we'll use Ubuntu 18.04 LTS, and all the instructions below are applicable to it. If you prefer using a different Linux distribution, please check out the relevant documentation, or make this tutorial better and submit a PR :wink:)
-	Installed and properly configured `libvirt` and QEMU-KVM
-	Kubernetes CLI (`kubectl`) for operating the Kubernetes cluster

### QEMU/KVM and libvirt installation

*NOTE: skip if already installed*

```shell
sudo apt install libvirt-clients libvirt-daemon-system qemu-kvm \
    && sudo usermod -a -G libvirt $(whoami) \
    && newgrp libvirt
```

### kubectl (Kubernetes CLI) installation

*NOTE: skip if already installed*

```shell
curl -LO https://storage.googleapis.com/kubernetes-release/release/latest/bin/linux/amd64/kubectl \
    && sudo install kubectl /usr/local/bin
```

Installation
------------

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
