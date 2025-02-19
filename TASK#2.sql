-- 1. Название и продолжительность самого длительного трека.
SELECT track_title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд).
SELECT track_title
FROM tracks
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
-- Поскольку у нас нет сборников в этом диапазоне, я добавлю один, а потом сделаю запрос
INSERT INTO compilations (compilation_title, release_year) VALUES ('Свежие хиты 2019', 2019);

SELECT compilation_title
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT artist_name
FROM artists
WHERE artist_name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my».
-- Так как в таблицах нет таких треков, добавлять не будем и выведем пустой запрос
-- Изменил форму поиска мой или my
SELECT track_title
FROM tracks
WHERE
    track_title ILIKE 'my' 
    OR track_title ILIKE 'my %' 
    OR track_title ILIKE '% my'  
    OR track_title ILIKE '% my %'
    OR track_title ILIKE 'мой'
    OR track_title ILIKE 'мой %'
    OR track_title ILIKE '% мой'
    OR track_title ILIKE '% мой %';

-- если дополнительно то так
-- SELECT track_title
-- FROM tracks
-- WHERE string_to_array(lower(track_title), ' ') && ARRAY['my', 'мой'];

-- или так
-- SELECT track_title
-- FROM tracks
-- WHERE track_title ~* '(^|\s)мой(\s|$)' OR track_title ~* '(^|\s)my(\s|$)';