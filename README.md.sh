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
\$macaddress = "0A0000000001"  # Pin to a local mac address for Static DHCP assignment
\$fqdn = ""  # Set this if you will access the kube cluster remotely (e.g. "api.kube1.example.com")

# (Optional) Advanced users may need to set api-server parameters
#   Override all kubeadm configuration with custom config file
cp kubeadm.conf.custom kubeadm.conf
# Then edit the file

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
