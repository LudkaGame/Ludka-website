### BUILD
FROM node:16-alpine as build

WORKDIR /app

COPY ./frontend/package*.json ./
RUN npm install
COPY ./frontend/ .
RUN npm run generate --mode=production
### BUILD


### PROD
FROM nginx as prod
RUN mkdir /app
COPY --from=build /app /app
COPY ./docker/nginx.conf /etc/nginx/conf.d/default.conf
### PROD