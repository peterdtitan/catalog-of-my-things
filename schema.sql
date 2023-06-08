CREATE TABLE music_albums (
  id integer GENERATED ALWAYS AS IDENTITY,
  publish_date date,
  on_spotify boolean,
  archived boolean
);

CREATE TABLE genres {
  id integer GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
}

--------------- Create game table ------------------
CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT,
  label_id INT,
  publish_date DATE,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id)
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
  PRIMARY KEY(id)
);