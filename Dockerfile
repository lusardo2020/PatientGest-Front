#Step 1 Build Vue-Project
FROM node:12-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install 
COPY . .
RUN npm run build 

#Step 2 Create Nginx Server
FROM nginx:1.21.6-alpine AS prod-stage
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx","-g","daemon off;"]