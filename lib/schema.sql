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
  CONSTRAINT fk_genre
    FOREIGN KEY(genre_id) 
      REFERENCES genre(id),
  CONSTRAINT fk_author
    FOREIGN KEY(author_id) 
      REFERENCES author(id),
  CONSTRAINT fk_source
    FOREIGN KEY(source_id) 
      REFERENCES source(id),
  CONSTRAINT fk_label
    FOREIGN KEY(label_id) 
      REFERENCES label(id)
);

CREATE INDEX ON item (genre_id);

CREATE INDEX ON item (author_id);

CREATE INDEX ON item (source_id);

CREATE INDEX ON item (label_id);


CREATE TABLE movie (
  id integer GENERATED ALWAYS AS IDENTITY,
  silent boolean NOT NULL,
  item_id integer NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_movie_item
    FOREIGN KEY(item_id) 
      REFERENCES item(id)
);

CREATE INDEX ON movie (item_id);

CREATE TABLE book (
  id integer GENERATED ALWAYS AS IDENTITY,
  publisher varchar(100) NOT NULL,
  cover_state varchar(10) NOT NULL,
  item_id integer NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_book_item
    FOREIGN KEY(item_id) 
      REFERENCES item(id)
);

CREATE INDEX ON book (item_id);

CREATE TABLE music_album (
  id integer GENERATED ALWAYS AS IDENTITY,
  on_spotify boolean NOT NULL,
  item_id integer NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_music_album_item
    FOREIGN KEY(item_id) 
      REFERENCES item(id)
);

CREATE INDEX ON music_album (item_id);

CREATE TABLE game (
  id integer GENERATED ALWAYS AS IDENTITY,
  multiplayer varchar(100) NOT NULL,
  last_played_at date NOT NULL,
  item_id integer NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_game_item
    FOREIGN KEY(item_id) 
      REFERENCES item(id)
);

CREATE INDEX ON game (item_id);

CREATE TABLE genre (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(100) NOT NULL
); 

CREATE TABLE source (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(100) NOT NULL
);

CREATE TABLE label (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title varchar(100) NOT NULL,
  color varchar(100) NOT NULL
);

CREATE TABLE author (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL
);
