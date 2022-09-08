CREATE DATABASE catalog_of_my_things;

CREATE TABLE item (
  id integer GENERATED ALWAYS AS IDENTITY,
  title varchar(100) NOT NULL,
  genre_id integer NOT NULL,
  author_id integer NOT NULL,
  source_id integer NOT NULL,
  label_id integer NOT NULL,
  publish_date date NOT NULL,
  archived boolean,
  PRIMARY KEY(id),
   CONSTRAINT fk_source
      FOREIGN KEY(source_id) 
	  REFERENCES source(id)
);

CREATE INDEX ON item (source_id);

CREATE TABLE movie (
  id integer GENERATED ALWAYS AS IDENTITY,
  silent boolean NOT NULL,
  item_id integer NOT NULL,
  PRIMARY KEY(id),
   CONSTRAINT fk_item
      FOREIGN KEY(item_id) 
	  REFERENCES item(id)
);

CREATE INDEX ON movie (item_id);

CREATE TABLE source (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(100) NOT NULL
);
