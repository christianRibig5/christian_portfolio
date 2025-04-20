#!/bin/bash

# Load .env variables
export $(grep -v '^#' .env | xargs)

echo "🚧 Building React App with Vite..."
npm install
npm run build

echo "🐳 Building Docker Image..."
docker build -t $DOCKER_IMAGE_NAME .

echo "🚀 Running Docker Container..."
docker run -d -p $REACT_APP_PORT:80 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME

echo "✅ App is running at: http://localhost:$REACT_APP_PORT"

