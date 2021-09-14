FROM node:latest as build
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build
FROM nginx:latest
COPY --from=build /app/dist/angul-example /usr/share/nginx/html
EXPOSE 84