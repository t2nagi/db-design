#!/bin/sh

while inotifywait -e create,delete,modify,move /work/sql ; do
    ./refresh.sh
done
