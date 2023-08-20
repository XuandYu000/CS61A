.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet from students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song from students WHERE color = "blue" AND pet = "dog";


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color from students as a, students as b WHERE a.pet = b.pet and a.song = b.song and a.time < b.time;


CREATE TABLE sevens AS
  select s.seven from students as s, numbers as n where s.number = 7 and n.'7' = "True" and s.time = n.time;


CREATE TABLE favpets AS
  select pet, count(*) from students GROUP BY pet ORDER BY count(*) DESC LIMIT 10;


CREATE TABLE dog AS
  select * from favpets as f where f.pet = 'dog';


CREATE TABLE bluedog_agg AS
  select b.song, count(*) as cnt from bluedog_songs as b GROUP BY b.song ORDER BY cnt DESC;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, COUNT(*) FROM students WHERE seven='7' GROUP BY instructor;

