FROM node:18-alpine

WORKDIR /app

COPY ./frontend/. .
RUN npm install
RUN npm ci --only=production
ENTRYPOINT ["node", ".output/server/index.mjs"]
