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

-- Table: labels

DROP TABLE IF EXISTS labels;

CREATE TABLE IF NOT EXISTS labels
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT,
    color TEXT,
);

-- Set _id in books table properties as foreign keys
ALTER TABLE books ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id);
ALTER TABLE books ADD CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES labels(id);
ALTER TABLE books ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id);
ALTER TABLE books ADD CONSTRAINT fk_source_id FOREIGN KEY (source_id) REFERENCES sources(id);
