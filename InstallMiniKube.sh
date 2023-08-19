#!/bin/bash

# Check if curl is installed, install if not
if ! command -v curl &> /dev/null; then
  sudo apt update
  sudo apt install -y curl
fi

# Download and install kubectl
if ! command -v kubectl &> /dev/null; then
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/
fi

# Download and install Minikube
if ! command -v minikube &> /dev/null; then
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  rm minikube-linux-amd64
fi

# Start Minikube cluster
minikube start --driver=docker

# Verify Minikube status
minikube status

# Set kubectl context to Minikube
kubectl config use-context minikube

# Display Minikube and kubectl versions
minikube version
kubectl version --short
