FROM node:10-alpine

MAINTAINER = [PIOTR]

RUN apk update
RUN apk upgrade
RUN apk add git

RUN git clone https://github.com/Pjoterr/blockrain.js
WORKDIR /blockrain.js/
RUN rm package-lock.json
RUN rm -rf node_modules/
RUN npm install -g n
RUN npm install 
RUN npm run-script build
RUN npm install http-server -g

EXPOSE 8080
CMD http-server -f /index.html
