#!/bin/bash

set -euxo pipefail # Strict mode: abort on errors/unset vars and print execution trace

echo "Refresh the package list"
# Downloads the latest package information and available versions.
# Does not install anything yet.
sudo apt update

echo "Install Python, pip and pipx"
# python3-pip = Python package manager
# pipx = installs Python applications in isolated environments
sudo apt install -y python3 python3-pip pipx

echo "Install Ansible in an isolated Python environment"
# Installs Ansible with all required dependencies.
# Using pipx avoids conflicts with other Python packages.
sudo pipx install ansible --include-deps

echo "Add pipx binaries to the PATH environment variable"
# Makes the ansible command globally available.
pipx ensurepath

echo "Reload shell configuration"
# Reloads ~/.bashrc so PATH changes take effect immediately.
source ~/.bashrc

echo "Check installed Ansible version"
ansible --version