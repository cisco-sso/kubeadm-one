#!/usr/bin/env bash

set -euo pipefail

cat > README.md <<EOF

# kubeadm-one

Tool for deploying a remotely-accessible single node kubernetes cluster on linux using kubeadm.

## Install

\`\`\`
sudo curl -o /usr/local/bin/kubeadm-one \\
  https://raw.githubusercontent.com/cisco-sso/kubeadm-one/master/kubeadm-one && \\
  sudo chmod 755 /usr/local/bin/kubeadm-one
\`\`\`

## Usage

\`\`\`
$(./kubeadm-one)
\`\`\`
EOF
