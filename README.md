# Pi-hole Workload Chart

This is a Helm chart for deploying the [Pi-hole](https://pi-hole.net) workload to a Kubernetes cluster.

**IMPORTANT:**

1. This chart publishes the DNS service of Pi-hole on port 53 TCP and UDP on every node in your cluster!
   For this to work, your cluster must be configured to allow this (e.g. by starting kubelet with the arg
   `--service-node-port-range=0-32767`), and the port must be available.
1. The configuration data for the Pi-hole service is stored in a separate persistent volume so that it survives
   re-deployments.

## Prerequisites

Provide a persistent volume for this chart in your cluster.
Check [Pi-hole Volume Chart](https://github.com/christian-schlichtherle/pihole-volume-chart) as an example if you need
help.

## How to configure

Check the file `values.yaml`.
Consider this file being read-only and put your customizations into a file named `custom.yaml` instead, so that you
don't get merge conflicts when you pull the changes from this repository.
The files are merged before deployment so that `custom.yaml` gains priority over `values.yaml`.

## Synopsis

### Installation

    make [up] 

### Uninstallation

    make down
