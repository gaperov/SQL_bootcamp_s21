-- SESSION #1
BEGIN isolation level read committed;

-- SESSION #2
BEGIN isolation level read committed;

-- SESSION #1
SELECT sum(rating) FROM pizzeria;

-- SESSION #2
insert into pizzeria
values (10, 'Kazan Pizza', 5);

commit;

-- SESSION #1
SELECT sum(rating) FROM pizzeria;

commit;

-- SESSION #1
select sum(rating) from pizzeria;

-- SESSION #2
select sum(rating) from pizzeria;
