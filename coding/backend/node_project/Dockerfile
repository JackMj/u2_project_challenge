FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY . /app
RUN npm i 

EXPOSE 3000

CMD [ "node", "start" ]