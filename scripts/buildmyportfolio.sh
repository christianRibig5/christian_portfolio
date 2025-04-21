#!/bin/bash
export PATH=$PATH:/usr/bin:/usr/local/bin

# explicitly call npm using full path
/usr/bin/npm install
/usr/bin/npm run build

set -e  # Exit on error

# Load .env variables
export $(grep -v '^#' .env | xargs)

echo "🛠 Building React app..."
npm install
npm run build

echo "🐳 Removing old Docker container..."
docker rm -f $DOCKER_CONTAINER_NAME 2>/dev/null || true

echo "🐳 Building Docker image..."
docker build -t $DOCKER_IMAGE_NAME .

echo "🏷️ Tagging Docker image with :latest..."
docker tag $DOCKER_IMAGE_NAME $DOCKER_IMAGE_NAME:latest

echo "📦 Loading Docker image into Minikube..."
minikube image load $DOCKER_IMAGE_NAME:latest

echo "🚀 Starting new container locally..."
docker run -d -p $REACT_APP_PORT:80 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME

echo "✅ Done! Your portfolio is running at: http://localhost:$PORT"
