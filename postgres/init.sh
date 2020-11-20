set -e
psql -U user -d database << EOSQL
CREATE TABLE tenant(
  tenant_id        SERIAL PRIMARY KEY,
  name             VARCHAR(100)
);
INSERT INTO tenant(name) VALUES('gakus company');
INSERT INTO tenant(name) VALUES('yamada company');
INSERT INTO tenant(name) VALUES('hanako company');
CREATE TABLE card(
  card_id        SERIAL PRIMARY KEY,
  tenant_id         INTEGER,
  title             VARCHAR(20)
);
INSERT INTO card(tenant_id, title) VALUES(1,'card1');
INSERT INTO card(tenant_id, title) VALUES(1,'card2');
INSERT INTO card(tenant_id, title) VALUES(2,'card1');
INSERT INTO card(tenant_id, title) VALUES(2,'card2');
INSERT INTO card(tenant_id, title) VALUES(3,'card1');
INSERT INTO card(tenant_id, title) VALUES(3,'card2');
CREATE TABLE profile(
  profile_id        SERIAL PRIMARY KEY,
  card_id           INTEGER,
  name              VARCHAR(100),
  age               INTEGER
);
INSERT INTO profile(card_id, name, age) VALUES(1,'gaku', 30);
INSERT INTO profile(card_id, name, age) VALUES(3,'yamada', 45);
INSERT INTO profile(card_id, name, age) VALUES(5,'hanako', 70);
EOSQL