create database universe;

\c universe

#add tables named galaxy, star, planet, and moon
create table galaxy();
create table star();
create table planet ();
create table moon ();

#each table should have a primary key that automatically increments
alter table galaxy add column galaxy_id serial primary key;
alter table star add column star_id serial primary key;
alter table planet add column planet_id serial primary key;
alter table moon add column moon_id primary key;

#each table should have a name column with a varchar datatype
alter table galaxy add column name varchar not null unique;
alter table star add column name varchar not null unique;
alter table planet add column name varchar not null unique;
alter table moon add column name varchar not null unique;

alter table galaxy add column size_in_km int;
alter table star add column size_in_km int;
alter table planet add column size_in_km int;
alter table moon add column size_in_km int;

alter table galaxy add column distance_from_earth numeric (6, 2);
alter table star add column distance_from_earth numeric (6, 2);
alter table planet add column distance_from_earth numeric (6, 2);
alter table moon add column distance_from_earth numeric (6, 2);

alter table galaxy add column has_life boolean;
alter table star add column has_life boolean;
alter table planet add column has_life boolean;
alter table moon add column has_life boolean;

alter table galaxy add column gaseous boolean;
alter table star add column gaseous boolean;
alter table planet add column gaseous boolean;
alter table moon add column gaseous boolean;

alter table galaxy add column solar_system text;
alter table star add column solar_system text;
alter table planet add column solar_system text;
alter table moon add column solar_system text;

#foreign key creation
alter table star add column galaxy_id int not null;
alter table planet add column star_id int not null;
alter table moon add column planet_id int not null;

alter table star add foreign key (galaxy_id) references galaxy(galaxy_id);
alter table planet add foreign key (star_id) references star(star_id);
alter table moon add foreign key (planet_id) references planet(planet_id);

create table planetary_bodies (
	planetary bodies_id serial primary key,
	galaxy_id int references galaxy(galaxy_id),
	star_id int references star(star_id),
	planet_id int references planet(planet_id),
	moon_id int references moon(moon_id)
);


insert into galaxy(name, size_in_km, distance_from_earth, has_life, gaseous, solar system) values ('Milky Way', 1000, 10000, True, False, 'Yes'), ('Andromeda', 2000, 20000, False, True, 'None'), ('Triangulam', 3000, 30000, False, True, 'None'), ('Whirlpool', 4000, 40000, False, False, 'None'), ('Sombrero', 5000, 50000, False, False, 'None'), ('Black Eye', 6000, 60000, False, False, 'None');
insert into star(name, size_in_km, distance_from_earth, has_life, gaseous, solar system, galaxy_id) values ('Sun', 1500, 15000, False, True, 'Yes', 1), ('Sirius', 2500, 25000, False, True, 'None', 3), ('Alpha Centauri', 3500, 35000, False, True, 'None', 2), ('Betelgeuse', 4500, 45000, False, False, 'None', 6), ('Proxima Centauri', 5500, 55000, False, True, 'None', 4), ('Kepler', 6500, 65000, False, True, 'None', 5);
insert into planet(name, size_in_km, distance_from_earth, has_life, gaseous, solar system, star_id) values ('Venus', 10500, 105000, False, False, 'Yes', 1), ('Mercury', 20500, 205000, False, False, 'Yes', 1), ('Earth', 30500, 305000, True, False, 'Yes', 1), ('Mars', 40500, 405000, False, False, 'Yes', 1), ('Jupiter', 50500, 505000, False, True, 'Yes', 1), ('Saturn', 60500, 605000, False, True, 'None', 1), ('Uranus', 70500, 705000, False, False, 'Yes', 1), ('Neptune', 80500, 80500, False, False, 'Yes', 1), ('Proxima-b', 90500, 905000, False, False, 'Yes', 3), ('Kepler-22b', 10500, 105000, False, False, 'Yes', 6), ('Gliese', 11500, 115000, False, False, 'Yes', 4), ('Wasp', 94500, 945000, False, True, 'Yes', 4);
insert into moon(name, size_in_km, distance_from_earth, has_life, gaseous, solar system, planet_id) values ('Moon', 12500, 125000, False, False, 'Yes', 3), ('Cian', 22500, 225000, False, False, 'Yes', 1), ('Ean', 32500, 325000, False, False, 'Yes', 2), ('Tripol', 42500, 425000, False, False, 'Yes', 4), ('Zool', 52500, 525000, False, False, 'Yes', 6), ('Kul', 62500, 625000, False, False, 'Yes', 4), ('Til', 72500, 725000, False, False, 'Yes', 4), ('Nil', 82500, 82500, False, False, 'Yes', 5), ('Proxima, 92500, 925000, False, False, 'Yes', 3), ('Kepler', 12500, 125000, False, False, 'Yes', 7), ('Triol', 1250, 12500, False, False, 'Yes', 6), ('Centauri', 9500, 95000, False, False, 'Yes', 4), ('Betel', 10500, 105000, False, False, 'Yes', 7), ('Geuse', 1350, 13500, False, False, 'Yes', 8), ('Kasp', 1450, 14500, False, False, 'Yes', 6), ('Gelt', 1550, 15500, False, False, 'Yes', 5), ('Kelt', 1650, 16500, False, False, 'Yes', 6), ('Alpha', 1750, 17500, False, False, 'Yes', 9), ('Jerop', 1850, 18500, False, False, 'Yes', 7), ('Wambo', 1950, 19500, False, False, 'Yes', 10), ('Shill', 20500, 21500, False, False, 'Yes', 11);

