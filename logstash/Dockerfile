FROM docker.elastic.co/logstash/logstash:6.8.2

RUN rm -rf /usr/share/logstash/pipeline
COPY pipelines.yml /usr/share/logstash/config/pipelines.yml
COPY pipeline /usr/share/logstash/pipeline
COPY pipeline2 /usr/share/logstash/pipeline2
COPY pipeline3 /usr/share/logstash/pipeline3
COPY postgresql-jdbc.jar /usr/share/java/postgresql-jdbc.jar