USE [master]
GO
/****** Object:  Database [BookingDB]    Script Date: 3/17/2019 10:13:29 PM ******/
CREATE DATABASE [BookingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BookingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BookingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookingDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BookingDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookingDB', N'ON'
GO
ALTER DATABASE [BookingDB] SET QUERY_STORE = OFF
GO
USE [BookingDB]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/17/2019 10:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[OrderID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[TourID] [varchar](15) NOT NULL,
	[TourName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[BuyDate] [date] NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 3/17/2019 10:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fullname] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Role] [varchar](15) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourInfo]    Script Date: 3/17/2019 10:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourInfo](
	[TourID] [varchar](15) NOT NULL,
	[TourName] [varchar](50) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[MaxSeat] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([OrderID], [Username], [TourID], [TourName], [Quantity], [Price], [BuyDate], [Status]) VALUES (32, N'a', N'T001', N'Da Lat', 2, 100, CAST(N'2019-03-17' AS Date), N'Proceed')
INSERT [dbo].[Cart] ([OrderID], [Username], [TourID], [TourName], [Quantity], [Price], [BuyDate], [Status]) VALUES (33, N'a', N'T001', N'Da Lat', 5, 250, CAST(N'2019-03-17' AS Date), N'Proceed')
INSERT [dbo].[Cart] ([OrderID], [Username], [TourID], [TourName], [Quantity], [Price], [BuyDate], [Status]) VALUES (34, N'a', N'T001', N'Da Lat', 2, 100, CAST(N'2019-03-17' AS Date), N'Proceed')
INSERT [dbo].[Cart] ([OrderID], [Username], [TourID], [TourName], [Quantity], [Price], [BuyDate], [Status]) VALUES (35, N'b', N'T001', N'Da Lat', 4, 50, CAST(N'2019-03-17' AS Date), N'Proceed')
INSERT [dbo].[Cart] ([OrderID], [Username], [TourID], [TourName], [Quantity], [Price], [BuyDate], [Status]) VALUES (36, N'c', N'T001', N'Da Lat', 5, 250, CAST(N'2019-03-17' AS Date), N'Proceed')
INSERT [dbo].[Cart] ([OrderID], [Username], [TourID], [TourName], [Quantity], [Price], [BuyDate], [Status]) VALUES (37, N'hoangpham', N'T001', N'Da Lat', 2, 100, CAST(N'2019-03-17' AS Date), N'Cancelled')
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'a', N'a', N'A', N'123 AAA', N'0202020202', N'user', 1)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'admin', N'admin', N'Admin', N'123 Aaaaaa', N'0123456779', N'admin', 1)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'b', N'b', N'B', N'123 BBB', N'0303030303', N'user', 1)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'c', N'c', N'CCC', N'0505050505', N'0505050505', N'user', 1)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'hoangpham', N'1234', N'minh hoang', N'0938072401', N'0938072401', N'user', 0)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'kien', N'1234', N'KiÃªn', N'123abc', N'0101010101', N'user', 1)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'phuonghuynh', N'1234', N'Phuong Huynh', N'208/45 LDT', N'0768972833', N'user', 1)
INSERT [dbo].[Registration] ([Username], [Password], [Fullname], [Address], [Phone], [Role], [Active]) VALUES (N'user', N'user', N'User', N'321 Xyx Abc', N'0123444555', N'user', 1)
INSERT [dbo].[TourInfo] ([TourID], [TourName], [DateStart], [DateEnd], [Description], [MaxSeat], [Price], [Active]) VALUES (N'T001', N'Da Lat', CAST(N'2019-03-25' AS Date), CAST(N'2019-04-05' AS Date), N'hello da lat', 45, 50, 1)
INSERT [dbo].[TourInfo] ([TourID], [TourName], [DateStart], [DateEnd], [Description], [MaxSeat], [Price], [Active]) VALUES (N'T002', N'Da Nang', CAST(N'2019-03-26' AS Date), CAST(N'2019-04-04' AS Date), N'abababab', 52, 45, 1)
INSERT [dbo].[TourInfo] ([TourID], [TourName], [DateStart], [DateEnd], [Description], [MaxSeat], [Price], [Active]) VALUES (N'T003', N'Phu Quoc', CAST(N'2019-03-27' AS Date), CAST(N'2019-04-05' AS Date), N'pcpcpcpcp', 40, 60, 1)
INSERT [dbo].[TourInfo] ([TourID], [TourName], [DateStart], [DateEnd], [Description], [MaxSeat], [Price], [Active]) VALUES (N'T004', N'Phan Thiet 2', CAST(N'2020-03-30' AS Date), CAST(N'2021-04-04' AS Date), N'very mac tien', 1, 10000, 0)
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Registration] FOREIGN KEY([Username])
REFERENCES [dbo].[Registration] ([Username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Registration]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_TourInfo] FOREIGN KEY([TourID])
REFERENCES [dbo].[TourInfo] ([TourID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_TourInfo]
GO
USE [master]
GO
ALTER DATABASE [BookingDB] SET  READ_WRITE 
GO
