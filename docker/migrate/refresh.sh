#!/bin/sh

echo "Run flyway clean.\n"
flyway \
    -url="jdbc:postgresql://db:5432/${POSTGRES_DB}" \
    -user="postgres" \
    -password="${POSTGRES_PASSWORD}" \
    -cleanDisabled="false" \
    -skipDefaultCallbacks="false" \
    clean

echo "Run flyway migrate.\n"
flyway \
    -url="jdbc:postgresql://db:5432/${POSTGRES_DB}" \
    -user="postgres" \
    -password="${POSTGRES_PASSWORD}" \
    -locations="filesystem:/work/sql" \
    -validateMigrationNaming="true" \
    -defaultSchema="public" \
    migrate

if [ $? -ne 0 ]; then
    return 0;
fi

echo "Run schemaspy.\n"

rm -rf /work/html

java -jar /work/jar/schemaspy.jar \
    -t pgsql \
    -host db \
    -port 5432 \
    -db ${POSTGRES_DB} \
    -u postgres \
    -p ${POSTGRES_PASSWORD} \
    -o /work/html \
    -dp /work/jar/postgresql-${POSTGRES_DRIVER_VERSION}.jar \
    -all

echo "Updated schemaspy.\n"