# #!/bin/bash

# # Load environment variables from .env
# export $(grep -v '^#' .env | xargs)

# # Defaults (in case .env is missing any value)
# PORT=${REACT_APP_PORT:-3000}
# IMAGE=${DOCKER_IMAGE_NAME:-christian_portfolio_img}
# CONTAINER=${DOCKER_CONTAINER_NAME:-christian_portfolio_container}

# echo "🚧 Step 1: Installing dependencies..."
# npm install

# echo "⚙️ Step 2: Building React Vite app..."
# npm run build

# echo "🐳 Step 3: Removing old Docker container (if it exists)..."
# docker rm -f $CONTAINER 2>/dev/null || true

# echo "📦 Step 4: Building new Docker image..."
# docker build -t $IMAGE .

# echo "🚀 Step 5: Running new container on port $PORT..."
# docker run -d -p $PORT:80 --name $CONTAINER $IMAGE

# echo "✅ Done! Your portfolio is running at: http://localhost:$PORT"



#!/bin/bash
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
