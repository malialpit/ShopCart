USE [master]
GO
/****** Object:  Database [ShopCart]    Script Date: 09/07/2021 11:47:09 AM ******/
CREATE DATABASE [ShopCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopCart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopCart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopCart] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopCart] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopCart] SET  MULTI_USER 
GO
ALTER DATABASE [ShopCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopCart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopCart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopCart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopCart', N'ON'
GO
ALTER DATABASE [ShopCart] SET QUERY_STORE = OFF
GO
USE [ShopCart]
GO
/****** Object:  UserDefinedFunction [dbo].[getSizeName]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getSizeName]
   
   (
   @SizeID int
   )
   RETURNS Nvarchar(10)
   as
   Begin
   Declare @SizeName nvarchar(10)
 select @SizeName=SizeName from tblSizes where SizeID=@SizeID
 
   RETURN @SizeName
   
   End
GO
/****** Object:  Table [dbo].[ForgotPass]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForgotPass](
	[Id] [nvarchar](500) NOT NULL,
	[Uid] [int] NULL,
	[RequestDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBrands]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBrands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[PSelPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Qty]),
	[SubSAmount]  AS ([PSelPrice]*[Qty]),
	[Qty] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGender]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderProducts]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderProducts](
	[OrderProID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[PID] [int] NULL,
	[Products] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[EMail] [nvarchar](max) NULL,
	[CartAmount] [money] NULL,
	[CartDiscount] [money] NULL,
	[TotalPaid] [money] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[DateOfPurchase] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductImages]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductImages](
	[PIMGID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[PSelPrice] [money] NULL,
	[PBrandID] [int] NULL,
	[PCategoryID] [int] NULL,
	[PSubCatID] [int] NULL,
	[PGender] [int] NULL,
	[PDescription] [nvarchar](max) NULL,
	[PProductDetails] [nvarchar](max) NULL,
	[PMaterialCare] [nvarchar](max) NULL,
	[FreeDelivery] [int] NULL,
	[30DayRet] [int] NULL,
	[COD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductSizeQuantity]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductSizeQuantity](
	[PrdSizeQuantID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[SizeID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrdSizeQuantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPurchase]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchase](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PIDSizeID] [nvarchar](max) NULL,
	[CartAmount] [money] NULL,
	[CartDiscount] [money] NULL,
	[TotalPayed] [money] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[DateOfPurchase] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[PinCode] [nvarchar](10) NULL,
	[MobileNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSizes]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSizes](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](500) NULL,
	[BrandID] [int] NULL,
	[CategoryID] [int] NULL,
	[SubCategoryID] [int] NULL,
	[GenderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCatID] [int] IDENTITY(1,1) NOT NULL,
	[SubCatName] [nvarchar](max) NULL,
	[MainCatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Usertype] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ('User') FOR [Usertype]
GO
ALTER TABLE [dbo].[ForgotPass]  WITH CHECK ADD  CONSTRAINT [FK_ForgotPass_tblUsers] FOREIGN KEY([Uid])
REFERENCES [dbo].[tblUsers] ([Uid])
GO
ALTER TABLE [dbo].[ForgotPass] CHECK CONSTRAINT [FK_ForgotPass_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderProducts_ToTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([Uid])
GO
ALTER TABLE [dbo].[tblOrderProducts] CHECK CONSTRAINT [FK_tblOrderProducts_ToTable]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_ToTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([Uid])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_ToTable]
GO
ALTER TABLE [dbo].[tblProductImages]  WITH CHECK ADD  CONSTRAINT [FK_tblProductImages_ToTable] FOREIGN KEY([PID])
REFERENCES [dbo].[tblProducts] ([PID])
GO
ALTER TABLE [dbo].[tblProductImages] CHECK CONSTRAINT [FK_tblProductImages_ToTable]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_ToTable] FOREIGN KEY([PBrandID])
REFERENCES [dbo].[tblBrands] ([BrandID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_ToTable]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_ToTable1] FOREIGN KEY([PCategoryID])
REFERENCES [dbo].[tblCategory] ([CatID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_ToTable1]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_ToTable2] FOREIGN KEY([PSubCatID])
REFERENCES [dbo].[tblSubCategory] ([SubCatID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_ToTable2]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_ToTable3] FOREIGN KEY([PGender])
REFERENCES [dbo].[tblGender] ([GenderID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_ToTable3]
GO
ALTER TABLE [dbo].[tblProductSizeQuantity]  WITH CHECK ADD  CONSTRAINT [FK_tblProductSizeQuantity_ToTable] FOREIGN KEY([PID])
REFERENCES [dbo].[tblProducts] ([PID])
GO
ALTER TABLE [dbo].[tblProductSizeQuantity] CHECK CONSTRAINT [FK_tblProductSizeQuantity_ToTable]
GO
ALTER TABLE [dbo].[tblProductSizeQuantity]  WITH CHECK ADD  CONSTRAINT [FK_tblProductSizeQuantity_ToTable1] FOREIGN KEY([SizeID])
REFERENCES [dbo].[tblSizes] ([SizeID])
GO
ALTER TABLE [dbo].[tblProductSizeQuantity] CHECK CONSTRAINT [FK_tblProductSizeQuantity_ToTable1]
GO
ALTER TABLE [dbo].[tblPurchase]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchase_ToUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([Uid])
GO
ALTER TABLE [dbo].[tblPurchase] CHECK CONSTRAINT [FK_tblPurchase_ToUser]
GO
ALTER TABLE [dbo].[tblSizes]  WITH CHECK ADD  CONSTRAINT [FK_tblSizes_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[tblGender] ([GenderID])
GO
ALTER TABLE [dbo].[tblSizes] CHECK CONSTRAINT [FK_tblSizes_Gender]
GO
ALTER TABLE [dbo].[tblSizes]  WITH CHECK ADD  CONSTRAINT [FK_tblSizes_SubCat] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[tblSubCategory] ([SubCatID])
GO
ALTER TABLE [dbo].[tblSizes] CHECK CONSTRAINT [FK_tblSizes_SubCat]
GO
ALTER TABLE [dbo].[tblSizes]  WITH CHECK ADD  CONSTRAINT [FK_tblSizes_ToBrand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[tblBrands] ([BrandID])
GO
ALTER TABLE [dbo].[tblSizes] CHECK CONSTRAINT [FK_tblSizes_ToBrand]
GO
ALTER TABLE [dbo].[tblSizes]  WITH CHECK ADD  CONSTRAINT [FK_tblSizes_ToCat] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CatID])
GO
ALTER TABLE [dbo].[tblSizes] CHECK CONSTRAINT [FK_tblSizes_ToCat]
GO
ALTER TABLE [dbo].[tblSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([MainCatID])
REFERENCES [dbo].[tblCategory] ([CatID])
GO
ALTER TABLE [dbo].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory_tblCategory]
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProducts]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts2]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProducts2]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Shirt' 
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts3]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProducts3]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Pants' or t2.CatName='Jeans'
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts4]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProducts4]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Jeans' or t2.CatName='Denim Jeans'or t2.CatName='Pants'
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts5]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProducts5]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Leggings' or t2.CatName='Leggings Western Wear'
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProducts6]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProducts6]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='SAREES' 
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[procBindAllProductsWomanTop]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procBindAllProductsWomanTop]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Top' OR t2.CatName='Kurtas Kurtis'
order by A.PID desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_BindAllProducts]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_BindAllProducts]
AS
SELECT A.*, B.*,C.Name, A.PPrice-A.PSelPrice AS DiscAmount, B.Name AS ImageName, C.Name AS BrandName FROM tblProducts A
INNER JOIN tblBrands C ON C.BrandID = A.PBrandID
CROSS APPLY(
SELECT TOP 1 * FROM tblProductImages B WHERE B.PID = A.PID ORDER BY B.PID DESC
)B
ORDER BY A.PID DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_BindCartNumberz]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_BindCartNumberz]
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID

GO
/****** Object:  StoredProcedure [dbo].[SP_BindCartProducts]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_BindCartProducts]
(
@UID int
)
AS
SELECT PID FROM tblCart WHERE UID = @UID
GO
/****** Object:  StoredProcedure [dbo].[SP_BindPriceData]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BindPriceData]
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_BindProductDetails]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BindProductDetails]
(
@PID int
)
AS
SELECT * FROM tblProducts where PID = @PID
GO
/****** Object:  StoredProcedure [dbo].[SP_BindProductImages]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_BindProductImages]
(
@PID int
)
AS
SELECT * FROM tblProductImages where PID = @PID
GO
/****** Object:  StoredProcedure [dbo].[SP_BindUserCart]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_BindUserCart]
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteThisCartItem]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteThisCartItem]
@CartID int
AS
BEGIN
DELETE FROM tblCart WHERE CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EmptyCart]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EmptyCart]
@UserID int
AS
BEGIN
DELETE FROM tblCart WHERE UID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FindOrderNumber]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FindOrderNumber] @FindOrderNumber nvarchar(100)
AS
SELECT * FROM tblOrders WHERE OrderNumber = @FindOrderNumber
GO
/****** Object:  StoredProcedure [dbo].[SP_getUserCartItem]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_getUserCartItem]
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart WHERE PID = @PID AND UID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCart]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCart]
(
@UID int,
@PID int,
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@Qty int
)
AS
INSERT INTO tblCart VALUES(@UID,@PID,@PName,@PPrice,@PSelPrice,@Qty)
SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertOrder]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertOrder]
(
@UserID int,
@Email nvarchar(MAX),
@CartAmount money,
@CartDiscount money,
@TotalPaid money,
@PaymentType nvarchar(50),
@PaymentStatus nvarchar(50),
@DateOfPurchase datetime,
@Name nvarchar(200),
@Address nvarchar(MAX),
@MobileNumber nvarchar(50),
@OrderStatus nvarchar(50),
@OrderNumber nvarchar(50)
)
AS
INSERT INTO tblOrders VALUES(@UserID,@Email,@CartAmount,@CartDiscount,@TotalPaid,@PaymentType,@PaymentStatus,@DateOfPurchase,@Name,@Address,@MobileNumber,@OrderStatus,@OrderNumber)
SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertOrderProducts]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertOrderProducts]
(
@OrderID nvarchar(50),
@UserID int,
@PID int,
@Products nvarchar(MAX),
@Quantity int,
@OrderDate datetime,
@Status nvarchar(100)
)
AS
INSERT INTO tblOrderProducts VALUES (@OrderID,@UserID,@PID,@Products,@Quantity,@OrderDate,@Status)
SELECT SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProduct]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_InsertProduct]
(
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@PBrandID int,
@PCategoryID int,
@PSubCatID int,
@PGender int,
@PDescription nvarchar(MAX),
@PProductDetails nvarchar(MAX),
@PMaterialCare nvarchar(MAX),
@FreeDelivery int,
@30DayRet int,
@COD int
)
AS

insert into tblProducts values(@PName,@PPrice,@PSelPrice,@PBrandID,@PCategoryID,
@PSubCatID,@PGender,@PDescription,@PProductDetails,@PMaterialCare,@FreeDelivery,
@30DayRet,@COD) 
select SCOPE_IDENTITY()
Return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_IsProductExistInCart]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_IsProductExistInCart]
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart where PID = @PID and UID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCart]    Script Date: 09/07/2021 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateCart]
(
@UserID int,
@CartPID int,
@Quantity int
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE tblCart SET Qty = @Quantity WHERE PID = @CartPID AND UID = @UserID
END

GO
USE [master]
GO
ALTER DATABASE [ShopCart] SET  READ_WRITE 
GO
