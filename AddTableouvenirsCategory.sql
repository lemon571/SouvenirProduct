INSERT INTO souvenirscategories (id, idparent, name)
SELECT id, 1 AS idparent, 'Категория ' || id AS name
FROM generate_series(1, 9900) AS id
ON CONFLICT (id) DO NOTHING;
