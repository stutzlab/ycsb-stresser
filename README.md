# ycsb-stresser

Docker container for YCSB database stresser. Works for generating loads on Mongodb, ES, Cassandra, Redis, JDBC, ES... see https://github.com/brianfrankcooper/YCSB for more info.

## Usage

* Create docker-compose.yml

```yml
version: '3.5'
services:

  ycsb-stresser:
    image: stutzlab/ycsb-stresser
    environment:
      - MONGO_URL=mongodb://mongo:27017/test?w=0
      - WORKLOAD_TYPE=a

  mongo:
    image: mongo:latest
    environment:
      - MONGO_INITDB_DATABASE=test
    ports:
      - "27017:27017"
```

* Run ```docker-compose up```

## ENVs

* MONGO_URL - mongodb connection url. ex.: mongodb://mymongo:27017/test?w=0. required.

* WORKLOAD_TYPE - type of workload to simulate. defaults to 'a'. see more at https://github.com/brianfrankcooper/YCSB/blob/master/workloads

  * 'a': Update heavy workload

  * 'b': Read mostly workload

  * 'c': Read only

  * 'd': Read latest workload

  * 'e': Short ranges

  * 'f': Read-modify-write workload

* RECORD_COUNT - number of records loaded. defaults to '10000'
* OPERATION_COUNT - number of operations run. defaults to '1000'
* LOAD_THREADS - number of threads during load phase. defaults to '10'
* RUN_THREADS - number of threads during run operations phase. defaults to '4'

