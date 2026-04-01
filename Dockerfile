# FROM node:24.14.0-alpine
# RUN npm install -g netlify-cli

FROM nginx:1.27-alpine
COPY build/ /usr/share/nginx/html