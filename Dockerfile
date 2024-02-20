FROM node:21-alpine AS builder

WORKDIR /app

COPY ./frontend/. .
RUN npm ci --only=production
RUN npm run build

FROM node:21-alpine AS prod
WORKDIR /app
COPY --from=builder /app/.nuxt ./.nuxt
COPY --from=builder /app/.output ./.output
COPY --from=builder /app/node_modules ./node_modules
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
EXPOSE 3000
ENTRYPOINT ["node", ".output/server/index.mjs"]
