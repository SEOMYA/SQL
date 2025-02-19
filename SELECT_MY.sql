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