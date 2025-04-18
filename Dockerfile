# Dockerfile
FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm install && npm run build

EXPOSE 4173

CMD ["npm", "run", "preview", "--", "--port", "4173", "--host"]
