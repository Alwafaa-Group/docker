#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install necessary dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package database with Docker packages
sudo apt update

# Install Docker, Docker CLI, and containerd
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verify Docker installation
docker --version

# Download Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Set the permissions to make the Docker Compose binary executable
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose --version

# Test Docker installation by running the hello-world container
sudo docker run hello-world

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Move Docker data directory to a new location
sudo mv /var/lib/docker /home/docker-data

# Create a symbolic link to point to the new data directory
sudo ln -s /home/docker-data /var/lib/docker

# Restart Docker service
sudo systemctl restart docker

# Output success message
echo "Docker and Docker Compose have been installed and configured successfully."
