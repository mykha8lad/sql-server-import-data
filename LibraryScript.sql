USE [HomeWorks]
GO
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TS1\MSSQL\DATA\Library.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TS1\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 12/21/2020 4:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Authors__3213E83FB050A18E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[pages] [int] NOT NULL,
	[year_press] [int] NOT NULL,
	[id_theme] [int] NOT NULL,
	[id_category] [int] NOT NULL,
	[id_author] [int] NOT NULL,
	[id_publishment] [int] NOT NULL,
	[comment] [nvarchar](50) NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__Books__3213E83F47B37243] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Categori__3213E83F6CB94F4A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Departme__3213E83F71C95102] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_department] [int] NOT NULL,
 CONSTRAINT [PK__Groups__3213E83FD538E9C2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Libs__3213E83F3EB3017D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Press__3213E83F769C9C60] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Cards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_student] [int] NOT NULL,
	[id_book] [int] NOT NULL,
	[date_out] [nvarchar](50) NULL,
	[date_in] [nvarchar](50) NULL,
	[id_librarian] [int] NOT NULL,
 CONSTRAINT [PK__S_Cards__3213E83F7E21590D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[id_group] [int] NOT NULL,
	[term] [int] NULL,
 CONSTRAINT [PK__Students__3213E83FE3F27931] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Cards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_teacher] [int] NULL,
	[id_book] [int] NULL,
	[date_out] [nvarchar](50) NULL,
	[date_in] [nvarchar](50) NULL,
	[id_librarian] [int] NULL,
 CONSTRAINT [PK__T_Cards__3213E83F4446C1D5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[id_department] [int] NULL,
 CONSTRAINT [PK__Teachers__3213E83F986F87EF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK__Themes__3213E83FDD8BA9E4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (1, N'Джеймс Р.', N'Грофф')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (2, N'Сергей', N'Никольский')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (3, N'Михаил', N'Маров')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (4, N'Борис', N'Карпов')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (5, N'Алексей', N'Архангельский')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (6, N'Владимир', N'Король')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (7, N'Евангелос', N'Петрусос')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (8, N'Маркус', N'Херхагер')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (9, N'Павел', N'Гарбар')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (10, N'Александр', N'Матросов')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (11, N'Людмила', N'Омельченко')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (12, N'Кевин', N'Рейчард')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (13, N'Ольга', N'Кокорева')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (14, N'Марк', N'Браун')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (15, N'Джефри', N'Рихтер')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (16, N'Кристофер', N'Дейт')
INSERT [dbo].[Author] ([id], [first_name], [last_name]) VALUES (17, N'Бьярн', N'Страуструп')
SET IDENTITY_INSERT [dbo].[Author] OFF
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (1, N'SQL', 816, 2018, 1, 1, 1, 2, N'2-е издание', 2)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (2, N'3D Studio Max 7', 640, 2017, 3, 6, 3, 3, N'Учебный курс', 3)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (3, N'5 компонентов библиотеки STL', 272, 2015, 2, 4, 5, 4, N'Компоненты', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (4, N'Visual Basic 13', 416, 2016, 2, 5, 4, 3, N'Специальный справочник', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (5, N'Курс математического анализа', 328, 2019, 4, 2, 2, 5, N'1-й том', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (6, N'Библиотека C++ Builder: 70 компонентов ввода/вывода информации', 288, 2014, 2, 3, 5, 4, N'Компоненты', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (7, N'Интегрированная среда разработки', 272, 2001, 2, 3, 5, 4, N'Среда разработки', 2)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (8, N'Русская справка по Delphi и Object Pascal', 32, 2007, 2, 4, 5, 4, N'Справочник', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (9, N'Visual Basic for Applications', 488, 2009, 2, 5, 6, 6, N'Справочник с примерами', 3)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (10, N'Visual Basic for Dummies', 576, 2001, 2, 5, 7, 2, N'Руководство разработчика 1-й том', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (11, N'Mathcad 2020', 416, 2019, 5, 7, 8, 2, N'Полное руководство', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (12, N'Novell GroupWise система электронной почты и коллективной работы', 480, 2001, 6, 8, 9, 2, N'Сетевые пакеты', 2)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (13, N'Реестр Windows 10', 352, 2019, 9, 12, 13, 2, N'Руководство для профессионалов', 4)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (14, N'Unix справочник', 384, 2003, 9, 13, 12, 3, N'Справочное руководство', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (15, N'Самоучитель Visual Studio 2019', 512, 2019, 1, 11, 11, 2, N'Самоучитель', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (16, N'Самоучитель 1C', 512, 2005, 7, 10, 11, 2, N'Самоучитель', 1)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (17, N'Самоучитель Perl', 432, 2009, 2, 9, 10, 2, N'Самоучитель', 2)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (18, N'HTML 5.1', 1040, 2019, 7, 14, 14, 2, N'Руководство', 5)
INSERT [dbo].[Book] ([id], [name], [pages], [year_press], [id_theme], [id_category], [id_author], [id_publishment], [comment], [quantity]) VALUES (19, N'CLR via C#. Программирование на платформе Microsoft .NET Framework 4.5 на языке C#', 896, 2013, 2, 5, 15, 4, N'Руководство', 8)
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Язык SQL')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Математический анализ')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'C++ Builder')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Delphi')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Visual Basic')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'3D Studio Max')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Mathcad')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Novell')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Perl')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'FrontPage')
INSERT [dbo].[Category] ([id], [name]) VALUES (11, N'Visual FoxPro')
INSERT [dbo].[Category] ([id], [name]) VALUES (12, N'Windows 2000')
INSERT [dbo].[Category] ([id], [name]) VALUES (13, N'Unix')
INSERT [dbo].[Category] ([id], [name]) VALUES (14, N'HTML')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([id], [name]) VALUES (1, N'Разработки программного обеспечения')
INSERT [dbo].[Department] ([id], [name]) VALUES (2, N'Компьютерной графики и дизайна')
INSERT [dbo].[Department] ([id], [name]) VALUES (3, N'Железа и Администрирования')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (2, N'ПВ912', 1)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (3, N'КН-201', 1)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (4, N'КН-202', 1)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (5, N'КНД-191', 2)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (6, N'КНД-192', 2)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (7, N'КНД-193', 2)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (8, N'18П2', 1)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (9, N'18А', 3)
INSERT [dbo].[Group] ([id], [name], [id_department]) VALUES (10, N'19Д', 2)
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Librarian] ON 

INSERT [dbo].[Librarian] ([id], [first_name], [last_name]) VALUES (1, N'Сергей', N'Максименко')
INSERT [dbo].[Librarian] ([id], [first_name], [last_name]) VALUES (2, N'Дмитрий', N'Чеботарев')
SET IDENTITY_INSERT [dbo].[Librarian] OFF
SET IDENTITY_INSERT [dbo].[Publishment] ON 

INSERT [dbo].[Publishment] ([id], [name]) VALUES (1, N'DiaSoft')
INSERT [dbo].[Publishment] ([id], [name]) VALUES (2, N'BHV')
INSERT [dbo].[Publishment] ([id], [name]) VALUES (3, N'Питер')
INSERT [dbo].[Publishment] ([id], [name]) VALUES (4, N'Бином')
INSERT [dbo].[Publishment] ([id], [name]) VALUES (5, N'Наука')
INSERT [dbo].[Publishment] ([id], [name]) VALUES (6, N'Кудиц-Образ')
INSERT [dbo].[Publishment] ([id], [name]) VALUES (7, N'Диалектика')
SET IDENTITY_INSERT [dbo].[Publishment] OFF
SET IDENTITY_INSERT [dbo].[S_Cards] ON 

INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (1, 2, 1, N'2019-05-17 00:00:00', N'2019-06-12 00:00:00', 1)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (2, 17, 18, N'2019-05-18 00:00:00', NULL, 1)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (3, 6, 3, N'2019-04-21 00:00:00', NULL, 2)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (4, 21, 4, N'2019-03-26 00:00:00', NULL, 2)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (5, 3, 1, N'2019-05-07 00:00:00', N'2019-04-12 00:00:00', 1)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (6, 7, 11, N'2019-06-02 00:00:00', NULL, 2)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (7, 16, 14, N'2019-04-05 00:00:00', NULL, 1)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (8, 11, 6, N'2019-05-05 00:00:00', NULL, 2)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (9, 17, 2, N'2019-10-01 00:00:00', NULL, 2)
INSERT [dbo].[S_Cards] ([id], [id_student], [id_book], [date_out], [date_in], [id_librarian]) VALUES (10, 10, 13, N'2019-05-05 00:00:00', NULL, 1)
SET IDENTITY_INSERT [dbo].[S_Cards] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (2, N'Вячеслав', N'Зезик', 3, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (3, N'Ольга', N'Мантуляк', 4, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (4, N'Ольга', N'Хренова', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (5, N'Ольга', N'Медведева', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (6, N'Галина', N'Инащенко', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (7, N'Юрий', N'Минае', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (8, N'Юрий', N'Домовесов', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (9, N'Руслан', N'Ярмолович', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (10, N'Игорь', N'Удовик', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (11, N'Петр', N'Кацевич', 8, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (12, N'Евгений', N'Бурцев', 3, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (13, N'Флора', N'Побирская', 3, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (14, N'Наталья', N'Гридина', 3, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (15, N'Елена', N'Акусова', 3, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (16, N'Светлана', N'Горшкова', 9, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (17, N'Александр', N'Любенко', 10, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (18, N'Евгения', N'Цимбалюк', 10, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (19, N'Ольга', N'Болячевская', 5, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (20, N'Станислав', N'Плешаков', 7, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (21, N'Елена', N'Таран', 4, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (22, N'Денис', N'Рогачевский', 2, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (23, N'Оксана', N'Тихонова', 6, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (24, N'Петр', N'Максимов', 3, 2)
INSERT [dbo].[Student] ([id], [first_name], [last_name], [id_group], [term]) VALUES (25, N'Ирина', N'Стогнеева', 5, 2)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[T_Cards] ON 

INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (1, 2, 13, N'2019-01-01 00:00:00', N'2019-07-04 00:00:00', 1)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (2, 10, 2, N'2019-03-03 00:00:00', NULL, 1)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (3, 6, 12, N'2019-06-04 00:00:00', NULL, 2)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (4, 3, 1, N'2019-09-05 00:00:00', NULL, 1)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (5, 8, 8, N'2019-05-05 00:00:00', NULL, 2)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (6, 5, 18, N'2019-02-02 00:00:00', NULL, 2)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (7, 12, 17, N'2019-03-04 00:00:00', NULL, 1)
INSERT [dbo].[T_Cards] ([id], [id_teacher], [id_book], [date_out], [date_in], [id_librarian]) VALUES (8, 4, 18, N'2019-07-02 00:00:00', NULL, 1)
SET IDENTITY_INSERT [dbo].[T_Cards] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (1, N'Виталий', N'Полянский', 1)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (2, N'Александр', N'Загоруйко', 1)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (3, N'Елена', N'Шишковец', 2)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (4, N'Александр', N'Марущак', 2)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (5, N'Дмитрий', N'Лях', 2)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (6, N'Вадим', N'Ткаченко', 3)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (7, N'Александр', N'Дудник', 3)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (8, N'Иван', N'Погудин', 1)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (9, N'Дмитрий', N'Барабаш', 1)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (10, N'Анатолий', N'Выклюк', 2)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (11, N'Олег', N'Чёрный', 3)
INSERT [dbo].[Teacher] ([id], [first_name], [last_name], [id_department]) VALUES (12, N'Александр', N'Артёмов', 1)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET IDENTITY_INSERT [dbo].[Theme] ON 

INSERT [dbo].[Theme] ([id], [name]) VALUES (1, N'Базы данных')
INSERT [dbo].[Theme] ([id], [name]) VALUES (2, N'Программирование')
INSERT [dbo].[Theme] ([id], [name]) VALUES (3, N'Графические пакеты')
INSERT [dbo].[Theme] ([id], [name]) VALUES (4, N'Высшая математика')
INSERT [dbo].[Theme] ([id], [name]) VALUES (5, N'Математические пакеты')
INSERT [dbo].[Theme] ([id], [name]) VALUES (6, N'Сети')
INSERT [dbo].[Theme] ([id], [name]) VALUES (7, N'Web-дизайн')
INSERT [dbo].[Theme] ([id], [name]) VALUES (8, N'Windows')
INSERT [dbo].[Theme] ([id], [name]) VALUES (9, N'Операционные системы')
SET IDENTITY_INSERT [dbo].[Theme] OFF
ALTER TABLE [dbo].[Author] ADD  CONSTRAINT [DF__Authors__first_n__108B795B]  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[Author] ADD  CONSTRAINT [DF__Authors__last_na__117F9D94]  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__name__145C0A3F]  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__pages__15502E78]  DEFAULT (NULL) FOR [pages]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__year_pres__164452B1]  DEFAULT (NULL) FOR [year_press]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__id_themes__173876EA]  DEFAULT (NULL) FOR [id_theme]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__id_catego__182C9B23]  DEFAULT (NULL) FOR [id_category]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__id_author__1920BF5C]  DEFAULT (NULL) FOR [id_author]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__id_press__1A14E395]  DEFAULT (NULL) FOR [id_publishment]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__comment__1B0907CE]  DEFAULT (NULL) FOR [comment]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF__Books__quantity__1BFD2C07]  DEFAULT (NULL) FOR [quantity]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Categories__name__1ED998B2]  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF__Department__name__21B6055D]  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF__Groups__name__276EDEB3]  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF__Groups__id_facul__286302EC]  DEFAULT (NULL) FOR [id_department]
GO
ALTER TABLE [dbo].[Librarian] ADD  CONSTRAINT [DF__Libs__first_name__2B3F6F97]  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[Librarian] ADD  CONSTRAINT [DF__Libs__last_name__2C3393D0]  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[Publishment] ADD  CONSTRAINT [DF__Press__name__2F10007B]  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [DF__S_Cards__id_stud__31EC6D26]  DEFAULT (NULL) FOR [id_student]
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [DF__S_Cards__id_book__32E0915F]  DEFAULT (NULL) FOR [id_book]
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [DF__S_Cards__date_ou__33D4B598]  DEFAULT (NULL) FOR [date_out]
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [DF__S_Cards__date_in__34C8D9D1]  DEFAULT (NULL) FOR [date_in]
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [DF__S_Cards__id_lib__35BCFE0A]  DEFAULT (NULL) FOR [id_librarian]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF__Students__first___398D8EEE]  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF__Students__last_n__3A81B327]  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF__Students__id_gro__3B75D760]  DEFAULT (NULL) FOR [id_group]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF__Students__term__3C69FB99]  DEFAULT (NULL) FOR [term]
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [DF__T_Cards__id_Teac__3F466844]  DEFAULT (NULL) FOR [id_teacher]
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [DF__T_Cards__id_Book__403A8C7D]  DEFAULT (NULL) FOR [id_book]
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [DF__T_Cards__date_ou__412EB0B6]  DEFAULT (NULL) FOR [date_out]
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [DF__T_Cards__date_in__4222D4EF]  DEFAULT (NULL) FOR [date_in]
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [DF__T_Cards__id_lib__4316F928]  DEFAULT (NULL) FOR [id_librarian]
GO
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [DF__Teachers__first___45F365D3]  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [DF__Teachers__last_n__46E78A0C]  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [DF__Teachers__id_dep__47DBAE45]  DEFAULT (NULL) FOR [id_department]
GO
ALTER TABLE [dbo].[Theme] ADD  CONSTRAINT [DF__Themes__name__4AB81AF0]  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([id_author])
REFERENCES [dbo].[Author] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Books_Press] FOREIGN KEY([id_publishment])
REFERENCES [dbo].[Publishment] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Books_Press]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Books_Themes] FOREIGN KEY([id_theme])
REFERENCES [dbo].[Theme] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Books_Themes]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Departments] FOREIGN KEY([id_department])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Groups_Departments]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [FK_S_Cards_Books] FOREIGN KEY([id_book])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [FK_S_Cards_Books]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [FK_S_Cards_Libs] FOREIGN KEY([id_librarian])
REFERENCES [dbo].[Librarian] ([id])
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [FK_S_Cards_Libs]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [FK_S_Cards_Students] FOREIGN KEY([id_student])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [FK_S_Cards_Students]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([id_group])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_Groups]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [FK_T_Cards_Books] FOREIGN KEY([id_book])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [FK_T_Cards_Books]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [FK_T_Cards_Libs] FOREIGN KEY([id_librarian])
REFERENCES [dbo].[Librarian] ([id])
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [FK_T_Cards_Libs]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [FK_T_Cards_Teachers] FOREIGN KEY([id_teacher])
REFERENCES [dbo].[Teacher] ([id])
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [FK_T_Cards_Teachers]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Departments] FOREIGN KEY([id_department])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teachers_Departments]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
