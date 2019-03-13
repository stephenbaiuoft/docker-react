FROM node:alpine as builder_stage_1
WORKDIR /app
COPY package.json .  
RUN npm install
COPY . .
RUN npm build 

FROM nginx
EXPOSE 80 
COPY --from=builder_stage_1 /app/build /usr/share/nginx/html