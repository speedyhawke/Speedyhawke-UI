#!/bin/bash

# A script to build the Windows installer using a Docker container.

set -e

IMAGE_NAME="speedyhawke-ui-windows-builder"
CONTAINER_NAME="speedyhawke-ui-windows-builder-container"

echo "Building the Windows builder Docker image..."
docker build -t $IMAGE_NAME -f Dockerfile.windows .

echo "Image built successfully. Creating container..."

# Run the container in the background
docker run -d --name $CONTAINER_NAME $IMAGE_NAME

echo "Container created. Running the electron-builder..."

# Run the build command inside the container
docker exec $CONTAINER_NAME powershell -Command "npm run-script mw"

echo "Build complete. Copying the installer from the container..."

# Create a local dist directory if it doesn't exist
mkdir -p dist

# Copy the installer from the container to the local dist directory
docker cp $CONTAINER_NAME:/build/dist-win32/SpeedyHawke-UI.exe ./dist/SpeedyHawke-UI-installer.exe

echo "Installer copied to ./dist/SpeedyHawke-UI-installer.exe"

echo "Stopping and removing the container..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo "Done."
