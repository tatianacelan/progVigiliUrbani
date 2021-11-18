USE [master]
GO
/****** Object:  Database [VigiliUrbani]    Script Date: 18/11/2021 11:24:54 ******/
CREATE DATABASE [VigiliUrbani]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VigiliUrbani', FILENAME = N'C:\Users\Tatiana\VigiliUrbani.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VigiliUrbani_log', FILENAME = N'C:\Users\Tatiana\VigiliUrbani_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VigiliUrbani] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VigiliUrbani].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VigiliUrbani] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VigiliUrbani] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VigiliUrbani] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VigiliUrbani] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VigiliUrbani] SET ARITHABORT OFF 
GO
ALTER DATABASE [VigiliUrbani] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VigiliUrbani] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VigiliUrbani] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VigiliUrbani] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VigiliUrbani] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VigiliUrbani] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VigiliUrbani] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VigiliUrbani] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VigiliUrbani] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VigiliUrbani] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VigiliUrbani] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VigiliUrbani] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VigiliUrbani] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VigiliUrbani] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VigiliUrbani] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VigiliUrbani] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VigiliUrbani] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VigiliUrbani] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VigiliUrbani] SET  MULTI_USER 
GO
ALTER DATABASE [VigiliUrbani] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VigiliUrbani] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VigiliUrbani] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VigiliUrbani] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VigiliUrbani] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VigiliUrbani] SET QUERY_STORE = OFF
GO
USE [VigiliUrbani]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [VigiliUrbani]
GO
/****** Object:  Table [dbo].[Automobile]    Script Date: 18/11/2021 11:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automobile](
	[TargaAuto] [nchar](6) NOT NULL,
	[Potenza] [int] NOT NULL,
 CONSTRAINT [PK_targaAuto] PRIMARY KEY CLUSTERED 
(
	[TargaAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contravvenzione]    Script Date: 18/11/2021 11:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contravvenzione](
	[NumeroVerbale] [int] IDENTITY(1000,1) NOT NULL,
	[Luogo] [nvarchar](70) NOT NULL,
	[DataVerbale] [datetime] NOT NULL,
	[MatricolaVigile] [int] NOT NULL,
	[TargaVeicolo] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Verbale] PRIMARY KEY CLUSTERED 
(
	[NumeroVerbale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moto]    Script Date: 18/11/2021 11:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moto](
	[TargaMoto] [nchar](6) NOT NULL,
	[CodiceTelaio] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_targaMoto] PRIMARY KEY CLUSTERED 
(
	[TargaMoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veicolo]    Script Date: 18/11/2021 11:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veicolo](
	[TargaVeicolo] [nchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TargaVeicolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vigile]    Script Date: 18/11/2021 11:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vigile](
	[Matricola] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[Cognome] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Matricola] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Automobile] ([TargaAuto], [Potenza]) VALUES (N'AA213R', 95)
INSERT [dbo].[Automobile] ([TargaAuto], [Potenza]) VALUES (N'AB123D', 120)
INSERT [dbo].[Automobile] ([TargaAuto], [Potenza]) VALUES (N'BC120E', 200)
GO
SET IDENTITY_INSERT [dbo].[Contravvenzione] ON 

INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1000, N'Settevalli', CAST(N'2020-02-12T14:30:00.000' AS DateTime), 1, N'AB123D')
INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1001, N'piazza vittorio veneto,1 ', CAST(N'2021-06-21T15:12:00.000' AS DateTime), 1, N'GTO214')
INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1002, N'piazza italia ,12', CAST(N'2021-11-13T14:45:00.000' AS DateTime), 2, N'BC120E')
INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1003, N'via antonio conti,78', CAST(N'2020-07-15T18:32:00.000' AS DateTime), 3, N'RTE198')
INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1004, N'via cristoforo colombo,86', CAST(N'2019-08-23T00:00:00.000' AS DateTime), 3, N'RTE198')
INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1005, N'piazza 4 novembre', CAST(N'2017-11-25T01:12:00.000' AS DateTime), 3, N'RTE198')
INSERT [dbo].[Contravvenzione] ([NumeroVerbale], [Luogo], [DataVerbale], [MatricolaVigile], [TargaVeicolo]) VALUES (1006, N'via del popolo,56 ', CAST(N'2001-11-11T00:00:00.000' AS DateTime), 1, N'GTO214')
SET IDENTITY_INSERT [dbo].[Contravvenzione] OFF
GO
INSERT [dbo].[Moto] ([TargaMoto], [CodiceTelaio]) VALUES (N'GTO214', N'PG123456')
INSERT [dbo].[Moto] ([TargaMoto], [CodiceTelaio]) VALUES (N'RTE198', N'FE987654')
GO
INSERT [dbo].[Veicolo] ([TargaVeicolo]) VALUES (N'AA213R')
INSERT [dbo].[Veicolo] ([TargaVeicolo]) VALUES (N'AB123D')
INSERT [dbo].[Veicolo] ([TargaVeicolo]) VALUES (N'BC120E')
INSERT [dbo].[Veicolo] ([TargaVeicolo]) VALUES (N'GTO214')
INSERT [dbo].[Veicolo] ([TargaVeicolo]) VALUES (N'RTE198')
GO
SET IDENTITY_INSERT [dbo].[Vigile] ON 

INSERT [dbo].[Vigile] ([Matricola], [Nome], [Cognome]) VALUES (1, N'Simone', N'Nodesi')
INSERT [dbo].[Vigile] ([Matricola], [Nome], [Cognome]) VALUES (2, N'Bruno', N'Brunelli')
INSERT [dbo].[Vigile] ([Matricola], [Nome], [Cognome]) VALUES (3, N'Cristian', N'Cocchetto')
INSERT [dbo].[Vigile] ([Matricola], [Nome], [Cognome]) VALUES (4, N'Maria', N'Ferretti')
SET IDENTITY_INSERT [dbo].[Vigile] OFF
GO
ALTER TABLE [dbo].[Automobile]  WITH CHECK ADD  CONSTRAINT [FK_Auto] FOREIGN KEY([TargaAuto])
REFERENCES [dbo].[Veicolo] ([TargaVeicolo])
GO
ALTER TABLE [dbo].[Automobile] CHECK CONSTRAINT [FK_Auto]
GO
ALTER TABLE [dbo].[Contravvenzione]  WITH CHECK ADD  CONSTRAINT [FK_Veicolo] FOREIGN KEY([TargaVeicolo])
REFERENCES [dbo].[Veicolo] ([TargaVeicolo])
GO
ALTER TABLE [dbo].[Contravvenzione] CHECK CONSTRAINT [FK_Veicolo]
GO
ALTER TABLE [dbo].[Contravvenzione]  WITH CHECK ADD  CONSTRAINT [FK_Vigile] FOREIGN KEY([MatricolaVigile])
REFERENCES [dbo].[Vigile] ([Matricola])
GO
ALTER TABLE [dbo].[Contravvenzione] CHECK CONSTRAINT [FK_Vigile]
GO
ALTER TABLE [dbo].[Moto]  WITH CHECK ADD  CONSTRAINT [FK_Moto] FOREIGN KEY([TargaMoto])
REFERENCES [dbo].[Veicolo] ([TargaVeicolo])
GO
ALTER TABLE [dbo].[Moto] CHECK CONSTRAINT [FK_Moto]
GO
USE [master]
GO
ALTER DATABASE [VigiliUrbani] SET  READ_WRITE 
GO
