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

# Display kubectl version
kubectl version --client
