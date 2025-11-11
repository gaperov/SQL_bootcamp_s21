WITH last_updates AS (SELECT c1.id, c1.name, rate_to_usd, updated
FROM (SELECT id, MAX(updated) AS last_updated FROM currency GROUP BY id) c2
JOIN currency c1 ON c1.id = c2.id AND c2.last_updated = c1.updated)

SELECT COALESCE(u.name, 'not defined') AS name,
COALESCE(u.lastname, 'not defined') AS lastname,
balance.type,
SUM(balance.money) AS volume,
MAX(COALESCE(lu.name, 'not defined')) AS currency_name,
MAX(COALESCE(rate_to_usd, 1)) AS last_rate_to_usd,
(SUM(balance.money) * MAX(COALESCE(rate_to_usd, 1))) AS total_volume_in_usd
FROM balance FULL JOIN public.user u ON balance.user_id = u.id
FULL JOIN last_updates lu ON balance.currency_id = lu.id
GROUP BY u.name, u.lastname, balance.type
ORDER BY 1 DESC, 2, 3;