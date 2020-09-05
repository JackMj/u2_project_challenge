FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
COPY ./model /app/
COPY ./routes /app/
COPY ./keys /app/
COPY ./package.json /app/
COPY ./server.js /app/

EXPOSE 3000

CMD [ "npm", "start" ]