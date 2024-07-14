#!/bin/sh

# ==============================================================================
# Aliases for `cd`.
# ==============================================================================

# Build a Docker image from a Dockerfile in the current directory.
buildDockerImage() {
  if [ -z "$1" ]; then
    docker build .
  else
    docker build --tag "$1" .
  fi
}

# Run a Docker container from an image.
runDockerContainer() {
  if [ -z "$1" ]; then
    echo "Usage: runDockerContainer <image_name>\n"
    echo "Get the image name by running 'docker image ls'."
    return 1
  fi
  docker run --detach "$1"
}

# Build an image and immediately run a container in the background from it.
# Requires a Dockerfile in the current directory.
#
# Optionally pass a name for the image, and an image name will be generated
# automatically.
#
# Reference: https://stackoverflow.com/questions/36075525/
runDockerFromFile() {
  if [ -z "$1" ]; then
    docker run --detach "$(docker build -q .)"
  else
    docker build --tag "$1" .
    docker run --detach "$1"
  fi
}

# List all available docker images.
listDockerImages() {
  docker image ls
}

# SSH into a running container.
sshDockerContainer() {
  if [ -z "$1" ]; then
    echo "Usage: sshDocker <container_id>\n"
    echo "Get the container ID by running 'docker ps'."
    return 1
  fi
  docker exec -it "$1" /bin/bash
}
