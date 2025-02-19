-- Заполнение таблицы genres
INSERT INTO genres (genre_name) VALUES
('Рок'),
('Поп'),
('Электроника');

-- Заполнение таблицы artists
INSERT INTO artists (artist_name) VALUES
('Кино'),
('Земфира'),
('Мумий Тролль'),
('Аквариум');

-- Заполнение таблицы artist_genres
INSERT INTO artist_genres (artist_id, genre_id) VALUES
((SELECT artist_id FROM artists WHERE artist_name = 'Кино'), (SELECT genre_id FROM genres WHERE genre_name = 'Рок')),
((SELECT artist_id FROM artists WHERE artist_name = 'Земфира'), (SELECT genre_id FROM genres WHERE genre_name = 'Рок')),
((SELECT artist_id FROM artists WHERE artist_name = 'Земфира'), (SELECT genre_id FROM genres WHERE genre_name = 'Поп')),
((SELECT artist_id FROM artists WHERE artist_name = 'Мумий Тролль'), (SELECT genre_id FROM genres WHERE genre_name = 'Рок')),
((SELECT artist_id FROM artists WHERE artist_name = 'Мумий Тролль'), (SELECT genre_id FROM genres WHERE genre_name = 'Поп')),
((SELECT artist_id FROM artists WHERE artist_name = 'Аквариум'), (SELECT genre_id FROM genres WHERE genre_name = 'Рок'));

-- Заполнение таблицы albums
INSERT INTO albums (album_title, release_year) VALUES
('Группа крови', 1988),
('Прости меня моя любовь', 2000),
('Морская', 1997),
('Радио Африка', 1983);

-- Заполнение таблицы album_artists
INSERT INTO album_artists (album_id, artist_id) VALUES
((SELECT album_id FROM albums WHERE album_title = 'Группа крови'), (SELECT artist_id FROM artists WHERE artist_name = 'Кино')),
((SELECT album_id FROM albums WHERE album_title = 'Прости меня моя любовь'), (SELECT artist_id FROM artists WHERE artist_name = 'Земфира')),
((SELECT album_id FROM albums WHERE album_title = 'Морская'), (SELECT artist_id FROM artists WHERE artist_name = 'Мумий Тролль')),
((SELECT album_id FROM albums WHERE album_title = 'Радио Африка'), (SELECT artist_id FROM artists WHERE artist_name = 'Аквариум'));

-- Заполнение таблицы tracks
INSERT INTO tracks (album_id, track_title, duration) VALUES
((SELECT album_id FROM albums WHERE album_title = 'Группа крови'), 'Группа крови', 285),
((SELECT album_id FROM albums WHERE album_title = 'Прости меня моя любовь'), 'Искала', 245),
((SELECT album_id FROM albums WHERE album_title = 'Морская'), 'Утекай', 180),
((SELECT album_id FROM albums WHERE album_title = 'Радио Африка'), 'Рок-н-ролл мертв', 210),
((SELECT album_id FROM albums WHERE album_title = 'Группа крови'), 'Война', 240),
((SELECT album_id FROM albums WHERE album_title = 'Морская'), 'Дельфины', 220);

-- Заполнение таблицы compilations
INSERT INTO compilations (compilation_title, release_year) VALUES
('Лучшее русского рока', 2005),
('Хиты 90-х', 1999),
('Русская волна', 2010),
('Легенды русского рока', 2015);

-- Заполнение таблицы compilation_tracks
INSERT INTO compilation_tracks (compilation_id, track_id, track_order) VALUES
((SELECT compilation_id FROM compilations WHERE compilation_title = 'Лучшее русского рока'), (SELECT track_id FROM tracks WHERE track_title = 'Группа крови'), 1),
((SELECT compilation_id FROM compilations WHERE compilation_title = 'Хиты 90-х'), (SELECT track_id FROM tracks WHERE track_title = 'Искала'), 2),
((SELECT compilation_id FROM compilations WHERE compilation_title = 'Русская волна'), (SELECT track_id FROM tracks WHERE track_title = 'Утекай'), 1),
((SELECT compilation_id FROM compilations WHERE compilation_title = 'Легенды русского рока'), (SELECT track_id FROM tracks WHERE track_title = 'Рок-н-ролл мертв'), 3),
((SELECT compilation_id FROM compilations WHERE compilation_title = 'Лучшее русского рока'), (SELECT track_id FROM tracks WHERE track_title = 'Война'), 2),
((SELECT compilation_id FROM compilations WHERE compilation_title = 'Русская волна'), (SELECT track_id FROM tracks WHERE track_title = 'Дельфины'), 2);