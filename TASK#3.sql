-- 1. Количество исполнителей в каждом жанре.
SELECT g.genre_name, COUNT(ag.artist_id) AS artist_count
FROM genres g
JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов.
-- Добавим альбом 2020 года, если его нет.
INSERT INTO albums (album_title, release_year)
SELECT 'Новый альбом', 2020
WHERE NOT EXISTS (SELECT 1 FROM albums WHERE release_year = 2020);

-- Добавим трек в этот альбом
INSERT INTO tracks (album_id, track_title, duration)
SELECT (SELECT album_id FROM albums WHERE album_title = 'Новый альбом'), 'Новый трек', 200
WHERE NOT EXISTS (SELECT 1 FROM tracks t JOIN albums a ON a.album_id = t.album_id WHERE a.release_year = 2020);

SELECT COUNT(t.track_id)
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому.
SELECT a.album_title, AVG(t.duration) AS average_duration
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_title;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artist_name
FROM artists
WHERE artist_id NOT IN (
    SELECT aa.artist_id
    FROM album_artists aa
    JOIN albums a ON aa.album_id = a.album_id
    WHERE a.release_year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберем 'Кино').
SELECT DISTINCT c.compilation_title
FROM compilations c
JOIN compilation_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN album_artists aa ON t.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Кино';