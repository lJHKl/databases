alter table Movie add constraint movie_pkey primary key (mID); --1

alter table Movie add constraint movie_unique1 unique (title, year); --2

alter table Reviewer add constraint reviewer_pkey primary key (rID); --3

alter table Rating add constraint rating_unique1 unique (rID, mID, ratingDate); --4

alter table Reviewer alter column name set not null; --5

alter table Rating alter column stars set not null; --6

alter table Movie add constraint movie_checker1 check (year >= 1900); --7

alter table Rating add constraint rating_checker1 check (stars between 1 and 5); --8

alter table Rating add constraint rating_checker2 check (ratingDate >= TO_DATE('2000-01-01', 'yyyy-mm-dd')); --9

alter table Movie add constraint movie_checker2 check ((director = 'Steven Spielberg' and year < 1990) or (director = 'James Cameron' and year >= 1990) or (director not in ('Steven Spielberg', 'James Cameron'))); --10

/*checking errors, constraint enforcement // task 2-3 errors*/

alter table Rating add constraint rating_fkey1 foreign key (rID) references Reviewer on update cascade on delete set null; --task4 / 26

alter table Rating add constraint rating_fkey2 foreign key (mID) references Movie on delete cascade; --task4 / 26

select conname, contype, consrc from pg_constraint;

select * from Movie;
