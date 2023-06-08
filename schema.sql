CREATE TABLE label (
  id integer GENERATED ALWAYS AS IDENTITY,
  title varchar(100),
  color varchar(100),
  PRIMARY KEY(id)
);

CREATE TABLE genres (
  id integer GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  PRIMARY KEY(id)
);

CREATE TABLE author (
  id integer GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100),
  last_name varchar(100),
  PRIMARY KEY(id)
);

CREATE TABLE music_albums (
  id integer GENERATED ALWAYS AS IDENTITY,
  publish_date date,
  on_spotify boolean,
  archived boolean,

  genre_id integer,
  label_id integer,
  author_id integer,
  PRIMARY KEY(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE book (
  id integer GENERATED ALWAYS AS IDENTITY,
  publisher varchar(100),
  publish_date date,
  cover_state boolean,
  archived boolean,

  genre_id integer,
  label_id integer,
  author_id integer,
  PRIMARY KEY(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE game (
  id integer GENERATED ALWAYS AS IDENTITY,
  publish_date date,
  last_played_at date,
  multiplayer boolean,
  archived boolean,

  genre_id integer,
  label_id integer,
  author_id integer,
  PRIMARY KEY(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id)
);
