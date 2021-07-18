FROM johnmeyerhoff/node_quickstart:latest

ARG DIR=/markdown-to-pdf/

RUN mkdir $DIR && \
    chmod 777 $DIR

WORKDIR $DIR

COPY src/*.js ./
COPY package.json ./
COPY template/ template/
COPY styles/ styles/
COPY /node_modules ./

RUN npm install
RUN fc-cache -fv && \
    chmod +x docker_entry.js && \
    ln -s $DIR/docker_entry.js /usr/local/bin/markdown-to-pdf

WORKDIR /

CMD [ "markdown-to-pdf" ]
