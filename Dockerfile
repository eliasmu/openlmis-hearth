FROM jembi/hearth

WORKDIR /


COPY package.json /package.json
RUN npm install

COPY consul /consul
COPY config /src/hearth/config
COPY run.sh /run.sh

EXPOSE 3447

CMD ["/run.sh"]