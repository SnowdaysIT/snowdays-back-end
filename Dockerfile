FROM node:10.16.3-alpine

ENV DIR /snowdays-back-end

RUN mkdir $DIR
WORKDIR $DIR

COPY . $DIR

RUN /bin/sh docker_resources/docker_dev_node_install.sh

CMD npm run dev
