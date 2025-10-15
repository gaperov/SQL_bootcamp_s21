-- SESSION #1
BEGIN isolation level read committed;

-- SESSION #2
BEGIN isolation level read committed;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- SESSION #2
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';