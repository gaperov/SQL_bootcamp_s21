-- SESSION #1
BEGIN isolation level read committed;
show transaction isolation level;

-- SESSION #2
BEGIN isolation level read committed;
show transaction isolation level;

-- SESSION #1
update pizzeria
set rating = 1 where id = 1;

-- SESSION #2
update pizzeria
set rating = 1 where id = 2;

-- SESSION #1
update pizzeria
set rating = 2 where id = 2;

-- SESSION #2
update pizzeria
set rating = 2 where id = 1;

-- SESSION #1
commit;

-- SESSION #2
commit;