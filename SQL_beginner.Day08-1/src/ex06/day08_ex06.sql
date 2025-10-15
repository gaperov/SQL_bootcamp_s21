-- SESSION #1
BEGIN isolation level repeatable read;
show transaction isolation level;

-- SESSION #2
BEGIN isolation level repeatable read;
show transaction isolation level;

-- SESSION #1
SELECT sum(rating) FROM pizzeria;

-- SESSION #2
insert into pizzeria
values (11, 'Kazan Pizza 2', 4);
commit;

-- SESSION #1
SELECT sum(rating) FROM pizzeria;
commit;

-- SESSION #1
select sum(rating) from pizzeria;

-- SESSION #2
select sum(rating) from pizzeria;
