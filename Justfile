java_version := "21-tem"

# Node
setup-node:
    mise install node

# Python
setup-python:
    mise install python

# Ruby (needs native deps for source build)
setup-ruby:
    sudo apt install -y build-essential autoconf libssl-dev libyaml-dev zlib1g-dev libffi-dev libgmp-dev
    mise install ruby

# Terraform
setup-terraform:
    mise install terraform

# Go
setup-go:
    mise install go

# AWS CLI
setup-aws:
    mise install aws-cli

# gcloud
setup-gcloud:
    mise install gcloud

# GitHub CLI
setup-gh:
    mise install github-cli

# SDKMAN
setup-sdkman:
    curl -s "https://get.sdkman.io?rcupdate=false" | bash
    @echo "Run 'exec zsh' to reload your shell."

# Java (via SDKMAN, requires setup-sdkman first)
setup-java:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ ! -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
        echo "SDKMAN is not installed. Run 'just setup-sdkman' first."
        exit 1
    fi
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java {{java_version}}

# Rust (via rustup)
setup-rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
    @echo "Run 'exec zsh' to reload your shell."

# Docker Engine
setup-docker:
    #!/usr/bin/env bash
    set -euo pipefail
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
    Types: deb
    URIs: https://download.docker.com/linux/ubuntu
    Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
    Components: stable
    Signed-By: /etc/apt/keyrings/docker.asc
    EOF
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
