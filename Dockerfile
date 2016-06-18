#

FROM postgres:9.5
ENV LANG en_US.utf8

MAINTAINER Israel Zúñiga de la Mora <docker@israelzuniga.com>

ADD dvdrental.tar /docker-entrypoint-initdb.d/dvdrental.tar
ADD remote_connections_setup.sh /docker-entrypoint-initdb.d/remote_connections_setup.sh
RUN chmod 755 /docker-entrypoint-initdb.d/remote_connections_setup.sh
ADD init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
RUN chmod 755 /docker-entrypoint-initdb.d/init-user-db.sh



EXPOSE 32768
