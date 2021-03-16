FROM node:alpine as builder
WORKDIR '/app'
COPY /package.json .
RUN npm install
COPY . .
RUN npm run build

#new FROM indicates it's a new phase
FROM nginx 
COPY --from=0 /app/build /usr/share/nginx/html 
#take the build file from phase 0 and put in /usr/share/nginx/html
#nginx's default command is to start nginx


