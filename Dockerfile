# Stage 1: Build the app
FROM node:18-alpine AS builder

WORKDIR /app

# Copy dependencies and install them
COPY package.json package-lock.json ./
RUN npm install

# Copy the source code and build it
COPY . .
RUN npm run build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built files from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Replace default nginx config (optional but cleaner)
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Expose port (default for nginx)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

