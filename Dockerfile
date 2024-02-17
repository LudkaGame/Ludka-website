### BUILD
FROM node:18-alpine as build

WORKDIR /app

RUN npm run build
COPY ./frontend/package*.json ./
RUN npm install
COPY ./frontend/.output .
RUN node server/index.mjs
### BUILD


### PROD
FROM nginx as prod
RUN mkdir /app
COPY --from=build /app /app
COPY ./docker/nginx.conf /etc/nginx/conf.d/default.conf
### PROD