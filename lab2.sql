Create database lab2;
Create table countries(
  coutry_id serial primary key,
  country_name varchar(50),
  region_id int,
  population int
);
insert into countries values (default ,'Anime',1,10000);
insert into countries (coutry_id, country_name) values (default , 'NotAnime');
insert into countries (region_id) values (NULL);
insert into countries values (default, 'Country1',2,19999), (default , 'Country2',3,123123123),
                             (default, 'Country3',5,123123123 );
alter table countries alter column country_name set default 'Kazakhstan';
insert into countries (country_name) values(default);
insert into countries values(default);

create table countries_new(
  like countries
);
insert into countries_new SELECT * FROM countries;
select * from countries;
update countries set region_id=1 where region_id isnull;
update countries set population=population*1.1 returning country_name, population as "New Population";
delete from countries where population < 100000;
delete from countries_new using countries where countries.coutry_id=countries_new.coutry_id returning *;
delete from countries returning *;