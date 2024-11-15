/*
   12 октября 2024 г.18:55:42
   User: 
   Server: LAPTOP-NEH8H70R
   Database: Sovenirs
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Souvenirs
	DROP CONSTRAINT FK_Souvenirs_ApplicationMethods
GO
ALTER TABLE dbo.ApplicationMethods SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ApplicationMethods', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ApplicationMethods', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ApplicationMethods', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Souvenirs
	DROP CONSTRAINT FK_Souvenirs_SouvenirMaterials
GO
ALTER TABLE dbo.SouvenirMaterials SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.SouvenirMaterials', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirMaterials', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirMaterials', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Souvenirs
	DROP CONSTRAINT FK_Souvenirs_Color
GO
ALTER TABLE dbo.Color SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Color', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Color', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Color', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Souvenirs
	DROP CONSTRAINT FK_Souvenirs_SouvenirsCategories
GO
ALTER TABLE dbo.SouvenirsCategories SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.SouvenirsCategories', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirsCategories', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirsCategories', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Souvenirs
	(
	ID int NOT NULL,
	URL varchar(MAX) NOT NULL,
	ShortName varchar(150) NOT NULL,
	Name varchar(500) NOT NULL,
	Description varchar(2500) NULL,
	Rating smallint NOT NULL,
	IdCategory int NOT NULL,
	IdColor int NOT NULL,
	Size varchar(150) NOT NULL,
	IdMaterial int NOT NULL,
	Weight varchar(500) NULL,
	QTypics varchar(10) NULL,
	PicsSize varchar(20) NULL,
	IdApplicationMetod int NOT NULL,
	AllCategories varchar(150) NOT NULL,
	DealerPrice varchar(500) NOT NULL,
	Price varchar(500) NOT NULL,
	Comments varchar(1000) NULL,
	NumberID int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Souvenirs SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Souvenirs)
	 EXEC('INSERT INTO dbo.Tmp_Souvenirs (ID, URL, ShortName, Name, Description, Rating, IdCategory, IdColor, Size, IdMaterial, Weight, QTypics, PicsSize, IdApplicationMetod, AllCategories, DealerPrice, Price, Comments, NumberID)
		SELECT ID, URL, ShortName, Name, Description, Rating, IdCategory, IdColor, Size, IdMaterial, Weight, QTypics, PicsSize, IdApplicationMetod, AllCategories, DealerPrice, Price, Comments, NumberID FROM dbo.Souvenirs WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.ProcurementSouvenirs
	DROP CONSTRAINT FK_ProcurementSouvenirs_Souvenirs
GO
ALTER TABLE dbo.SouvenirStores
	DROP CONSTRAINT FK_SouvenirStores_Souvenirs
GO
DROP TABLE dbo.Souvenirs
GO
EXECUTE sp_rename N'dbo.Tmp_Souvenirs', N'Souvenirs', 'OBJECT' 
GO
ALTER TABLE dbo.Souvenirs ADD CONSTRAINT
	PK_Souvenirs PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Souvenirs ADD CONSTRAINT
	FK_Souvenirs_SouvenirsCategories FOREIGN KEY
	(
	IdCategory
	) REFERENCES dbo.SouvenirsCategories
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Souvenirs ADD CONSTRAINT
	FK_Souvenirs_Color FOREIGN KEY
	(
	IdColor
	) REFERENCES dbo.Color
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Souvenirs ADD CONSTRAINT
	FK_Souvenirs_SouvenirMaterials FOREIGN KEY
	(
	IdMaterial
	) REFERENCES dbo.SouvenirMaterials
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Souvenirs ADD CONSTRAINT
	FK_Souvenirs_ApplicationMethods FOREIGN KEY
	(
	IdApplicationMetod
	) REFERENCES dbo.ApplicationMethods
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Souvenirs', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Souvenirs', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Souvenirs', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.SouvenirStores ADD CONSTRAINT
	FK_SouvenirStores_Souvenirs FOREIGN KEY
	(
	IdSouvenir
	) REFERENCES dbo.Souvenirs
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.SouvenirStores SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.SouvenirStores', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirStores', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirStores', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProcurementSouvenirs ADD CONSTRAINT
	FK_ProcurementSouvenirs_Souvenirs FOREIGN KEY
	(
	IdSouvenir
	) REFERENCES dbo.Souvenirs
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProcurementSouvenirs SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProcurementSouvenirs', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProcurementSouvenirs', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProcurementSouvenirs', 'Object', 'CONTROL') as Contr_Per 