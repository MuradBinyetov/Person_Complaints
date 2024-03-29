USE [master]
GO
/****** Object:  Database [PersonDb]    Script Date: 10-Dec-19 12:55:36 ******/
CREATE DATABASE [PersonDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PersonDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PersonDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PersonDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PersonDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PersonDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonDb] SET RECOVERY FULL 
GO
ALTER DATABASE [PersonDb] SET  MULTI_USER 
GO
ALTER DATABASE [PersonDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PersonDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PersonDb', N'ON'
GO
ALTER DATABASE [PersonDb] SET QUERY_STORE = OFF
GO
USE [PersonDb]
GO
/****** Object:  Table [dbo].[People]    Script Date: 10-Dec-19 12:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Surname] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 10-Dec-19 12:55:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[Title] [varchar](30) NOT NULL,
	[Description] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
GO
USE [master]
GO
ALTER DATABASE [PersonDb] SET  READ_WRITE 
GO
