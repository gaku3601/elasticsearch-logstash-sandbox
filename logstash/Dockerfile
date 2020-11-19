FROM docker.elastic.co/logstash/logstash:6.8.2

RUN rm -rf /usr/share/logstash/pipeline
COPY pipeline /usr/share/logstash/pipeline
COPY postgresql-jdbc.jar /usr/share/java/postgresql-jdbc.jar