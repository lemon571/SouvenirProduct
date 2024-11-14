SELECT 
    b.Id AS SouvenirId, 
    b.Name AS SouvenirName, 
    c.Id AS MaterialId, 
    c.Name AS MaterialName
FROM Souvenirs b
JOIN SouvenirMaterials c ON b.IdMaterial = c.Id
WHERE c.Name = 'металл';
