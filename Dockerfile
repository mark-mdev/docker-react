FROM node:20-alpine AS builder
WORKDIR "/app"
COPY package.json .
RUN npm instal
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
