#!/usr/bin/env bash

set -euo pipefail

cat > README.md <<EOF

# kubeadm-one

Tool for deploying a remotely-accessible single node kubernetes cluster on linux using kubeadm.

## Install the script (For use with existing Linux machine)

\`\`\`
sudo curl -o /usr/local/bin/kubeadm-one \\
  https://raw.githubusercontent.com/cisco-sso/kubeadm-one/master/kubeadm-one && \\
  sudo chmod 755 /usr/local/bin/kubeadm-one
\`\`\`

## Install via Vagrant (Creates a new Virtual Machine and Installs Kubernetes)

\`\`\`
git clone https://github.com/cisco-sso/kubeadm-one.git
cd kubeadm-one

# Customize the Vagrantfile settings
\$memory = 4096  # In megabytes
\$cpus   = 1
\$address = "" # Set this if you want to set a static IP alias on eth0 (e.g. "192.168.3.13")
\$fqdn = ""    # Set this if you will access the kube cluster remotely (e.g. "api.kube1.example.com")

# For OSX Virtualbox
vagrant up

# For Windows Hyper-V
vagrant up --provider hyperv
\`\`\`

## Usage

\`\`\`
$(./kubeadm-one)
\`\`\`
EOF
