CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size from dogs as d, sizes as s
    where d.height > s.min and d.height <= s.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
   select ch.name from dogs as ch, dogs as pa, parents
    where ch.name = child AND pa.name = parent ORDER BY pa.height desc;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  select a.child as f, b.child as s from parents as a, parents as b
    where a.parent = b.parent and a.child < b.child
      ORDER BY a.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
   select f || " and " || s || " are " || d1.size || " siblings" 
            from siblings as sib, size_of_dogs as d1, size_of_dogs as d2
                   where f = d1.name and s = d2.name and d1.size= d2.size;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT d1.name || ", " || d2.name || ", " || d3.name || ", ", d1.height + d2.height + d3.height, d3.height, 3
  from dogs as d1, dogs as d2, dogs as d3
    where d1.name != d2.name and d2.name != d3.name and d1.name != d3.name 
      and d1.height < d2.height and d2.height < d3.height
        ORDER BY d1.height;


CREATE TABLE stacks AS
  select helper.dogs || d.name, helper.stack_height + d.height
    from stacks_helper as helper, dogs as d
      where helper.last_height < d.height and helper.stack_height + d.height > 170;

