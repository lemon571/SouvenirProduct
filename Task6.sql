CREATE VIEW ChosenCategory  AS
SELECT 
    c.Id AS CategoryId,
    c.Name AS CategoryName,
    IdParent AS ParentCategoryName
FROM SouvenirsCategories c;

SELECT * FROM ChosenCategory
    