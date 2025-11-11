WITH bal AS (select user_id, money, type, currency_id, updated, c.id, c.name AS currency_name
from balance b inner join 
(select DISTINCT c.id, c.name from currency c) as c on c.id = b.currency_id
),
t1 as (
  select user_id, money, type, currency_name, rate_to_usd, bal.updated as bal_upd, c.updated, bal.currency_id
  from bal
  join currency c on bal.updated >= c.updated and c.id = bal.currency_id
  where c.updated = (
        select max(c.updated)
        from currency c
        where c.id = bal.currency_id and c.updated <= bal.updated)
),
t2 as (SELECT * 
FROM
((SELECT user_id, money, type, currency_name, updated as bal_upd, currency_id
from bal
ORDER BY 1)
EXCEPT 
(SELECT user_id, money, type, currency_name, bal_upd, currency_id
from t1
ORDER BY 1
)) as f
join currency c on bal_upd < c.updated and c.id = currency_id
  where c.updated = (
        select min(c.updated)
        from currency c
        where c.id = currency_id and c.updated > bal_upd)
),
tf as(
SELECT user_id, money, type, currency_name, rate_to_usd, bal_upd, updated
FROM t1 
UNION 
SELECT user_id, money, type, currency_name, rate_to_usd, bal_upd, updated
FROM t2)

SELECT 
COALESCE(u.name, 'not defined') AS name,
COALESCE(u.lastname, 'not defined') AS lastname,
currency_name,
money * rate_to_usd AS currency_in_usd
FROM tf LEFT JOIN "user" u ON u.id = tf.user_id
ORDER BY 1 DESC, 2, 3