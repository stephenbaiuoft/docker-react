FROM mhart/alpine-node:10 as builder
WORKDIR /app
COPY package*.json ./  
RUN npm install
COPY ./ ./
RUN npm build 

FROM nginx
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html