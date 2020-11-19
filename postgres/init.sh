set -e
psql -U user -d database << EOSQL
CREATE TABLE city(
  account_id        SERIAL PRIMARY KEY,
  account_name      VARCHAR(20),
  email             VARCHAR(100),
  password    CHAR(64)
);
INSERT INTO city(account_id,account_name,email,password) VALUES(1,'name1','email@email.com','password');
INSERT INTO city(account_id,account_name,email,password) VALUES(2,'name2','email@email.com','password');
CREATE TABLE city2(
  account_id        SERIAL PRIMARY KEY,
  account_name      VARCHAR(20),
  email             VARCHAR(100),
  password    CHAR(64)
);
INSERT INTO city2(account_id,account_name,email,password) VALUES(1,'name1','email@email.com','password');
INSERT INTO city2(account_id,account_name,email,password) VALUES(2,'name2','email@email.com','password');
EOSQL