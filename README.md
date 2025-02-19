CREATE TABLE IF NOT EXISTS genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genres (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE IF NOT EXISTS albums (
    album_id SERIAL PRIMARY KEY,
    album_title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS album_artists (
    album_id INT,
    artist_id INT,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS tracks (
    track_id SERIAL PRIMARY KEY,
    album_id INT NOT NULL,
    track_title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS compilations (
    compilation_id SERIAL PRIMARY KEY,
    compilation_title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS compilation_tracks (
    compilation_id INT,
    track_id INT,
    track_order INT NOT NULL,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES compilations(compilation_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);
