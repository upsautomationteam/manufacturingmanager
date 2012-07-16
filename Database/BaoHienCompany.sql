/****** Object:  ForeignKey [FK_Customer_Employee]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_Employee]
GO
/****** Object:  ForeignKey [FK_MaterialInStock_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MaterialInStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[MaterialInStock]'))
ALTER TABLE [dbo].[MaterialInStock] DROP CONSTRAINT [FK_MaterialInStock_Product]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_Order_SystemUser]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_SystemUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_SystemUser]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Order]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Product]
GO
/****** Object:  ForeignKey [FK_Price_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Price_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Price]'))
ALTER TABLE [dbo].[Price] DROP CONSTRAINT [FK_Price_Product]
GO
/****** Object:  ForeignKey [FK_Product_MeasurementUnit]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_MeasurementUnit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_MeasurementUnit]
GO
/****** Object:  ForeignKey [FK_Product_ProductType]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_ProductType]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Attribute]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAttribute_Attribute]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAttribute]'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT [FK_ProductAttribute_Attribute]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAttribute_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAttribute]'))
ALTER TABLE [dbo].[ProductAttribute] DROP CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_ProductInStock_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductInStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductInStock]'))
ALTER TABLE [dbo].[ProductInStock] DROP CONSTRAINT [FK_ProductInStock_Product]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductionRequestDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]'))
ALTER TABLE [dbo].[ProductionRequestDetail] DROP CONSTRAINT [FK_ProductionRequestDetail_Product]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_ProductionRequest]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductionRequestDetail_ProductionRequest]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]'))
ALTER TABLE [dbo].[ProductionRequestDetail] DROP CONSTRAINT [FK_ProductionRequestDetail_ProductionRequest]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Price]') AND type in (N'U'))
DROP TABLE [dbo].[Price]
GO
/****** Object:  Table [dbo].[MaterialInStock]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MaterialInStock]') AND type in (N'U'))
DROP TABLE [dbo].[MaterialInStock]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
DROP TABLE [dbo].[ProductAttribute]
GO
/****** Object:  Table [dbo].[ProductInStock]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductInStock]') AND type in (N'U'))
DROP TABLE [dbo].[ProductInStock]
GO
/****** Object:  Table [dbo].[ProductionRequestDetail]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]') AND type in (N'U'))
DROP TABLE [dbo].[ProductionRequestDetail]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[MeasurementUnit]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MeasurementUnit]') AND type in (N'U'))
DROP TABLE [dbo].[MeasurementUnit]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType]') AND type in (N'U'))
DROP TABLE [dbo].[ProductType]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
DROP TABLE [dbo].[SystemUser]
GO
/****** Object:  Table [dbo].[ProductionRequest]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductionRequest]') AND type in (N'U'))
DROP TABLE [dbo].[ProductionRequest]
GO
/****** Object:  Table [dbo].[BaseAttribute]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BaseAttribute]') AND type in (N'U'))
DROP TABLE [dbo].[BaseAttribute]
GO
/****** Object:  Default [DF_Customer_Status]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Customer_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [DF_Customer_Status]
END


End
GO
/****** Object:  Default [DF_Order_VAT]    Script Date: 07/17/2012 01:08:41 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Order_VAT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Order_VAT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [DF_Order_VAT]
END


End
GO
/****** Object:  Table [dbo].[BaseAttribute]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BaseAttribute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BaseAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AttributeCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[BaseAttribute] ON
INSERT [dbo].[BaseAttribute] ([Id], [AttributeName], [Description], [AttributeCode]) VALUES (1, N'Dài', N'Chi?u dài cho phép', N'QCD')
SET IDENTITY_INSERT [dbo].[BaseAttribute] OFF
/****** Object:  Table [dbo].[ProductionRequest]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductionRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductionRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReqCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RequestedDate] [int] NOT NULL,
	[RequestedBy] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_ProductionRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[password] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [tinyint] NULL,
	[Type] [smallint] NOT NULL,
	[FullName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[SystemUser] ON
INSERT [dbo].[SystemUser] ([Id], [username], [password], [Status], [Type], [FullName]) VALUES (1, N'bryanpham85', N'system123', NULL, 1, N'Ph?m Ð?c Hùng')
SET IDENTITY_INSERT [dbo].[SystemUser] OFF
/****** Object:  Table [dbo].[ProductType]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TypeCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON
INSERT [dbo].[ProductType] ([Id], [ProductName], [Description], [TypeCode], [Status]) VALUES (1, N'Decal', N'Something ', N'DC', NULL)
INSERT [dbo].[ProductType] ([Id], [ProductName], [Description], [TypeCode], [Status]) VALUES (3, N'Silicon', N'          ', N'SLC', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
/****** Object:  Table [dbo].[MeasurementUnit]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MeasurementUnit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MeasurementUnit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnitCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_MeasurementUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FirstName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MiddleName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NickName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobilePhone] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [smallint] NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProductName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BaseUnit] [int] NULL,
	[ProductType] [int] NOT NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Product', N'COLUMN',N'BaseUnit'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Don vi tinh co ban' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'BaseUnit'
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([Id], [ProductCode], [ProductName], [Description], [BaseUnit], [ProductType], [Status]) VALUES (1, N'', N'Decal Mau den', N'something', NULL, 1, NULL)
INSERT [dbo].[Product] ([Id], [ProductCode], [ProductName], [Description], [BaseUnit], [ProductType], [Status]) VALUES (2, N'', N'Decal mau den', N'dfsafsfsafsdafs', NULL, 1, NULL)
INSERT [dbo].[Product] ([Id], [ProductCode], [ProductName], [Description], [BaseUnit], [ProductType], [Status]) VALUES (3, N'', N'Trang Sua (caro) 60cm 200m', N'somehitn note', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CustCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BankAcc] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactPerson] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactPersonPhone] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactPersonEmail] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [tinyint] NULL,
	[SalerId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[ProductionRequestDetail]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductionRequestDetail](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[NumberUnit] [int] NULL,
	[Origin] [smallint] NULL,
 CONSTRAINT [PK_ProductionRequestDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[ProductInStock]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductInStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductInStock](
	[Id] [int] NOT NULL,
	[NumberOfItem] [int] NOT NULL,
	[LatestUpdate] [datetime] NOT NULL,
	[Note] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ProductInStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[LatestUpdate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAttribute]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductAttribute](
	[Id] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Value] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AttributeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[Note] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VAT] [float] NULL,
	[Discount] [float] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[MaterialInStock]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MaterialInStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MaterialInStock](
	[Id] [int] NOT NULL,
	[NumberOfItem] [int] NOT NULL,
	[LatestUpdate] [datetime] NOT NULL,
	[Note] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MaterialInStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[LatestUpdate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Price]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Price]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Price](
	[Id] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[UpdatedDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[Price] ([Id], [Price], [UpdatedDate]) VALUES (2, 100, CAST(0x0000A08C000C6993 AS DateTime))
INSERT [dbo].[Price] ([Id], [Price], [UpdatedDate]) VALUES (3, 100, CAST(0x0000A08C00D0B8F5 AS DateTime))
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/17/2012 01:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[NumberUnit] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Cost] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Note] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Default [DF_Customer_Status]    Script Date: 07/17/2012 01:08:41 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Customer_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Status]  DEFAULT ((1)) FOR [Status]
END


End
GO
/****** Object:  Default [DF_Order_VAT]    Script Date: 07/17/2012 01:08:41 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Order_VAT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Order_VAT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_VAT]  DEFAULT ((0)) FOR [VAT]
END


End
GO
/****** Object:  ForeignKey [FK_Customer_Employee]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Employee] FOREIGN KEY([SalerId])
REFERENCES [dbo].[Employee] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Employee]
GO
/****** Object:  ForeignKey [FK_MaterialInStock_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MaterialInStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[MaterialInStock]'))
ALTER TABLE [dbo].[MaterialInStock]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInStock_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MaterialInStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[MaterialInStock]'))
ALTER TABLE [dbo].[MaterialInStock] CHECK CONSTRAINT [FK_MaterialInStock_Product]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_Order_SystemUser]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_SystemUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_SystemUser] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[SystemUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_SystemUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_SystemUser]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Order]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Id])
REFERENCES [dbo].[Order] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
/****** Object:  ForeignKey [FK_Price_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Price_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Price]'))
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Price_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[Price]'))
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Product]
GO
/****** Object:  ForeignKey [FK_Product_MeasurementUnit]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_MeasurementUnit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_MeasurementUnit] FOREIGN KEY([BaseUnit])
REFERENCES [dbo].[MeasurementUnit] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_MeasurementUnit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_MeasurementUnit]
GO
/****** Object:  ForeignKey [FK_Product_ProductType]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Attribute]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAttribute_Attribute]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAttribute]'))
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[BaseAttribute] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAttribute_Attribute]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAttribute]'))
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Attribute]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAttribute_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAttribute]'))
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAttribute_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAttribute]'))
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_ProductInStock_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductInStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductInStock]'))
ALTER TABLE [dbo].[ProductInStock]  WITH CHECK ADD  CONSTRAINT [FK_ProductInStock_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductInStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductInStock]'))
ALTER TABLE [dbo].[ProductInStock] CHECK CONSTRAINT [FK_ProductInStock_Product]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_Product]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductionRequestDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]'))
ALTER TABLE [dbo].[ProductionRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequestDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductionRequestDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]'))
ALTER TABLE [dbo].[ProductionRequestDetail] CHECK CONSTRAINT [FK_ProductionRequestDetail_Product]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_ProductionRequest]    Script Date: 07/17/2012 01:08:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductionRequestDetail_ProductionRequest]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]'))
ALTER TABLE [dbo].[ProductionRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequestDetail_ProductionRequest] FOREIGN KEY([Id])
REFERENCES [dbo].[ProductionRequest] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductionRequestDetail_ProductionRequest]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductionRequestDetail]'))
ALTER TABLE [dbo].[ProductionRequestDetail] CHECK CONSTRAINT [FK_ProductionRequestDetail_ProductionRequest]
GO
