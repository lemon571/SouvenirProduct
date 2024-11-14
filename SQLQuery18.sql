/****** Script for SelectTopNRows command from SSMS  ******/
INSERT INTO(ID,
		URL
      ,ShortName
      ,Name
      ,Description
      ,Rating
      ,IdCategory
      ,IdColor
      ,Size
      ,IdMaterial
      ,Weight
      ,QTypics
      ,PicsSize
      ,IdApplicationMetod
      ,AllCategories
      ,DealerPrice
      ,Price
      ,Comments)
VALUES
	(1, 'https://www.oasiscatalog.com/item/1-000003472', 'Фонарик Lyra', 'Фонарик Lyra с карабином, синий', 
		'Компактный карманный фонарик с прочным карабином для крепления в сумке или на ремне. Алюминиевый корпус, возможно нанесение оригинальной гравировки или тампопечати. Поворотный механизм для создания направленного освещения.',
			5, 1,1, 'd1 х 6', 1, NULL, NULL, NULL, '[2891, 2892, 2930]', '101.50', '145.00',NULL);