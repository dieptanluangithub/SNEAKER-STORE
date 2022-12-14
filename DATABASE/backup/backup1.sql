USE [master]
GO
/****** Object:  Database [Shoe_DB]    Script Date: 11/17/2021 10:51:31 PM ******/
CREATE DATABASE [Shoe_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shoe_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shoe_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shoe_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shoe_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shoe_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shoe_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shoe_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shoe_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shoe_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shoe_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shoe_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shoe_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Shoe_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shoe_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shoe_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shoe_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shoe_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shoe_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shoe_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shoe_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shoe_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shoe_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shoe_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shoe_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shoe_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shoe_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shoe_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shoe_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shoe_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shoe_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Shoe_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shoe_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shoe_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shoe_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shoe_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shoe_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Shoe_DB] SET QUERY_STORE = OFF
GO
USE [Shoe_DB]
GO
/****** Object:  User [tretrau1]    Script Date: 11/17/2021 10:51:32 PM ******/
CREATE USER [tretrau1] FOR LOGIN [tretrau1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hailonjqk]    Script Date: 11/17/2021 10:51:32 PM ******/
CREATE USER [hailonjqk] FOR LOGIN [hailonjqk] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin1]    Script Date: 11/17/2021 10:51:32 PM ******/
CREATE USER [admin1] FOR LOGIN [admin1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [SELLER]    Script Date: 11/17/2021 10:51:32 PM ******/
CREATE ROLE [SELLER]
GO
/****** Object:  DatabaseRole [CUSTOMER]    Script Date: 11/17/2021 10:51:32 PM ******/
CREATE ROLE [CUSTOMER]
GO
/****** Object:  DatabaseRole [ADMIN]    Script Date: 11/17/2021 10:51:32 PM ******/
CREATE ROLE [ADMIN]
GO
ALTER ROLE [SELLER] ADD MEMBER [tretrau1]
GO
ALTER ROLE [ADMIN] ADD MEMBER [hailonjqk]
GO
ALTER ROLE [ADMIN] ADD MEMBER [admin1]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LastOrderID]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Lấy ID của đơn hàng cuối cùng( mới nhất)----
CREATE FUNCTION [dbo].[fn_LastOrderID]()
RETURNS INT
AS 
BEGIN
	DECLARE @lastID INT;
	SELECT @lastID = MAX(oid)
	FROM "Order"
	RETURN @lastID
END

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[price] [float] NULL,
	[title] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[cateID] [int] NULL,
	[sale_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ThongTinSanPham]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------VIEW--------------

