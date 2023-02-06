FROM flyway/flyway:9.14.1

ARG SCHEMASPY_URL=https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar
ARG POSTGRES_DRIVER_VERSION=42.5.2

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y graphviz fontconfig inotify-tools

# schemaspy
RUN mkdir -p /work/jar
ADD ${SCHEMASPY_URL} /work/jar/schemaspy.jar

# jdbc driver
ADD http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/$POSTGRES_DRIVER_VERSION/postgresql-$POSTGRES_DRIVER_VERSION.jar /work/jar/postgresql-$POSTGRES_DRIVER_VERSION.jar

RUN ls -ln /work/*

COPY ./refresh.sh /work/refresh.sh
COPY ./watch.sh /work/watch.sh
RUN chmod +x /work/refresh.sh && chmod +x /work/watch.sh

WORKDIR /work
ENTRYPOINT [ "/work/watch.sh" ]

