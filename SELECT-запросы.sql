-- Название и продолжительность самого длительного трека.
select name_record, length from track
where length =(select MAX(length) from track);

-- Название треков, продолжительность которых не менее 3,5 минут.
select name_record from track
where length >3.5;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name_collection from collection
where year_bithday between 2018 and 2020;

-- Исполнители, чьё имя состоит из одного слова.
select nickname from musician
where not nickname like '%% %%';

-- Название треков, которые содержат слово «мой» или «my».
select name_record from track
where name_record ~~'%%My%%' or name_record ~~'%%Мой%%';

-- Количество исполнителей в каждом жанре.
select style_id as Жанр, count(*) as Колличество_песен from style_musician
group by style_id;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select count(*) as Треки_из_альбомов_2019_и_2020_годов from track inner join collection
on collection.id = album_id
where collection.year_bithday between 2019 and 2020;

-- Средняя продолжительность треков по каждому альбому.
select album_id, AVG(length) as Средняя_продолжительность from track
group by track.album_id;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select nickname from musician m 
join musician_album ma on m.id = ma.album_id
join album a on ma.album_id = a.id
where year_bithday != 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct name_collection from collection c 
join musician_record mr on c.id = mr.collection_id
join track t on mr.record_id = t.id
join album a on t.album_id = a.id
join musician_album ma on a.id = ma.album_id
join musician m on ma.musician_id = m.id
where nickname like 'Ария';
