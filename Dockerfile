#

FROM postgres:9.5
ENV LANG en_US.utf8

MANTAINER Israel Zúñiga de la Mora <docker@israelzuniga.com>

ADD remote_connections_setup.sh /docker-entrypoint-initdb.d/remote_connections_setup.sh
RUN chmod 755 /docker-entrypoint-initdb.d/remote_connections_setup.sh
ADD init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
RUN init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
ADD dvdrental.tar
ADD setup_database.sh /docker-entrypoint-initdb.d/setup_database.sh
RUN /docker-entrypoint-initdb.d/setup_database.sh
