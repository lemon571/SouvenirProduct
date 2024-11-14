SELECT 
    ps.IdSouvenir,
	sp.Data,
	s.Name,
    ps.Amount,
    ps.Price
FROM SouvenirProcurements sp
JOIN ProcurementSouvenirs ps ON sp.Id = ps.IdProcurement
JOIN Souvenirs s ON ps.IdSouvenir = s.Id
WHERE sp.Data BETWEEN '2023-01-01' AND '2024-09-01';
