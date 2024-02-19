FROM node:20-alpine

WORKDIR /app

COPY ./frontend/. .
RUN npm ci --only=production
RUN npm run build
ENTRYPOINT ["node", ".output/server/index.mjs"]
