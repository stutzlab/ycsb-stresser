FROM maven:3.6.3-openjdk-15

WORKDIR /app
RUN curl -LJO https://github.com/brianfrankcooper/YCSB/releases/download/0.17.0/ycsb-0.17.0.tar.gz
RUN tar xfvz ycsb-0.17.0.tar.gz
RUN rm ycsb-0.17.0.tar.gz
WORKDIR /app/ycsb-0.17.0

ENV MONGO_URL ''

ENV RECORD_COUNT '10000'
ENV OPERATION_COUNT '1000'
ENV LOAD_THREADS '10'
ENV RUN_THREADS '4'
ENV WORKLOAD_TYPE 'a'

ADD /startup.sh /

CMD [ "/startup.sh" ]

