#!/bin/sh

if [ "$MONGO_URL" == "" ]; then
    echo "MONGO_URL is required"
    exit 1
fi 

if [ "$MONGO_URL" != "" ]; then
    DB_TYPE="mongodb"
    DB_URL="-p mongodb.url=$MONGO_URL"
fi

echo "Starting YCSB load..."

echo "LOAD records..."
bin/ycsb load $DB_TYPE -s -P workloads/workload$WORKLOAD_TYPE -p recordcount=$RECORD_COUNT -threads $LOAD_THREADS $DB_URL

echo "RUN operations..."
bin/ycsb run $DB_TYPE -s -P workloads/workload$WORKLOAD_TYPE -p operationcount=$OPERATION_COUNT -threads $RUN_THREADS $DB_URL

