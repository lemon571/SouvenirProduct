SELECT DISTINCT 
				p.Id AS ProviderId,
				p.Name AS ProviderName,
				p.Email,
				p.ContactPerson
FROM Providers p
JOIN SouvenirProcurements sp ON p.Id = sp.IdProvider
JOIN ProcurementSouvenirs ps ON sp.Id = ps.IdProcurement
JOIN Souvenirs s ON ps.IdSouvenir = s.Id
JOIN SouvenirsCategories c ON s.IdCategory = c.Id
WHERE c.Name = 'Адаптеры'
