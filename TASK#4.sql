-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.album_title
FROM albums a
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_id IN (SELECT artist_id FROM artist_genres GROUP BY artist_id HAVING COUNT(genre_id) > 1);

-- 2. Наименования треков, которые не входят в сборники.
SELECT track_title
FROM tracks
WHERE track_id NOT IN (SELECT track_id FROM compilation_tracks);

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT ar.artist_name
FROM artists ar
JOIN album_artists aa ON ar.artist_id = aa.artist_id
JOIN albums al ON aa.album_id = al.album_id
JOIN tracks t ON al.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- 4. Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_title
FROM albums a
JOIN (SELECT album_id, COUNT(*) AS track_count FROM tracks GROUP BY album_id) AS track_counts ON a.album_id = track_counts.album_id
WHERE track_counts.track_count = (SELECT MIN(track_count) FROM (SELECT album_id, COUNT(*) AS track_count FROM tracks GROUP BY album_id) AS min_track_counts);