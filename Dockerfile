FROM node:18-alpine

WORKDIR /app

COPY ./frontend/. .
RUN npm install
ENV NODE_ENV=production
RUN npm run build
ENTRYPOINT ["node", ".output/server/index.mjs"]
