-- Table: books

DROP TABLE IF EXISTS books;

CREATE TABLE IF NOT EXISTS books
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN DEFAULT false,
    publisher TEXT,
    cover_state TEXT,
    author_id INT,
    label_id INT,
    genre_id INT,
    source_id INT
);

-- Table: authors

CREATE TABLE authors (
   id INT,
   first_name TEXT,
   last_name TEXT,
);

-- Table: games

CREATE TABLE games (
   id INT,
   multiplayer BOOLEAN DEFAULT false,
   last_played_at DATE,
   publish_date DATE,
   author_id INT,
   label_id INT,
   genre_id INT,
   source_id INT,
   CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id),
   CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES labels(id),
   CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id),
   CONSTRAINT fk_source_id FOREIGN KEY (source_id) REFERENCES sources(id)
);

-- Table: labels

DROP TABLE IF EXISTS labels;

CREATE TABLE IF NOT EXISTS labels
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT,
    color TEXT,
);

-- Table: genre

DROP TABLE IF EXISTS genre;

CREATE TABLE IF NOT EXISTS genre
(
     id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY(id)
);

-- Table: musicAlbum

DROP TABLE IF EXISTS musicalbum;

CREATE TABLE IF NOT EXISTS musicalbum
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    on_spotify BOOLEAN DEFAULT false,
    publish_date DATE,
    archived BOOLEAN DEFAULT false,
    publisher TEXT,
    cover_state TEXT,
    author_id INT,
    label_id INT,
    genre_id INT,
    source_id INT
);


-- Set _id in books table properties as foreign keys
ALTER TABLE musicalbum ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id);
ALTER TABLE musicalbum ADD CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES labels(id);
ALTER TABLE musicalbum ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id);
ALTER TABLE musicalbum ADD CONSTRAINT fk_source_id FOREIGN KEY (source_id) REFERENCES sources(id);

-- Set _id in books table properties as foreign keys
ALTER TABLE books ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id);
ALTER TABLE books ADD CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES labels(id);
ALTER TABLE books ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id);
ALTER TABLE books ADD CONSTRAINT fk_source_id FOREIGN KEY (source_id) REFERENCES sources(id);
