
# kubeadm-one

Tool for deploying a remotely-accessible single node kubernetes cluster on linux using kubeadm.

## Install

```
sudo curl -o /usr/local/bin/kubeadm-one \
  https://raw.githubusercontent.com/cisco-sso/kubeadm-one/master/kubeadm-one && \
  sudo chmod 755 /usr/local/bin/kubeadm-one
```

## Usage

```

Overview:

  Tool for deploying a remotely-accessible single node kubernetes cluster on
  linux using kubeadm.  It will:

  * Setup a storageclass host-path provisioner which persists to disk
  * Setup a software metallb loadbalancer service, integrated with kubernetes
  * Run a sequence of tests to ensure the cluster is healthy
  * Generate a local kubeconfig file replacing the sudo users's ~/.kube/config
  * If not running in --local-only (e.g. '--apiserver-cert-extra-sans' is
    defined), generate a remote-access kubeconfig file in sudo user's
    ~/.kube/config.remote
  * Run a sequence of tests to ensure the cluster is healthly.

  This tool has only been tested on Ubuntu 18.04 LTS amd64.

Usage:
  sudo ./kubeadm-one --local-only [--force]
  sudo ./kubeadm-one --apiserver-cert-extra-sans=<network-accessible-fqdn> [--force]
  ./kubeadm-one -h | --help

Warning:
* If your intention is to remotely access this single node kubernetes cluster,
  then you must set a DNS name or IP for the --apiserver-cert-extra-sans option
  below.  This will generate a cluster auth certificate with the right machine
  identifier, which the kubectl client will insist on verifying.
* This program will not continue unless exactly one of '--local-only' or
  '--apiserver-cert-extra-sans' are specified.

Options:
  -l --local-only
              * Specifies a non-remotely accessible kubernetes instance.
                Setting this must be exclusive of '--apiserver-cert-extra-sans'
  -c=<stringSlice> --apiserver-cert-extra-sans=<stringSlice>
              * Passes '--apiserver-cert-extra-sans' stringSlice to kubeadm.
                Optional extra comma-separated Subject Alternative Names (SANs)
                to use for the API Server serving certificate. Can be both IP
                addresses and DNS names.  For example, 'api.kube.example.com'.
              * The first name in the list will be embedded as the server URI
                in the KUBECONFIG file which is generated for remote cluster
                access.
              * Setting this must be exclusive of '--local-only'
  -p=<string> --pod-network-cidr=<string>
              * Specify range of IP addresses for the pod network. If set, the
                control plane will automatically allocate CIDRs for every node.
                Default: '--pod-network-cidr=10.244.0.0/16'
  -d --dotfiles
              * Will setup dotfiles in a machine (e.g. for vagrant installs)
  -f --force  * Do not prompt.  Assume yes for all prompts
              * If kubeadm is has already run, this will reset it without prompt
  -h --help     Show this screen
```
