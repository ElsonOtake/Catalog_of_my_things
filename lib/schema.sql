CREATE DATABASE catalog_of_my_things;

CREATE TABLE item (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title varchar(100) NOT NULL,
  genre_id integer NOT NULL,
  author_id integer NOT NULL,
  source_id integer NOT NULL,
  label_id integer NOT NULL,
  publish_date date NOT NULL,
  archived boolean
);

CREATE INDEX ON item (genre_id);

CREATE INDEX ON item (author_id);

CREATE INDEX ON item (source_id);

CREATE INDEX ON item (label_id);

CREATE TABLE movie (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  silent boolean NOT NULL,
  item_id integer NOT NULL
);

CREATE INDEX ON movie (item_id);

CREATE TABLE source (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(100) NOT NULL
);