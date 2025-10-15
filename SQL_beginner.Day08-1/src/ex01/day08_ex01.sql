-- SESSION #1
BEGIN;
SELECT * from pizzeria where name = 'Pizza Hut';

-- SESSION #2
BEGIN;
SELECT * from pizzeria where name = 'Pizza Hut';

-- SESSION #1
UPDATE pizzeria set rating = 4 WHERE name = 'Pizza Hut';

-- SESSION #2
UPDATE pizzeria set rating = 3.6 WHERE name = 'Pizza Hut';

-- SESSION #1
COMMIT;

-- SESSION #2
COMMIT;

-- SESSION #1
SELECT * from pizzeria where name = 'Pizza Hut';

-- SESSION #2
SELECT * from pizzeria where name = 'Pizza Hut';
