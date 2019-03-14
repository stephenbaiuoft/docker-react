FROM node:alpine as builderta
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
EXPOSE 80
COPY --from=builderta /app/build /usr/share/nginx/html