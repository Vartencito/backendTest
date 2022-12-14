USE [master]
GO
/****** Object:  Database [MyArtBD]    Script Date: 22/9/2022 10:53:39 ******/
CREATE DATABASE [MyArtBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyArtBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyArtBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyArtBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyArtBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyArtBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyArtBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyArtBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyArtBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyArtBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyArtBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyArtBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyArtBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyArtBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyArtBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyArtBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyArtBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyArtBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyArtBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyArtBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyArtBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyArtBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyArtBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyArtBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyArtBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyArtBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyArtBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyArtBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyArtBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyArtBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyArtBD] SET  MULTI_USER 
GO
ALTER DATABASE [MyArtBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyArtBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyArtBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyArtBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyArtBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyArtBD', N'ON'
GO
ALTER DATABASE [MyArtBD] SET QUERY_STORE = OFF
GO
USE [MyArtBD]
GO
/****** Object:  User [alumno]    Script Date: 22/9/2022 10:53:40 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 22/9/2022 10:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[text] [varchar](max) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[fkUser] [int] NOT NULL,
	[fkPublication] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follows]    Script Date: 22/9/2022 10:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follows](
	[fkUser] [int] NOT NULL,
	[followed] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeOrDislike]    Script Date: 22/9/2022 10:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeOrDislike](
	[fkUser] [int] NOT NULL,
	[fkPublication] [int] NOT NULL,
	[stateLike] [bit] NOT NULL,
	[stateDislike] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publication]    Script Date: 22/9/2022 10:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[fkUser] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22/9/2022 10:53:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[cellphone] [varchar](50) NULL,
	[mail] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[profilePicture] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[premium] [bit] NOT NULL,
	[occupation] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (1, N'comentario1', CAST(N'2022-06-19T13:53:42.000' AS DateTime), 2, 9)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (3, N'comentario2', CAST(N'2022-06-19T16:52:28.000' AS DateTime), 1, 2)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (4, N'comentario3', CAST(N'2022-06-19T15:22:52.000' AS DateTime), 5, 7)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (7, N'asdfasd', CAST(N'2022-06-19T15:22:52.000' AS DateTime), 7, 9)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (8, N'Holaaaa', CAST(N'2022-09-21T16:25:59.000' AS DateTime), 8, 9)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (9, N'PRUEBA 192848301', CAST(N'2022-09-21T16:32:53.000' AS DateTime), 8, 7)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (10, N'Holaaaa', CAST(N'2022-09-21T17:20:07.000' AS DateTime), 8, 2)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (13, N'Sld', CAST(N'2022-09-22T23:02:15.000' AS DateTime), 8, 2)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (20, N'a', CAST(N'2022-09-22T08:38:26.000' AS DateTime), 8, 2)
INSERT [dbo].[Comment] ([Id], [text], [created_at], [fkUser], [fkPublication]) VALUES (21, N'hola', CAST(N'2022-09-22T09:24:41.000' AS DateTime), 8, 2)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
INSERT [dbo].[Follows] ([fkUser], [followed]) VALUES (5, 1)
INSERT [dbo].[Follows] ([fkUser], [followed]) VALUES (5, 2)
INSERT [dbo].[Follows] ([fkUser], [followed]) VALUES (5, 7)
GO
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 7, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 13, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 14, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (29, 22, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (30, 12, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (10, 7, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (3, 9, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (1, 2, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (2, 7, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (5, 2, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (3, 2, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (1, 9, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (2, 9, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (7, 2, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (1, 7, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (5, 7, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 21, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (28, 2, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (28, 7, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (28, 9, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (28, 12, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (28, 13, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (28, 19, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (29, 2, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (31, 24, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 31, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 30, 0, 1)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 33, 1, 0)
INSERT [dbo].[LikeOrDislike] ([fkUser], [fkPublication], [stateLike], [stateDislike]) VALUES (8, 2, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Publication] ON 

INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (2, N'imagen1', N'https://i.imgur.com/hyxsJXf_d.webp?maxwidth=520&shape=thumb&fidelity=high', CAST(N'2022-06-19T15:22:52.000' AS DateTime), 3, N'descripcion1')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (7, N'imagen3', N'https://pbs.twimg.com/media/EtMyremWQAEcl08.jpg', CAST(N'2022-06-19T15:26:49.000' AS DateTime), 8, N'descripcion2')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (9, N'imagen4', N'https://i.imgur.com/bkziQqr_d.webp?https://pbs.twimg.com/media/EtMyremWQAEcl08.jpg', CAST(N'2022-06-19T15:22:52.000' AS DateTime), 2, N'descripcion3')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (12, N'imagen7', N'https://i.imgur.com/P4lF2PB_d.webp?https://pbs.twimg.com/media/EtMyremWQAEcl08.jpg', CAST(N'2022-06-19T16:00:48.000' AS DateTime), 11, N'descripcion4')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (13, N'imagen8', N'https://i.imgur.com/zlFnpMZ_d.webp?maxwidth=520&shape=thumb&fidelity=high', CAST(N'1905-06-21T00:00:00.000' AS DateTime), 1, N'descripcion5')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (14, N'imagen9', N'https://i.imgur.com/fDZICWw_d.webp?maxwidth=520&shape=thumb&fidelity=high', CAST(N'2022-06-22T19:36:24.000' AS DateTime), 6, N'descripcion6')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (19, N'aa', N'https://i.imgur.com/q2JKBar_d.webp?maxwidth=520&shape=thumb&fidelity=high', CAST(N'2022-08-19T08:07:15.000' AS DateTime), 8, N'gsdgjhdsfn')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (21, N'asgafdsg', N'https://i.imgur.com/6zHAqSm_d.webp?maxwidth=520&shape=thumb&fidelity=high', CAST(N'2022-08-19T08:47:27.000' AS DateTime), 5, N'aasdfasd')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (22, N'Negrero', N'https://i.imgur.com/Vo9JRcj.png', CAST(N'2022-08-19T10:53:22.000' AS DateTime), 29, N'Mi primo disfrazado para BRC')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (23, N'r', N'https://i.imgur.com/RSYGwkn.jpeg', CAST(N'2022-08-19T11:08:40.000' AS DateTime), 30, N'r')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (24, N'Prueba Imagen', N'https://i.imgur.com/BD8nnm7.jpeg', CAST(N'2022-08-19T11:16:59.000' AS DateTime), 31, N'Estou haciendo la prueba')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (30, N'aaa', N'https://i.imgur.com/2M3R1g2.jpg', CAST(N'2022-09-16T09:27:32.000' AS DateTime), 8, N'ahag')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (31, N'prueba de imgur', N'https://i.imgur.com/ugqXDal.jpg', CAST(N'2022-09-16T09:30:59.000' AS DateTime), 3, N'desc prueba de imgur')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (33, N'Prueba refresh en home', N'https://i.imgur.com/mYMNU73.jpg', CAST(N'2022-09-17T19:55:10.000' AS DateTime), 1, N'Prueba aaaaaaa')
INSERT [dbo].[Publication] ([Id], [name], [image], [created_at], [fkUser], [description]) VALUES (34, N'Zllxldmsnañaofivgjjeb', N'https://i.imgur.com/9e384Yf.jpg', CAST(N'2022-09-17T20:12:58.000' AS DateTime), 28, N'Lslxndnwkzis')
SET IDENTITY_INSERT [dbo].[Publication] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (1, N'Anabella_5', N'apellido1A', N'usuario1A', N'contraseña1A', N'cellphone1A', N'ejemplo1A@gmail.com', N'Hermoso trabajo que llevó muchísimo tiempo y dedicación!', N'https://i.pinimg.com/736x/b8/69/5f/b8695f007aea9a08a0419479217ca6aa.jpg', CAST(N'2022-06-19T15:22:52.000' AS DateTime), 1, N'Diseñador')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (2, N'Caitlyn_2', N'apellido2', N'usuario2', N'contraseña2', N'cellphone2', N'ejemplo2@gmail.com', N'Hermoso trabajo que llevó muchísimo tiempo y dedicación!', N'https://i.pinimg.com/736x/b8/69/5f/b8695f007aea9a08a0419479217ca6aa.jpg', CAST(N'2022-06-19T15:22:52.000' AS DateTime), 1, N'Diseñador')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (3, N'Vicky_3', N'apellido3', N'usuario3', N'contraseña3', N'cellphone3', N'ejemplo3@gmail.com', N'Hermoso trabajo que llevó muchísimo tiempo y dedicación!', N'https://i.pinimg.com/736x/b8/69/5f/b8695f007aea9a08a0419479217ca6aa.jpg', CAST(N'2022-06-19T15:26:49.000' AS DateTime), 0, N'Diseñador')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (5, N'Valen_5', N'apellido4', N'usuario4', N'contraseña4', N'cellphone4', N'ejemplo4@gmail.com', N'Hermoso trabajo que llevó muchísimo tiempo y dedicación!', N'https://i.pinimg.com/736x/b8/69/5f/b8695f007aea9a08a0419479217ca6aa.jpg', CAST(N'2022-06-19T16:52:28.000' AS DateTime), 1, N'Diseñador')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (6, N'Ivana:6', N'apellido5', N'usuario5', N'contraseña5', N'cellphone5', N'ejemplo5@gmail.com', N'Hermoso trabajo que llevó muchísimo tiempo y dedicación!', N'https://i.pinimg.com/736x/b8/69/5f/b8695f007aea9a08a0419479217ca6aa.jpg', CAST(N'2022-06-19T13:53:42.000' AS DateTime), 0, N'Diseñador')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (7, N'juan', N'', N'juancito', N'contraseña123', N'', N'123@gmail.com', N'', N'', CAST(N'2022-08-05T10:30:55.000' AS DateTime), 1, N'')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (8, N'a', N'a', N'a', N'a', N'a', N'a', N'a', N'', NULL, 1, N'a')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (9, N'nombre6', N'apellido6', N'usuario6', N'contraseña6', N'cellphone6', N'ejemplo6@gmail.com', N'descripcion6', N'', CAST(N'2022-08-17T19:33:29.000' AS DateTime), 0, N'ocupacion6')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (10, N'A', N'', N'usuarioPrueba', N'contraseñaaa', N'4557', N'Fgdq@fsdgg.com', N'Afggsxf', N'', CAST(N'2022-08-17T19:34:04.000' AS DateTime), 1, N'Adv')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (11, N'werefdvb', N'', N'asfgsegh', N'aefhgafh', N'78945123', N'qwefadc', N'gqwgfgj', N'', CAST(N'2022-08-19T08:02:48.000' AS DateTime), 1, N'qryethj')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (14, N'v', N'', N'v', N'v', N'v', N'v', N'v', N'', CAST(N'2022-08-19T09:29:36.000' AS DateTime), 1, N'v')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (22, N'w', N'', N'w', N'w', N'w', N'w', N'w', N'', CAST(N'2022-08-19T10:36:52.000' AS DateTime), 1, N'w')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (28, N'a', N'', N'adrian', N'adrian', N'a', N'a', N'a', N'', CAST(N'2022-08-19T10:48:55.000' AS DateTime), 1, N'a')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (29, N'Tobias', N'', N'menem', N'holamundo', N'1123232323', N'maxitietze68gmail.com', N'Soy web developer en Amazon y CEO de Grady SA', N'', CAST(N'2022-08-19T10:51:56.000' AS DateTime), 1, N'Vivo de planes sociales')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (30, N'r', N'', N'r', N'r', N'r', N'r', N'r', N'', CAST(N'2022-08-19T11:07:22.000' AS DateTime), 1, N'r')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (31, N'Adrian', N'', N'aturek', N'Abtpsb22', N'12345678', N'adrianb@aa.com', N'No se que poner aca', N'', CAST(N'2022-08-19T11:14:08.000' AS DateTime), 1, N'Sistemas')
INSERT [dbo].[User] ([Id], [name], [lastName], [username], [password], [cellphone], [mail], [description], [profilePicture], [created_at], [premium], [occupation]) VALUES (32, N'Oslxnd', N'', N'Lqmdn,ka', N'sjznxkka', N'41246797', N'Akqjfjsi@gmail.com', N'Lakdbz', N'', CAST(N'2022-09-23T02:02:44.000' AS DateTime), 1, N'Ksnxbjsi')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Publication] FOREIGN KEY([fkPublication])
REFERENCES [dbo].[Publication] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Publication]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([fkUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Follows]  WITH CHECK ADD  CONSTRAINT [FK_Follows_User] FOREIGN KEY([fkUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follows] CHECK CONSTRAINT [FK_Follows_User]
GO
ALTER TABLE [dbo].[Follows]  WITH CHECK ADD  CONSTRAINT [FK_Follows_User1] FOREIGN KEY([followed])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follows] CHECK CONSTRAINT [FK_Follows_User1]
GO
ALTER TABLE [dbo].[LikeOrDislike]  WITH CHECK ADD  CONSTRAINT [FK_LikeOrDislike_Publication] FOREIGN KEY([fkPublication])
REFERENCES [dbo].[Publication] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikeOrDislike] CHECK CONSTRAINT [FK_LikeOrDislike_Publication]
GO
ALTER TABLE [dbo].[LikeOrDislike]  WITH CHECK ADD  CONSTRAINT [FK_LikeOrDislike_User] FOREIGN KEY([fkUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[LikeOrDislike] CHECK CONSTRAINT [FK_LikeOrDislike_User]
GO
ALTER TABLE [dbo].[Publication]  WITH CHECK ADD  CONSTRAINT [FK_Publication_User] FOREIGN KEY([fkUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Publication] CHECK CONSTRAINT [FK_Publication_User]
GO
USE [master]
GO
ALTER DATABASE [MyArtBD] SET  READ_WRITE 
GO
