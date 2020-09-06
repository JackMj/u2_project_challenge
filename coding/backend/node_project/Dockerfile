FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean
    

RUN mkdir /app
WORKDIR /app

COPY . /app/
RUN npm i 
RUN npm install bcrypt
RUN npm audit fix --force

EXPOSE 3000

CMD [ "node", "server.js" ]
