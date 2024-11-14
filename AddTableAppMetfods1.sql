INSERT INTO applicationmetods (id, name)
SELECT id, 'Метод ' || id AS name
FROM generate_series(112, 9900) AS id
ON CONFLICT (id) DO NOTHING;
