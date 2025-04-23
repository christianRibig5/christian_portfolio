#!/bin/bash
set -e

# Ensure npm is available
if ! command -v npm &> /dev/null; then
  echo "❌ npm not found! Please make sure Node.js is installed inside Jenkins."
  exit 1
fi


# Build React App
echo "🛠 Building React app..."

# Clean stale modules (optional but good)
rm -rf node_modules package-lock.json

# Install all dependencies (including devDependencies)
npm install --legacy-peer-deps
# Ensure vite is installed locally (needed for vite.config.mjs resolution)
npm install --save-dev vite@latest

if [ ! -f node_modules/vite/package.json ]; then
  echo "❌ Vite not installed locally! Build will fail."
  exit 1
fi

# Check vite installation
echo "🧪 Vite location:"
which vite
echo "🔧 Vite version:"
npx vite --version
# Run the build
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
