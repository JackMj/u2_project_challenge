FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN npm i 

RUN mkdir /app
WORKDIR /app

COPY ./package.json /app/
COPY ./src /app/
COPY ./server.js /app/

EXPOSE 3000

CMD [ "node", "start" ]