/*
   Monday, January 14, 201310:55:46 PM
   User: 
   Server: BRYANPHAM-PC\SQLEXPRESS
   Database: BaoHienCompany
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
ALTER TABLE dbo.MeasurementUnit SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.MeasurementUnit', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.MeasurementUnit', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.MeasurementUnit', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProductionRequestDetail
	DROP CONSTRAINT FK_ProductionRequestDetail_ProductionRequest
GO
ALTER TABLE dbo.ProductionRequest SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProductionRequest', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProductionRequest', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProductionRequest', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProductionRequestDetail
	DROP CONSTRAINT FK_ProductionRequestDetail_Product
GO
ALTER TABLE dbo.Product SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Product', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Product', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Product', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProductionRequestDetail
	DROP CONSTRAINT FK_ProductionRequestDetail_BaseAttribute
GO
ALTER TABLE dbo.BaseAttribute SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.BaseAttribute', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.BaseAttribute', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.BaseAttribute', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProductionRequestDetail
	DROP CONSTRAINT DF_ProductionRequestDetail_Direction
GO
CREATE TABLE dbo.Tmp_ProductionRequestDetail
	(
	Id int NOT NULL IDENTITY (1, 1),
	ProductionRequestId int NOT NULL,
	ProductId int NOT NULL,
	AttributeId int NOT NULL,
	UnitId int NOT NULL,
	NumberUnit int NOT NULL,
	Note nvarchar(250) NULL,
	Direction bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ProductionRequestDetail SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_ProductionRequestDetail ADD CONSTRAINT
	DF_ProductionRequestDetail_Direction DEFAULT ((0)) FOR Direction
GO
SET IDENTITY_INSERT dbo.Tmp_ProductionRequestDetail ON
GO
IF EXISTS(SELECT * FROM dbo.ProductionRequestDetail)
	 EXEC('INSERT INTO dbo.Tmp_ProductionRequestDetail (Id, ProductionRequestId, ProductId, AttributeId, NumberUnit, Note, Direction)
		SELECT Id, ProductionRequestId, ProductId, AttributeId, NumberUnit, Note, Direction FROM dbo.ProductionRequestDetail WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ProductionRequestDetail OFF
GO
DROP TABLE dbo.ProductionRequestDetail
GO
EXECUTE sp_rename N'dbo.Tmp_ProductionRequestDetail', N'ProductionRequestDetail', 'OBJECT' 
GO
ALTER TABLE dbo.ProductionRequestDetail ADD CONSTRAINT
	PK_ProductionRequestDetail_1 PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProductionRequestDetail ADD CONSTRAINT
	FK_ProductionRequestDetail_BaseAttribute FOREIGN KEY
	(
	AttributeId
	) REFERENCES dbo.BaseAttribute
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProductionRequestDetail ADD CONSTRAINT
	FK_ProductionRequestDetail_Product FOREIGN KEY
	(
	ProductId
	) REFERENCES dbo.Product
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProductionRequestDetail ADD CONSTRAINT
	FK_ProductionRequestDetail_ProductionRequest FOREIGN KEY
	(
	ProductionRequestId
	) REFERENCES dbo.ProductionRequest
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProductionRequestDetail ADD CONSTRAINT
	FK_ProductionRequestDetail_MeasurementUnit FOREIGN KEY
	(
	UnitId
	) REFERENCES dbo.MeasurementUnit
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ProductionRequestDetail', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ProductionRequestDetail', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ProductionRequestDetail', 'Object', 'CONTROL') as Contr_Per 