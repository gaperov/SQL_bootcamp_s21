-- SESSION #1
begin;

UPDATE pizzeria
SET rating = 5
where name = 'Pizza Hut';

SELECT * from pizzeria;

-- SESSION #2
select * from pizzeria;

-- SESSION #1
commit;

-- SESSION #2
select * from pizzeria;
