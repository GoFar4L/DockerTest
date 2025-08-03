#!/bin/bash
# Make this file an executable before using it (chmod +x)
# Exit instantly on error
set -e

echo "Starting setup and deployment..."

# Step 1: Generate certificates
# Check if script exists and is executable
if [[ -x ./scripts/generate-certs.sh ]]; then
    ./scripts/generate-certs.sh
else
    echo "Script generate-certs.sh not found or not executable."
    exit 1
fi

# Step 2: Configure firewall
# Check if script exists and is executable
if [[ -x ./scripts/setup-firewall.sh ]]; then
    ./scripts/setup-firewall.sh
else
    echo "Script setup-firewall.sh not found or not executable."
    exit 1
fi

# Step 3: Start Docker containers
if [[ -f docker-compose.yaml ]]; then
    echo "Launching Docker containers..."
    docker-compose up -d
    echo "Docker environment is up and running."
else
    echo "docker-compose.yml not found in the current directory."
    exit 1
fi
