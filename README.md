# このリポジトリについて
postgresのデータをlogstashを用いてelastcsearchに流しこむところを勉強するためのsandboxリポジトリ

# 利用方法
```
docker-compose build
docker-compose up
# 完全に環境を消去したい場合
docker-compose rm
```

# 解説
## postgresフォルダについて
```
FROM postgres

COPY init.sh /docker-entrypoint-initdb.d/init.sh
```
postgres image/docker-entrypoint-initdb.dにシェルスクリプトを配置してあげることで、  
起動時にそのシェルスクリプトを実行してくれる性質を持っている。  
なので、init.sh内のcreateテーブル文を実行するために、Dockerfileを作成し管理している。

## logstashフォルダについて
```
FROM docker.elastic.co/logstash/logstash:6.8.2

RUN rm -rf /usr/share/logstash/pipeline
COPY pipelines.yml /usr/share/logstash/config/pipelines.yml
COPY pipeline /usr/share/logstash/pipeline
COPY pipeline2 /usr/share/logstash/pipeline2
COPY pipeline3 /usr/share/logstash/pipeline3
COPY postgresql-jdbc.jar /usr/share/java/postgresql-jdbc.jar
```
複数のpipelineを管理する場合、pipelines.ymlに定義しないといけない。  
pipelineが増える場合はpipelines.ymlを変更し、docker-compose buildを行えば設定を反映可能。  
その他のpipeline、pipeline2、pipeline3は実行するpipelineファイルである。(pipelineでいろいろ)  
logstashでpostgresにアクセスする場合、postgresのjdbcドライバが必要であるため、postgresql-jdbc.jarを配置している。

## docker-compose.ymlについて
docker-compose.ymlにはpostgres、elastcisearch、kibana、logstashを管理している。  
kibanaで実行内容を確認する場合、docker-compose upで起動後http://localhost:5601にアクセスすれば、  
kibanaでelasticsearchに格納されている内容等々を確認可能。  

## その他について
### databaseへのアクセス
```
docker-compose exec db bash
psql -U user -d database
```
でpostgres上に作成しているdatabaseにアクセス可能。  
起動後に上記コマンドでアクセスし、データの更新等を行うことで、どのような挙動になるか確認してみるのも良いと思う。  
