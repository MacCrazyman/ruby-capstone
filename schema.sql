CREATE DATABASE catalog;

CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(100),
  cover_state VARCHAR(100)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN,
  multiplayer VARCHAR(100),
  last_played_at VARCHAR(100)
);