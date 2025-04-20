#!/bin/bash

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Defaults (in case .env is missing any value)
PORT=${REACT_APP_PORT:-3000}
IMAGE=${DOCKER_IMAGE_NAME:-christian_portfolio_img}
CONTAINER=${DOCKER_CONTAINER_NAME:-christian_portfolio_container}

echo "🚧 Step 1: Installing dependencies..."
npm install

echo "⚙️ Step 2: Building React Vite app..."
npm run build

echo "🐳 Step 3: Removing old Docker container (if it exists)..."
docker rm -f $CONTAINER 2>/dev/null || true

echo "📦 Step 4: Building new Docker image..."
docker build -t $IMAGE .

echo "🚀 Step 5: Running new container on port $PORT..."
docker run -d -p $PORT:80 --name $CONTAINER $IMAGE

echo "✅ Done! Your portfolio is running at: http://localhost:$PORT"

