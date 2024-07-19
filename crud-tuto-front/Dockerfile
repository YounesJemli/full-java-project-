# stage 1
FROM node:14.21.3-alpine as node

# Install Firefox
RUN apk add --no-cache firefox
ENV FIREFOX_BIN=/usr/bin/firefox

WORKDIR /app
COPY . .
RUN npm cache clean --force
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html
EXPOSE 80
