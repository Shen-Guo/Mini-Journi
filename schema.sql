CREATE DATABASE journi_app;

CREATE TABLE users(
 id SERIAL PRIMARY KEY,
 email VARCHAR(500),
 password_digest VARCHAR(500),
 avatar TEXT
);

CREATE TABLE journeys(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  date DATE,
  title TEXT

);


CREATE Table places(
  id SERIAL PRIMARY KEY,
  location TEXT,
  lat REAL,
  lng REAL,
  description TEXT, 
  image_url TEXT,
  journey_id INTEGER,
  image TEXT
);
---psql

-- alter table users add column avatar TEXT;
-- alter table places add column image TEXT;


CREATE Table meals(
  id SERIAL PRIMARY KEY,
  description TEXT, 
  image_url TEXT,
  journey_id INTEGER,
  image TEXT
);



