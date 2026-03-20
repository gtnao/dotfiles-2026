java_version := "21-tem"

# Node
setup-node:
    mise install node
    @echo "Run 'exec zsh' to reload your shell."

# Python
setup-python:
    mise install python
    @echo "Run 'exec zsh' to reload your shell."

# Ruby (needs native deps for source build)
setup-ruby:
    sudo apt install -y build-essential autoconf libssl-dev libyaml-dev zlib1g-dev libffi-dev libgmp-dev
    mise install ruby
    @echo "Run 'exec zsh' to reload your shell."

# Terraform
setup-terraform:
    mise install terraform
    @echo "Run 'exec zsh' to reload your shell."

# Go
setup-go:
    mise install go
    @echo "Run 'exec zsh' to reload your shell."

# pnpm
setup-pnpm:
    mise install pnpm
    @echo "Run 'exec zsh' to reload your shell."

# uv
setup-uv:
    mise install uv
    @echo "Run 'exec zsh' to reload your shell."

# AWS CLI
setup-aws:
    mise install aws-cli
    @echo "Run 'exec zsh' to reload your shell."

# gcloud
setup-gcloud:
    mise install gcloud
    @echo "Run 'exec zsh' to reload your shell."

# GitHub CLI
setup-gh:
    mise install github-cli
    @echo "Run 'exec zsh' to reload your shell."

# SDKMAN
setup-sdkman:
    curl -s "https://get.sdkman.io?rcupdate=false" | bash
    @echo "Run 'exec zsh' to reload your shell."

# Java (via SDKMAN, requires setup-sdkman first)
setup-java:
    #!/usr/bin/env bash
    set -eo pipefail
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
