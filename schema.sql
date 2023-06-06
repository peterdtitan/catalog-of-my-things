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
