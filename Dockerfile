FROM node:16-alpine as buider

WORKDIR  "/app"
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx

COPY --from=buider /app/build /usr/share/nginx/html
