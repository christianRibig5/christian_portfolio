#!/bin/bash
set -e

echo "🌍 Forcing development mode..."
export NODE_ENV=development

echo "🛠 Building React app..."

rm -rf node_modules package-lock.json

# Install all devDependencies
npm install --include=dev --legacy-peer-deps

# Build React app using vite (via npm)
echo "🏗 Running build via npm"
npm run build

# Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "⚠️  .env file not found. Using existing environment variables."
fi

# Remove old Docker container if it exists
echo "🐳 Removing old Docker container..."
docker rm -f "$DOCKER_CONTAINER_NAME" 2>/dev/null || true

# Build and tag Docker image
echo "🐳 Building Docker image..."
docker build -t "$DOCKER_IMAGE_NAME" .

echo "🏷️ Tagging Docker image with :latest..."
docker tag "$DOCKER_IMAGE_NAME" "$DOCKER_IMAGE_NAME:latest"

# Load into Minikube if available
if command -v minikube &> /dev/null; then
  echo "📦 Loading Docker image into Minikube..."
  minikube image load "$DOCKER_IMAGE_NAME:latest"
else
  echo "⚠️  Minikube not found. Skipping image load."
fi

# Run container locally
echo "🚀 Starting new container locally..."
docker run -d -p "$REACT_APP_PORT":80 --name "$DOCKER_CONTAINER_NAME" "$DOCKER_IMAGE_NAME"

echo "✅ Done! Your portfolio is running at: http://localhost:$REACT_APP_PORT"
