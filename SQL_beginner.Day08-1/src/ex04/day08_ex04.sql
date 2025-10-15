-- SESSION #1
BEGIN isolation level serializable;

-- SESSION #2
BEGIN isolation level serializable;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- SESSION #2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

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