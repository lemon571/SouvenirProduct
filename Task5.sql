SELECT 
	   sp.Id AS ProcurementId,
	   sp.Data,
	   ps.Name AS Status,
	   s.Name AS SouvenirName
FROM SouvenirProcurements sp
JOIN ProcurementStatuses ps ON sp.IdStatus = ps.Id
JOIN ProcurementSouvenirs psn ON sp.Id = psn.IdProcurement
JOIN Souvenirs s ON psn.IdSouvenir = s.Id
WHERE sp.data BETWEEN '2023-01-01' AND '2024-09-01'