-- Hiển thị thông tin sản phẩm
CREATE VIEW [dbo].[vw_ThongTinSanPham] AS
SELECT "name", "image", price, title, "description"
FROM Product;
GO
/****** Object:  View [dbo].[vw_ThongTinCaNhan]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Quản lý thông tin cá nhân
CREATE VIEW [dbo].[vw_ThongTinCaNhan] AS
SELECT "name", "image", price, title, "description"
FROM Product;
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[totalQuantity] [int] NULL,
	[totalMoney] [float] NULL,
	[purchaseDate] [date] NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailOrder](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ThongTinChiTietCacDonHang]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Thông tin chi tiết các đơn hàng---
CREATE VIEW [dbo].[vw_ThongTinChiTietCacDonHang] AS
SELECT D."oid",p."name", p."image",D.Quantity, price*D."Quantity" AS price, state
FROM Product P INNER JOIN "DetailOrder" D ON P.id = D.pid
INNER JOIN "Order" O ON D.oid = O.oid
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ThongTinNguoiDung]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongTinNguoiDung] AS
SELECT "uid", "user", isSell, isAdmin
FROM Account;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SearchProductName]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Function---

---Tìm tên sản phẩm khi nhập gần đúng tên---
CREATE FUNCTION [dbo].[fn_SearchProductName](@name NVARCHAR(100))
RETURNS TABLE
AS RETURN SELECT * FROM Product WHERE "name" LIKE '%'+@name+'%'

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SearchMaxPriceByCategory]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Tìm giá của sản phẩm cao nhất trong từng danh mục--
CREATE FUNCTION [dbo].[fn_SearchMaxPriceByCategory]()
RETURNS TABLE
AS RETURN 
	SELECT c.cname, MAX(p.price) AS maxPrice
	FROM Product p, Category c
	WHERE p.cateID= c.cid
	GROUP BY c.cname

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ProductInRangePrice]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Tìm những sản phẩm trong tầm giá---
CREATE FUNCTION [dbo].[fn_ProductInRangePrice](@min FLOAT, @max FLOAT)
RETURNS TABLE
AS RETURN 
	SELECT *
	FROM Product p
	WHERE p.price >@min AND p.price<@max
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ProductByCateName]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Tìm tất cả các sản phẩm theo tên danh mục--
CREATE FUNCTION [dbo].[fn_ProductByCateName](@name NVARCHAR(50))
RETURNS TABLE
AS RETURN 
	SELECT *
	FROM Product p,Category c
	WHERE p.cateID = c.cid AND c."cname" LIKE '%'+@name+'%'
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[mid] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[age] [int] NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ProductBySalerName]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Tìm tất cả các sản phẩm theo tên của người bán--
CREATE FUNCTION [dbo].[fn_ProductBySalerName](@name NVARCHAR(50))
RETURNS TABLE
AS RETURN 
	SELECT m."name" AS NguoiBan, p."name" AS SanPham
	FROM Product p,Member m
	WHERE p.sale_ID = m.mid AND m."name" LIKE '%'+@name+'%'
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ProductAndAmount]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Tìm những sản phẩm và số tiền mà người bán đã bán được ---
CREATE FUNCTION [dbo].[fn_ProductAndAmount](@name NVARCHAR(50))
RETURNS TABLE
AS RETURN 
	SELECT p."name",SUM(d.Quantity) AS Quantity, SUM(p.price*d.Quantity) AS Amount
	FROM Product p,DetailOrder d, Member m
	WHERE p.id = d.pid AND p.sale_ID = m.mid AND m."name" LIKE '%'+@name+'%'
	GROUP BY p."name"
GO
/****** Object:  UserDefinedFunction [dbo].[fn_HoaDon]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Danh sach cac mat hang trong hoa don---
CREATE FUNCTION [dbo].[fn_HoaDon](@oid INT)
RETURNS TABLE
AS RETURN 
	SELECT p."name",price
	FROM DetailOrder d, Product p
	WHERE d.oid = @oid AND d.pid = p.id
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bid] [int] NOT NULL,
	[totalMoney] [int] NULL,
	[discount] [int] NULL,
	[startDate] [date] NULL,
	[createDate] [date] NULL,
	[State] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[message] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'admin1', N'123', 1, 2)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'tretrau1', N'123', 1, 1)
INSERT [dbo].[Account] ([uid], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'hailonjqk', N'124', 1, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Giày')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Vớ')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Phụ kiện')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([oid], [uid], [totalQuantity], [totalMoney], [purchaseDate], [address], [email], [phone], [state]) VALUES (1, 1, 4, 240000, CAST(N'2021-11-17' AS Date), NULL, NULL, NULL, N'shipping')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (1, N'Adidas Superstar EG4958', N'images/anh1.jpg', 900000, N'giày thể thao nam ', N'hợp thời trang 2021', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (2, N'Adidas ZX 2K Boost Cloud White Solar Red Blue', N'images/last.jpg', 500000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (3, N'Adidas nam NITE JOGGER', N'images/giay-adidas-nam.jpg', 400000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (4, N'Adidas 7', N'images/6129a6b3ea178-28082021100003.jpg', 500000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (5, N'Adidas Dame 7', N'images/6129ae402c0e2-28082021103216.jpg', 450000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (6, N'Adidas Ultra Boost 20', N'images/ultra.jpg', 350000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (7, N'Nike Zoom Rival Fly', N'images/nike1.jpg', 825000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (8, N'Nike Air Force 1', N'images/nike2.jpg', 750000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (9, N'Nike Air Max 97', N'images/nike3.jpg', 950000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (10, N'Nike Air Jordan', N'images/612c41ecc1c8c-30082021092652.jpg', 1100000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (11, N'Nike Kyrie Low 3 ', N'images/612c477d0cbcc-30082021095037.jpg', 1500000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (12, N'Converse 1970s High Black ', N'images/conver1.jpg', 820000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (13, N'Converse 1970s Green', N'images/conver2.jpg', 800000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (14, N'Converse Chuck Taylor All Star ', N'images/con3.jpg', 650000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (15, N'Converse Chuck Taylor All Star ', N'images/con6.jpg', 560000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (16, N'Sneaker Vans Old Skool', N'images/van1.jpg', 540000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (17, N'Vans Authentic ', N'images/5fc7442b60381-02122020143715.jpg', 700000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (18, N'Vans Ward Triple White', N'images/5fb23606e395f-16112020151918.jpg', 499000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (19, N'Old Skool X J.Crew Red Orche', N'images/5fb23d1c7b1c4-16112020154932.jpg', 399000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (20, N'Vans Old Skool X J.Crew Reflecting Pond', N'images/5fb23b8e12e18-16112020154254.jpg', 280000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (21, N'Vans  Asher Checkerboard blue ', N'images/van5.jpg', 500000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sale_ID]) VALUES (22, N'Adidas Ultra Boost DNA x Disney Goofy', N'images/60f0f5a35d65e-16072021095739.jpg', 1200000, N'Giày thể thao', N'Hàng chính hãng', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[DetailOrder]  WITH CHECK ADD  CONSTRAINT [FK_DetailOrder_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([oid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DetailOrder] CHECK CONSTRAINT [FK_DetailOrder_Order]
GO
ALTER TABLE [dbo].[DetailOrder]  WITH CHECK ADD  CONSTRAINT [FK_DetailOrder_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DetailOrder] CHECK CONSTRAINT [FK_DetailOrder_Product]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Account] FOREIGN KEY([mid])
REFERENCES [dbo].[Account] ([uid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([uid])
REFERENCES [dbo].[Account] ([uid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([sale_ID])
REFERENCES [dbo].[Account] ([uid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAccount]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Account--
CREATE PROC [dbo].[sp_DeleteAccount]
(
	@uid INT
)
AS
BEGIN
    DELETE 
    FROM 
        "Account"
    WHERE
        "uid"= @uid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBill]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Bill--
CREATE PROC [dbo].[sp_DeleteBill]
(
	@bid INT
)
AS
BEGIN
    DELETE 
    FROM 
        "Bill"
    WHERE
        "bid"= @bid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Category--
CREATE PROC [dbo].[sp_DeleteCategory]
(
	@cid INT
)
AS
BEGIN
    DELETE 
    FROM 
        "Category"
    WHERE
        "cid"= @cid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteContact]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Contact--
CREATE PROC [dbo].[sp_DeleteContact]
(
	@name NVARCHAR(50)
)
AS
BEGIN
    DELETE 
    FROM 
        "Contact"
    WHERE
        "name"= @name
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDetailOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá DetailOrder--
CREATE PROC [dbo].[sp_DeleteDetailOrder]
(
	@oid INT,
	@pid INT
)
AS
BEGIN
    DELETE 
    FROM 
        "DetailOrder"
    WHERE
        "oid"= @oid AND "pid"= @pid 
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMember]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Member--
CREATE PROC [dbo].[sp_DeleteMember]
(
	@mid INT
)
AS
BEGIN
    DELETE 
    FROM 
        "Member"
    WHERE
        "mid"= @mid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Order--
CREATE PROC [dbo].[sp_DeleteOrder]
(
	@oid INT
)
AS
BEGIN
    DELETE 
    FROM 
        "Order"
    WHERE
        "oid"= @oid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProduct]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Xoá Product--
CREATE PROC [dbo].[sp_DeleteProduct]
(
	@id INT
)
AS
BEGIN
    DELETE 
    FROM 
        "Product"
    WHERE
        "id"= @id
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllAccount]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------Account-----------------

--lấy tất cả Account---
CREATE PROC [dbo].[sp_getAllAccount]
AS
BEGIN
    SELECT 
		"uid", 
		"user",
		"pass",
		"isSell",
		"isAdmin"
    FROM 
        "Account"
    ORDER BY 
        "uid";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllBill]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------Bill-----------------

--lấy tất cả Bill---
CREATE PROC [dbo].[sp_getAllBill]
AS
BEGIN
    SELECT 
		"bid", 
		"totalMoney",
		"discount",
		"createDate",
		"startDate",
		"State"
    FROM 
        "Bill"
    ORDER BY 
        "bid";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllCategory]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------Category-----------------

--lấy tất cả Category---
CREATE PROC [dbo].[sp_getAllCategory]
AS
BEGIN
    SELECT 
		"cid", 
		"cname"
    FROM 
        "Category"
    ORDER BY 
        "cid";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllContact]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




---Strored Procedure---
--Các bảng cơ bản Thêm, xoá, sửa, lấy tất cả, lấy một theo field--


--------------Contact-----------------

--lấy tất cả Contact---
CREATE PROC [dbo].[sp_getAllContact]
AS
BEGIN
    SELECT 
		"name", 
		"email",
		"message"
    FROM 
        "Contact"
    ORDER BY 
        "name";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllDetailOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------DetailOrder------------------

--lấy tất cả DetailOrder---
CREATE PROC [dbo].[sp_getAllDetailOrder]
AS
BEGIN
    SELECT 
		"oid", 
		"pid",
		"Quantity"
    FROM 
        "DetailOrder"
    ORDER BY 
        "oid";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllMember]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------Member-----------------

--lấy tất cả Member---
CREATE PROC [dbo].[sp_getAllMember]
AS
BEGIN
    SELECT 
		"mid", 
		"name",
		"age",
		"email",
		"phone",
		"address"
    FROM 
        "Member"
    ORDER BY 
        "mid";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------Order-----------------

--lấy tất cả Order---
CREATE PROC [dbo].[sp_getAllOrder]
AS
BEGIN
    SELECT 
		"oid", 
		"uid",
		"totalQuantity",
		"totalMoney",
		"purchaseDate",
		"address",
		"email",
		"phone",
		"state"
    FROM 
        "Order"
    ORDER BY 
        "oid";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllProduct]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------Product-----------------

--lấy tất cả Product---
CREATE PROC [dbo].[sp_getAllProduct]
AS
BEGIN
    SELECT 
		"id", 
		"name",
		"image",
		"price",
		"title",
		"description",
		"cateID",
		"sale_ID"
    FROM 
        "Product"
    ORDER BY 
        "id";
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getLastProduct]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy sản phẩm mới nhất
CREATE PROC [dbo].[sp_getLastProduct]
AS
BEGIN
   select top 1 * 
   from Product
   order by id desc;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneAccount]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Account--
CREATE PROC [dbo].[sp_getOneAccount] 
(
	@uid INT
)
AS
BEGIN
    SELECT 
		"uid", 
		"user",
		"pass",
		"isSell",
		"isAdmin"
    FROM 
        "Account"
    WHERE 
        "uid"= @uid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneBill]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Bill--
CREATE PROC [dbo].[sp_getOneBill]
(
	@bid INT
)
AS
BEGIN
    SELECT 
		"bid", 
		"totalMoney",
		"discount",
		"startDate",
		"createDate",
		"State"
    FROM 
        "Bill"
    WHERE 
        "bid"= @bid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneCategory]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Category--
CREATE PROC [dbo].[sp_getOneCategory]
(
	@cid INT
)
AS
BEGIN
    SELECT 
		"cid", 
		"cname"
    FROM 
        "Category"
    WHERE 
        "cid"= @cid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneContact]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Contact--
CREATE PROC [dbo].[sp_getOneContact] 
(
	@name NVARCHAR(50)
)
AS
BEGIN
    SELECT 
		"name", 
		"email",
		"message"
    FROM 
        "Contact"
    WHERE 
        "name"= @name
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneDetailOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một DetailOrder--
CREATE PROC [dbo].[sp_getOneDetailOrder]
(
	@oid INT,
	@pid INT
)
AS
BEGIN
    SELECT 
		"oid", 
		"pid",
		"Quantity"
    FROM 
        "DetailOrder"
    WHERE 
        "oid"= @oid AND "pid"= @pid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneMember]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Member--
CREATE PROC [dbo].[sp_getOneMember]
(
	@mid INT
)
AS
BEGIN
    SELECT 
		"mid", 
		"name",
		"age",
		"email",
		"phone",
		"address"
    FROM 
        "Member"
    WHERE 
        "mid"= @mid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Order--
CREATE PROC [dbo].[sp_getOneOrder]
(
	@oid INT
)
AS
BEGIN
    SELECT 
		"oid", 
		"uid",
		"totalQuantity",
		"totalMoney",
		"purchaseDate",
		"address",
		"email",
		"phone",
		"state"
    FROM 
        "Order"
    WHERE 
        "oid"= @oid
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getOneProduct]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Lấy một Product--
CREATE PROC [dbo].[sp_getOneProduct]
(
	@id INT
)
AS
BEGIN
    SELECT 
		"id", 
		"name",
		"image",
		"price",
		"title",
		"description",
		"cateID",
		"sale_ID"
    FROM 
        "Product"
    WHERE 
        "id"= @id
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getProductBySaleID]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Tìm các sảm phẩm mà một tài khoản đó bán---
CREATE PROC [dbo].[sp_getProductBySaleID]
(
	@uid INT
)
AS 
	SELECT * FROM Product p WHERE p.sale_ID = @uid
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAccount]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Account--
CREATE PROC [dbo].[sp_InsertAccount]
(
	@user NVARCHAR(50),
	@pass NVARCHAr(50),
	@isSell INT,
	@isAdmin INT
)
AS
	INSERT INTO "Account"("user","pass","isSell","isAdmin")
	VALUES (@user,@pass,@isSell,@isAdmin)

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertBill]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Bill--
CREATE PROC [dbo].[sp_InsertBill]
(
	@bid INT,
	@totalMoney INT,
	@discount INT,
	@startDate DATE,
	@createDate DATE,
	@State NVARCHAR(50)
)
AS
	INSERT INTO "Bill"("bid","totalMoney","discount","startDate","createDate","State")
	VALUES (@bid,@totalMoney,@discount,@startDate,@createDate,@State)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCategory]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Category--
CREATE PROC [dbo].[sp_InsertCategory]
(
	@cid INT,
	@cname NVARCHAR(50)
)
AS
	INSERT INTO "Category"("cid","cname")
	VALUES (@cid,@cname)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertContact]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Contact--
CREATE PROC [dbo].[sp_InsertContact]
(
	@name NVARCHAR(50),
	@email NVARCHAR(50),
	@message NVARCHAR(MAX)
)
AS
	INSERT INTO "Contact"("name","email","message")
	VALUES (@name,@email,@message)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDetailOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm DetailOrder--
CREATE PROC [dbo].[sp_InsertDetailOrder]
(
	@oid INT,
	@pid INT,
	@Quantity INT
)
AS
	INSERT INTO "DetailOrder"("oid","pid","Quantity")
	VALUES (@oid,@pid,@Quantity)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertMember]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Member--
CREATE PROC [dbo].[sp_InsertMember]
(
	@mid INT,
	@name NVARCHAR(50),
	@age INT,
	@email NVARCHAR(50),
	@phone NVARCHAR(50),
	@address NVARCHAR(50)
)
AS
	INSERT INTO "Member"("mid","name","age","email","phone","address")
	VALUES (@mid,@name,@age,@email,@phone,@address)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Order--
CREATE PROC [dbo].[sp_InsertOrder]
(
	@uid INT,
	@totalQuantity INT,
	@totalMoney INT,
	@purchaseDate DATE,
	@address NVARCHAR(50),
	@email NVARCHAR(50),
	@phone NVARCHAR(50),
	@state NVARCHAR(50)
)
AS
	INSERT INTO "Order"("uid","totalQuantity","totalMoney"
	,"purchaseDate","address","email","phone","state")
	VALUES (@uid, @totalQuantity, @totalMoney, @purchaseDate
	,@address, @email, @phone,@state)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrderWithDetail]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Thêm đơn hàng khi nhấn nút thanh toán---
CREATE PROC [dbo].[sp_InsertOrderWithDetail]
(
	@uid INT
)
AS
BEGIN 
	DECLARE @address NVARCHAR(50);
	DECLARE @email NVARCHAR(50);
	DECLARE @phone NVARCHAR(50);
	DECLARE @state NVARCHAR(50);
	DECLARE @lastID INT;
	SET @lastID = NULL;
	SET @state = 'created';

	SELECT @email = m.email,@phone=m.phone, @address = m."address"
	FROM Member m
	WHERE m.mid = @uid

    INSERT INTO "Order"("uid","totalMoney","totalQuantity","address","email","phone","state")
	VALUES (@uid,0,0,@address, @email, @phone,@state);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProduct]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Thêm Product--
CREATE PROC [dbo].[sp_InsertProduct]
(
	@name NVARCHAR(50),
	@image NVARCHAR(MAX),
	@price FLOAT,
	@title NVARCHAR(50),
	@description NVARCHAR(50),
	@cateID INT,
	@sale_ID INT
)
AS
	INSERT INTO "Product"("name","image","price","title"
	,"description","cateID","sale_ID")
	VALUES (@name,@image,@price,@title,@description,@cateID,@sale_ID)
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAccount]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Cập nhật Account--
CREATE PROC [dbo].[sp_UpdateAccount]
(
	@uid INT,
	@user NVARCHAR(50),
	@pass NVARCHAr(50),
	@isSell INT,
	@isAdmin INT
)
AS
	UPDATE "Account" SET 
					"user" = @user,
					"pass" = @pass,
					"isSell" = @isSell,
					"isAdmin" = @isAdmin
	WHERE "uid" = @uid

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBill]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật Bill--
CREATE PROC [dbo].[sp_UpdateBill]
(
	@bid INT,
	@totalMoney INT,
	@discount INT,
	@startDate DATE,
	@createDate DATE,
	@State NVARCHAR(50)
)
AS
	UPDATE "Bill" SET 
					"totalMoney" = @totalMoney,
					"discount" = @discount,
					"startDate" = @startDate,
					"createDate" = @createDate,
					"State" = @State
	WHERE "bid" = @bid
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCategory]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật Category--
CREATE PROC [dbo].[sp_UpdateCategory]
(
	@cid INT,
	@cname NVARCHAR(50)
)
AS
	UPDATE "Category" SET 
					"cname" = @cname
	WHERE "cid" = @cid
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateContact]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật Contact--
CREATE PROC [dbo].[sp_UpdateContact]
(
	@name NVARCHAR(50),
	@email NVARCHAR(50),
	@message NVARCHAR(MAX)
)
AS
	UPDATE "Contact" SET 
					"email" = @email,
					"message" = @message
	WHERE "name" = @name

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDetailOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật DetailOrder--
CREATE PROC [dbo].[sp_UpdateDetailOrder]
(
	@oid INT,
	@pid INT,
	@Quantity INT
)
AS
	UPDATE "DetailOrder" SET 
					"Quantity" = @Quantity
	WHERE "oid" = @oid AND "pid" = @pid
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMember]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật Member--
CREATE PROC [dbo].[sp_UpdateMember]
(
	@mid INT,
	@name NVARCHAR(50),
	@age INT,
	@email NVARCHAR(50),
	@phone NVARCHAR(50),
	@address NVARCHAR(50)
)
AS
	UPDATE "Member" SET 
					"name" = @name,
					"age" = @age,
					"email" = @email,
					"phone" = @phone,
					"address" = @address
	WHERE "mid" = @mid
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrder]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật Order--
CREATE PROC [dbo].[sp_UpdateOrder]
(
	@oid INT,
	@uid INT,
	@totalQuantity INT,
	@totalMoney INT,
	@purchaseDate DATE,
	@address NVARCHAR(50),
	@email NVARCHAR(50),
	@phone NVARCHAR(50),
	@state NVARCHAR(50)
)
AS
	UPDATE "Order" SET 
					"uid" = @uid,
					"totalQuantity" = @totalQuantity,
					"totalMoney" = @totalMoney,
					"purchaseDate" = @purchaseDate,
					"address" = @address,
					"email" = @email,
					"phone" = @phone,
					"state" = @state
	WHERE "oid" = @oid
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProduct]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cập nhật Product--
CREATE PROC [dbo].[sp_UpdateProduct]
(
	@id INT,
	@name NVARCHAR(50),
	@image NVARCHAR(MAX),
	@price FLOAT,
	@title NVARCHAR(50),
	@description NVARCHAR(50),
	@cateID INT,
	@sale_ID INT
)
AS
	UPDATE "Product" SET 
					"name" = @name,
					"image" = @image,
					"price" = @price,
					"title" = @title,
					"description" = @description,
					"cateID" = @cateID,
					"sale_ID" = @sale_ID
	WHERE "id" = @id
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATE_LOGIN_USER]    Script Date: 11/17/2021 10:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Tự động tạo người dùng và phân quyền trong Database
CREATE   PROC [dbo].[USP_CREATE_LOGIN_USER]
(
	@Role_Name NVARCHAR(50),
	@Login_Name NVARCHAR(50), 
	@Password_Login NVARCHAR(50)
)
AS
BEGIN
    DECLARE @Login_UserName VARCHAR(50),
			@QueryLogin VARCHAR(100),
			@QueryUser VARCHAR(100)

	SET @Login_UserName = @Login_Name
	SET @QueryLogin ='CREATE LOGIN ' + @Login_UserName + ' WITH PASSWORD = ' + QUOTENAME(@Password_Login, '''')
	SET @QueryUser = CONCAT('CREATE USER ', @Login_UserName, ' FOR LOGIN ', @Login_UserName);

	EXEC (@QueryLogin)
	EXEC (@QueryUser)

	EXEC sys.sp_addrolemember @rolename = @Role_Name, 
	                          @membername = @Login_Name 
END
GO
USE [master]
GO
ALTER DATABASE [Shoe_DB] SET  READ_WRITE 
GO
