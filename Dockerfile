FROM mhart/alpine-node:10 as builder
COPY package*.json ./  
RUN npm install
COPY . .
RUN npm build 

FROM nginx
EXPOSE 80 
COPY --from=builder /build /usr/share/nginx/html