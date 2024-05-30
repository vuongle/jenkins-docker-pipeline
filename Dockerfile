FROM node:21.0.0
WORKDIR /app
COPY . /app
RUN npm install
CMD node server.js
EXPOSE 4000