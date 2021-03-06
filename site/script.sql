USE [master]
GO
/****** Object:  Database [inchiriat_masini]    Script Date: 1/27/2022 7:54:25 PM ******/
CREATE DATABASE [inchiriat_masini]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inchiriat_masini', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\inchiriat_masini.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'inchiriat_masini_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\inchiriat_masini_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [inchiriat_masini] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inchiriat_masini].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inchiriat_masini] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inchiriat_masini] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inchiriat_masini] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inchiriat_masini] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inchiriat_masini] SET ARITHABORT OFF 
GO
ALTER DATABASE [inchiriat_masini] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inchiriat_masini] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inchiriat_masini] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inchiriat_masini] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inchiriat_masini] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inchiriat_masini] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inchiriat_masini] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inchiriat_masini] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inchiriat_masini] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inchiriat_masini] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inchiriat_masini] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inchiriat_masini] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inchiriat_masini] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inchiriat_masini] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inchiriat_masini] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inchiriat_masini] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inchiriat_masini] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inchiriat_masini] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inchiriat_masini] SET  MULTI_USER 
GO
ALTER DATABASE [inchiriat_masini] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inchiriat_masini] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inchiriat_masini] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inchiriat_masini] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [inchiriat_masini] SET DELAYED_DURABILITY = DISABLED 
GO
USE [inchiriat_masini]
GO
/****** Object:  Table [dbo].[agency]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone_nr] [nchar](10) NOT NULL,
 CONSTRAINT [PK_agency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[agency_location]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency_location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[agency_ID] [int] NOT NULL,
	[location_ID] [int] NOT NULL,
 CONSTRAINT [PK_agency_location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[booking]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[booking_date] [datetime] NOT NULL,
	[return_date] [datetime] NOT NULL,
	[car_ID] [int] NOT NULL,
	[customer_ID] [int] NOT NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[car]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[registration_nr] [nvarchar](8) NOT NULL,
	[manufacturing_year] [int] NOT NULL,
	[price_day] [int] NOT NULL,
	[color] [nchar](10) NOT NULL,
	[car_type_ID] [int] NOT NULL,
	[agency_ID] [int] NULL,
 CONSTRAINT [PK_car] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[car_type]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[producer] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[automatic] [bit] NOT NULL,
 CONSTRAINT [PK_car_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[phone_nr] [nchar](10) NOT NULL,
	[gender] [char](1) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 1/27/2022 7:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[number] [int] NOT NULL,
	[info] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_customer]    Script Date: 1/27/2022 7:54:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_customer] ON [dbo].[customer]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[agency_location]  WITH CHECK ADD FOREIGN KEY([agency_ID])
REFERENCES [dbo].[agency] ([ID])
GO
ALTER TABLE [dbo].[agency_location]  WITH CHECK ADD FOREIGN KEY([location_ID])
REFERENCES [dbo].[location] ([ID])
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK__booking__car_ID__1DE57479] FOREIGN KEY([car_ID])
REFERENCES [dbo].[car] ([ID])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK__booking__car_ID__1DE57479]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK__booking__custome__1ED998B2] FOREIGN KEY([customer_ID])
REFERENCES [dbo].[customer] ([ID])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK__booking__custome__1ED998B2]
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD  CONSTRAINT [FK__car__agency_ID__20C1E124] FOREIGN KEY([agency_ID])
REFERENCES [dbo].[agency] ([ID])
GO
ALTER TABLE [dbo].[car] CHECK CONSTRAINT [FK__car__agency_ID__20C1E124]
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD  CONSTRAINT [FK__car__car_type_ID__1FCDBCEB] FOREIGN KEY([car_type_ID])
REFERENCES [dbo].[car_type] ([ID])
GO
ALTER TABLE [dbo].[car] CHECK CONSTRAINT [FK__car__car_type_ID__1FCDBCEB]
GO
USE [master]
GO
ALTER DATABASE [inchiriat_masini] SET  READ_WRITE 
GO
