USE [BaoHienCompany]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 01/25/2013 23:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[Status] [tinyint] NULL,
	[Type] [smallint] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[StoredProcedure1]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StoredProcedure1]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateRandomString]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerateRandomString]
(
    @Length int
)

AS

DECLARE @RandomID varchar(32)
DECLARE @counter smallint
DECLARE @RandomNumber float
DECLARE @RandomNumberInt tinyint
DECLARE @CurrentCharacter varchar(1)
DECLARE @ValidCharacters varchar(255)
SET @ValidCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-=+&$'
DECLARE @ValidCharactersLength int
SET @ValidCharactersLength = len(@ValidCharacters)
SET @CurrentCharacter = ''
SET @RandomNumber = 0
SET @RandomNumberInt = 0
SET @RandomID = ''

SET NOCOUNT ON

SET @counter = 1

WHILE @counter < (@Length + 1)

BEGIN

        SET @RandomNumber = Rand()
        SET @RandomNumberInt = Convert(tinyint, ((@ValidCharactersLength - 1) * @RandomNumber + 1))

        SELECT @CurrentCharacter = SUBSTRING(@ValidCharacters, @RandomNumberInt, 1)

        SET @counter = @counter + 1

        SET @RandomID = @RandomID + @CurrentCharacter

END

