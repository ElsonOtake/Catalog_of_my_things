CREATE TABLE item (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id integer REFERENCES genres(id),
    label_id integer REFERENCES label(id),
    author_id integer REFERENCES author(id),
    publish_date date,
    archived boolean
);

CREATE TABLE label(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE book(
  id integer REFERENCES item(id),
  title VARCHAR(100),
  publish_date DATE,
  publisher VARCHAR(100),
  cover_state VARCHAR(10),
  label_id INT
);