CREATE TABLE music_albums (
  id integer GENERATED ALWAYS AS IDENTITY,
  publish_date date,
  on_spotify boolean,
  archived boolean
);
