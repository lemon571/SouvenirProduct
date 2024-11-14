SELECT 
    s.Id AS SouvenirId, 
    s.Name AS SouvenirName, 
    s.Rating, 
    c.Name AS Category
FROM Souvenirs s
JOIN SouvenirsCategories c ON s.IdCategory = c.Id
WHERE c.Name = 'Категория 3084'
ORDER BY s.Rating ASC;  