SELECT @RandomID AS 'RandomString'
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[TypeCode] [varchar](25) NOT NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MeasurementUnit]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MeasurementUnit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[UnitCode] [varchar](25) NOT NULL,
 CONSTRAINT [PK_MeasurementUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Liability]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Liability](
	[LiabilityID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[Code] [varchar](25) NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[Type] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Liability] PRIMARY KEY CLUSTERED 
(
	[LiabilityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GenerateRandomString]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateRandomString]
(
    @Length int
)

AS

DECLARE @RandomID varchar(32)
DECLARE @counter smallint
DECLARE @RandomNumber float
DECLARE @RandomNumberInt tinyint
DECLARE @CurrentCharacter varchar(1)
DECLARE @ValidCharacters varchar(255)
SET @ValidCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-=+&$'
DECLARE @ValidCharactersLength int
SET @ValidCharactersLength = len(@ValidCharacters)
SET @CurrentCharacter = ''
SET @RandomNumber = 0
SET @RandomNumberInt = 0
SET @RandomID = ''

SET NOCOUNT ON

SET @counter = 1

WHILE @counter < (@Length + 1)

BEGIN

        SET @RandomNumber = Rand()
        SET @RandomNumberInt = Convert(tinyint, ((@ValidCharactersLength - 1) * @RandomNumber + 1))

        SELECT @CurrentCharacter = SUBSTRING(@ValidCharacters, @RandomNumberInt, 1)

        SET @counter = @counter + 1

        SET @RandomID = @RandomID + @CurrentCharacter

END

SELECT @RandomID AS 'RandomString'
GO
/****** Object:  Table [dbo].[BaseAttribute]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaseAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[AttributeCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](25) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [varchar](25) NULL,
	[MobilePhone] [varchar](25) NULL,
	[Type] [smallint] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [tinyint] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Price]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[Id] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[UpdatedDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](25) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ProductType] [int] NOT NULL,
	[Status] [tinyint] NULL,
	[Direction] [tinyint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductionRequest]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReqCode] [varchar](25) NOT NULL,
	[RequestedDate] [datetime] NOT NULL,
	[RequestedBy] [int] NOT NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductionRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EntranceStock]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EntranceStock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntranceCode] [varchar](25) NOT NULL,
	[EntrancedDate] [datetime] NOT NULL,
	[EntrancedBy] [int] NOT NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_EntranceStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeLog]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[RecordCode] [varchar](25) NOT NULL,
	[BeforeNumber] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[AfterNumber] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EmployeeLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustCode] [varchar](25) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Phone] [varchar](25) NOT NULL,
	[BankAcc] [nvarchar](50) NULL,
	[BankName] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[ContactPersonPhone] [nvarchar](50) NULL,
	[ContactPersonEmail] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [tinyint] NULL,
	[SalerId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductLog]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[RecordCode] [nvarchar](50) NOT NULL,
	[BeforeNumber] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[AfterNumber] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionRequestDetail]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionRequestDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductionRequestId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[NumberUnit] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[Direction] [bit] NOT NULL,
 CONSTRAINT [PK_ProductionRequestDetail_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntranceStockDetail]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntranceStockDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntranceStockId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[NumberUnit] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_EntranceStockDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillCode] [varchar](50) NOT NULL,
	[CustId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Bill_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [varchar](25) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CustId] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[WareHouse] [nvarchar](300) NULL,
	[Reason] [nvarchar](max) NULL,
	[Note] [nvarchar](500) NULL,
	[VAT] [float] NULL,
	[Discount] [float] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerLog]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RecordCode] [varchar](25) NOT NULL,
	[BeforeDebit] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[AfterDebit] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 01/25/2013 23:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[NumberUnit] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Cost] [float] NOT NULL,
	[Note] [nvarchar](50) NULL,
	[OrderId] [int] NOT NULL,
	[Commission] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Customer_Status]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_ProductionRequestDetail_Direction]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductionRequestDetail] ADD  CONSTRAINT [DF_ProductionRequestDetail_Direction]  DEFAULT ((0)) FOR [Direction]
GO
/****** Object:  Default [DF_Order_VAT]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_VAT]  DEFAULT ((0)) FOR [VAT]
GO
/****** Object:  Default [DF_Order_Discount]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)) FOR [Discount]
GO
/****** Object:  Default [DF_CustomerLog_BeforeDebit]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[CustomerLog] ADD  CONSTRAINT [DF_CustomerLog_BeforeDebit]  DEFAULT ((0)) FOR [BeforeDebit]
GO
/****** Object:  Default [DF_CustomerLog_Amount]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[CustomerLog] ADD  CONSTRAINT [DF_CustomerLog_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_CustomerLog_AfterDebit]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[CustomerLog] ADD  CONSTRAINT [DF_CustomerLog_AfterDebit]  DEFAULT ((0)) FOR [AfterDebit]
GO
/****** Object:  Default [DF_OrderDetail_commission]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_commission]  DEFAULT ((0)) FOR [Commission]
GO
/****** Object:  ForeignKey [FK_Product_ProductType]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
/****** Object:  ForeignKey [FK_ProductionRequest_SystemUser]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductionRequest]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequest_SystemUser] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[ProductionRequest] CHECK CONSTRAINT [FK_ProductionRequest_SystemUser]
GO
/****** Object:  ForeignKey [FK_EntranceStock_SystemUser]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[EntranceStock]  WITH CHECK ADD  CONSTRAINT [FK_EntranceStock_SystemUser] FOREIGN KEY([EntrancedBy])
REFERENCES [dbo].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[EntranceStock] CHECK CONSTRAINT [FK_EntranceStock_SystemUser]
GO
/****** Object:  ForeignKey [FK_EmployeeLog_Employee]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[EmployeeLog]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLog_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeLog] CHECK CONSTRAINT [FK_EmployeeLog_Employee]
GO
/****** Object:  ForeignKey [FK_Customer_Employee]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Employee] FOREIGN KEY([SalerId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Employee]
GO
/****** Object:  ForeignKey [FK_ProductLog_BaseAttribute]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD  CONSTRAINT [FK_ProductLog_BaseAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[BaseAttribute] ([Id])
GO
ALTER TABLE [dbo].[ProductLog] CHECK CONSTRAINT [FK_ProductLog_BaseAttribute]
GO
/****** Object:  ForeignKey [FK_ProductLog_MeasurementUnit]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD  CONSTRAINT [FK_ProductLog_MeasurementUnit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[MeasurementUnit] ([Id])
GO
ALTER TABLE [dbo].[ProductLog] CHECK CONSTRAINT [FK_ProductLog_MeasurementUnit]
GO
/****** Object:  ForeignKey [FK_ProductLog_Product]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductLog]  WITH CHECK ADD  CONSTRAINT [FK_ProductLog_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductLog] CHECK CONSTRAINT [FK_ProductLog_Product]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_BaseAttribute]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductionRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequestDetail_BaseAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[BaseAttribute] ([Id])
GO
ALTER TABLE [dbo].[ProductionRequestDetail] CHECK CONSTRAINT [FK_ProductionRequestDetail_BaseAttribute]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_MeasurementUnit]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductionRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequestDetail_MeasurementUnit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[MeasurementUnit] ([Id])
GO
ALTER TABLE [dbo].[ProductionRequestDetail] CHECK CONSTRAINT [FK_ProductionRequestDetail_MeasurementUnit]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_Product]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductionRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequestDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductionRequestDetail] CHECK CONSTRAINT [FK_ProductionRequestDetail_Product]
GO
/****** Object:  ForeignKey [FK_ProductionRequestDetail_ProductionRequest]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductionRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionRequestDetail_ProductionRequest] FOREIGN KEY([ProductionRequestId])
REFERENCES [dbo].[ProductionRequest] ([Id])
GO
ALTER TABLE [dbo].[ProductionRequestDetail] CHECK CONSTRAINT [FK_ProductionRequestDetail_ProductionRequest]
GO
/****** Object:  ForeignKey [FK_EntranceStockDetail_BaseAttribute]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[EntranceStockDetail]  WITH CHECK ADD  CONSTRAINT [FK_EntranceStockDetail_BaseAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[BaseAttribute] ([Id])
GO
ALTER TABLE [dbo].[EntranceStockDetail] CHECK CONSTRAINT [FK_EntranceStockDetail_BaseAttribute]
GO
/****** Object:  ForeignKey [FK_EntranceStockDetail_EntranceStock]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[EntranceStockDetail]  WITH CHECK ADD  CONSTRAINT [FK_EntranceStockDetail_EntranceStock] FOREIGN KEY([EntranceStockId])
REFERENCES [dbo].[EntranceStock] ([Id])
GO
ALTER TABLE [dbo].[EntranceStockDetail] CHECK CONSTRAINT [FK_EntranceStockDetail_EntranceStock]
GO
/****** Object:  ForeignKey [FK_EntranceStockDetail_MeasurementUnit]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[EntranceStockDetail]  WITH CHECK ADD  CONSTRAINT [FK_EntranceStockDetail_MeasurementUnit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[MeasurementUnit] ([Id])
GO
ALTER TABLE [dbo].[EntranceStockDetail] CHECK CONSTRAINT [FK_EntranceStockDetail_MeasurementUnit]
GO
/****** Object:  ForeignKey [FK_EntranceStockDetail_Product]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[EntranceStockDetail]  WITH CHECK ADD  CONSTRAINT [FK_EntranceStockDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[EntranceStockDetail] CHECK CONSTRAINT [FK_EntranceStockDetail_Product]
GO
/****** Object:  ForeignKey [FK_Bill_Customer]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([CustId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
/****** Object:  ForeignKey [FK_Bill_SystemUser]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_SystemUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_SystemUser]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_Order_SystemUser]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_SystemUser] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_SystemUser]
GO
/****** Object:  ForeignKey [FK_CustomerLog_Customer]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[CustomerLog]  WITH CHECK ADD  CONSTRAINT [FK_CustomerLog_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerLog] CHECK CONSTRAINT [FK_CustomerLog_Customer]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Attribute]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[BaseAttribute] ([Id])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Attribute]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_OrderDetail_BaseAttribute]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_BaseAttribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[BaseAttribute] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_BaseAttribute]
GO
/****** Object:  ForeignKey [FK_OrderDetail_MeasurementUnit]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_MeasurementUnit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[MeasurementUnit] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_MeasurementUnit]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Order]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 01/25/2013 23:52:06 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
