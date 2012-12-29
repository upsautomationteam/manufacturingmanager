/*
   Thursday, December 20, 20127:59:29 AM
   User: sa
   Server: NTKHA
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
ALTER TABLE dbo.OrderDetail ADD
	Commission float(53) NOT NULL CONSTRAINT DF_OrderDetail_Commission DEFAULT 0
GO
COMMIT
select Has_Perms_By_Name(N'dbo.OrderDetail', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.OrderDetail', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.OrderDetail', 'Object', 'CONTROL') as Contr_Per 