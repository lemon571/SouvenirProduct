/*
   28 сентября 2024 г.16:56:21
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
CREATE TABLE dbo.ApplicationMethods
	(
	ID int NOT NULL,
	Name varchar(200) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ApplicationMethods ADD CONSTRAINT
	PK_ApplicationMethods PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ApplicationMethods SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ApplicationMethods', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ApplicationMethods', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ApplicationMethods', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.SouvenirMaterials
	(
	ID int NOT NULL,
	Name varchar(200) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.SouvenirMaterials ADD CONSTRAINT
	PK_SouvenirMaterials PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SouvenirMaterials SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.SouvenirMaterials', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirMaterials', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirMaterials', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Color
	(
	ID int NOT NULL,
	Name varchar(200) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Color ADD CONSTRAINT
	PK_Color PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Color SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Color', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Color', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Color', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.SouvenirsCategories
	(
	ID int NOT NULL,
	IdParent int NULL,
	Name varchar(100) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.SouvenirsCategories ADD CONSTRAINT
	PK_SouvenirsCategories PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SouvenirsCategories SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.SouvenirsCategories', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirsCategories', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirsCategories', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Souvenirs
	(
	ID int NOT NULL,
	URL varchar(100) NOT NULL,
	ShortName varchar(150) NOT NULL,
	Name varchar(200) NOT NULL,
	Description varchar(2500) NOT NULL,
	Rating smallint NOT NULL,
	IdCategory int NOT NULL,
	IdColor int NOT NULL,
	Size varchar(150) NOT NULL,
	IdMaterial int NOT NULL,
	Weight decimal(10, 3) NULL,
	QTypics varchar(10) NULL,
	PicsSize varchar(20) NULL,
	IdApplicationMetod int NOT NULL,
	AllCategories varchar(150) NOT NULL,
	DealerPrice decimal(10, 2) NOT NULL,
	Price decimal(10, 2) NOT NULL,
	Comments varchar(1000) NULL
	)  ON [PRIMARY]
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
ALTER TABLE dbo.Souvenirs SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Souvenirs', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Souvenirs', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Souvenirs', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProcurementStatuses
	(
	ID int NOT NULL,
	Name nchar(10) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProcurementStatuses ADD CONSTRAINT
	PK_ProcurementStatuses PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProcurementStatuses SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProcurementStatuses', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProcurementStatuses', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProcurementStatuses', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Providers
	(
	ID int NOT NULL,
	Name nchar(10) NOT NULL,
	Email nchar(10) NOT NULL,
	ContactPerson nchar(10) NOT NULL,
	Comments nchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Providers ADD CONSTRAINT
	PK_Providers PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Providers SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Providers', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Providers', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Providers', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.SouvenirProcurements
	(
	ID int NOT NULL,
	IdProvider int NOT NULL,
	Data nchar(10) NOT NULL,
	IdStatus int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.SouvenirProcurements ADD CONSTRAINT
	PK_SouvenirProcurements PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SouvenirProcurements ADD CONSTRAINT
	FK_SouvenirProcurements_Providers FOREIGN KEY
	(
	IdProvider
	) REFERENCES dbo.Providers
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.SouvenirProcurements ADD CONSTRAINT
	FK_SouvenirProcurements_ProcurementStatuses FOREIGN KEY
	(
	IdStatus
	) REFERENCES dbo.ProcurementStatuses
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.SouvenirProcurements SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.SouvenirProcurements', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirProcurements', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirProcurements', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProcurementSouvenirs
	(
	ID int NOT NULL,
	IdSouvenir int NOT NULL,
	IdProcurement int NOT NULL,
	Amount nchar(10) NOT NULL,
	Price nchar(10) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProcurementSouvenirs ADD CONSTRAINT
	PK_ProcurementSouvenirs PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProcurementSouvenirs ADD CONSTRAINT
	FK_ProcurementSouvenirs_SouvenirProcurements FOREIGN KEY
	(
	IdProcurement
	) REFERENCES dbo.SouvenirProcurements
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
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
select Has_Perms_By_Name(N'dbo.ProcurementSouvenirs', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProcurementSouvenirs', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProcurementSouvenirs', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.SouvenirStores
	(
	ID int NOT NULL,
	IdProcurement int NOT NULL,
	IdSouvenir int NOT NULL,
	Amount nchar(10) NOT NULL,
	Comments nchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.SouvenirStores ADD CONSTRAINT
	PK_SouvenirStores PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SouvenirStores ADD CONSTRAINT
	FK_SouvenirStores_SouvenirProcurements FOREIGN KEY
	(
	IdProcurement
	) REFERENCES dbo.SouvenirProcurements
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
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
select Has_Perms_By_Name(N'dbo.SouvenirStores', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.SouvenirStores', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.SouvenirStores', 'Object', 'CONTROL') as Contr_Per 