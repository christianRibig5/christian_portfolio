#!/bin/bash
set -e

# Ensure npm is available
if ! command -v npm &> /dev/null; then
  echo "❌ npm not found! Please ensure Node.js is installed in the Jenkins environment."
  exit 1
fi

echo "🛠 Building React app..."

# Clean and reinstall dependencies
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps --save-dev vite@latest

# Verify vite install
if [ ! -f node_modules/.bin/vite ]; then
  echo "❌ Vite is not installed locally in node_modules/.bin. Build will fail."
  exit 1
fi

echo "✅ Vite found at node_modules/.bin/vite"
echo "🔧 Vite version:"
npx vite --version

# Build with vite
echo "🔧 Running Vite build..."
npx vite build || {
  echo "🚫 Vite build failed. Check vite.config and dependencies."; exit 1;
}


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
