USE [master]
GO
/****** Object:  Database [university]    Script Date: 6/6/2026 7:58:43 AM ******/
CREATE DATABASE [university]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'university', FILENAME = N'C:\Users\s.sardarizadeh\university.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'university_log', FILENAME = N'C:\Users\s.sardarizadeh\university_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [university].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [university] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [university] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [university] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [university] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [university] SET ARITHABORT OFF 
GO
ALTER DATABASE [university] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [university] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [university] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [university] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [university] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [university] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [university] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [university] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [university] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [university] SET  ENABLE_BROKER 
GO
ALTER DATABASE [university] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [university] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [university] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [university] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [university] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [university] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [university] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [university] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [university] SET  MULTI_USER 
GO
ALTER DATABASE [university] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [university] SET DB_CHAINING OFF 
GO
ALTER DATABASE [university] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [university] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [university] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [university] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [university] SET QUERY_STORE = ON
GO
ALTER DATABASE [university] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [university]
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Prerequisite] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentation]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentation](
	[PresentationId] [int] IDENTITY(1,1) NOT NULL,
	[professorId] [int] NULL,
	[LessonId] [int] NULL,
	[TermId] [int] NULL,
	[fieldId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PresentationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professors]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[fieldId] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terms]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[TermId] [int] IDENTITY(1,1) NOT NULL,
	[year] [int] NULL,
	[period] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitSelection]    Script Date: 6/6/2026 7:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitSelection](
	[UnitSelectionId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[PresentationId] [int] NOT NULL,
	[TermId] [int] NOT NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK__UnitSele__CD53C78958D0F303] PRIMARY KEY CLUSTERED 
(
	[UnitSelectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fields] ON 
GO
INSERT [dbo].[Fields] ([FieldId], [Title]) VALUES (1, N'it')
GO
INSERT [dbo].[Fields] ([FieldId], [Title]) VALUES (2, N'accunting')
GO
INSERT [dbo].[Fields] ([FieldId], [Title]) VALUES (3, N'software')
GO
INSERT [dbo].[Fields] ([FieldId], [Title]) VALUES (4, N'Industries')
GO
INSERT [dbo].[Fields] ([FieldId], [Title]) VALUES (5, N'hardware')
GO
SET IDENTITY_INSERT [dbo].[Fields] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 
GO
INSERT [dbo].[Lessons] ([LessonId], [Title], [Prerequisite]) VALUES (1, N'c#', N'')
GO
INSERT [dbo].[Lessons] ([LessonId], [Title], [Prerequisite]) VALUES (2, N'database', N'')
GO
INSERT [dbo].[Lessons] ([LessonId], [Title], [Prerequisite]) VALUES (3, N'network', N'')
GO
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentation] ON 
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (1, 1, 2, 1, 1)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (2, 1, 1, 1, 1)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (8, 2, 3, 2, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (9, 2, 2, 2, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (10, 1, 1, 2, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (11, 1, 1, 2, 1)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (12, 3, 3, 2, 1)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (13, 3, 3, 2, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (14, 1, 3, 4, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (15, 1, 3, 5, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (16, 3, 3, 5, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (17, 2, 3, 5, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (18, 2, 3, 6, 2)
GO
INSERT [dbo].[Presentation] ([PresentationId], [professorId], [LessonId], [TermId], [fieldId]) VALUES (19, 2, 3, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Presentation] OFF
GO
SET IDENTITY_INSERT [dbo].[Professors] ON 
GO
INSERT [dbo].[Professors] ([ProfessorId], [Name]) VALUES (1, N'sajad')
GO
INSERT [dbo].[Professors] ([ProfessorId], [Name]) VALUES (2, N'sohi')
GO
INSERT [dbo].[Professors] ([ProfessorId], [Name]) VALUES (3, N'poor')
GO
SET IDENTITY_INSERT [dbo].[Professors] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (1, N'saeid', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (2, N'sina', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (3, N'bamdad', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (4, N'jasim', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (5, N'javadi', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (6, N'kazemi', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (7, N'akhlaghi', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (8, N'meshkin', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (9, N'kasaee', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (10, N'manoshehr', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (11, N'karimi', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (12, N'meshgin', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (13, N'aref', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (14, N'asef', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [fieldId]) VALUES (15, N'ahmad', 2)
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Terms] ON 
GO
INSERT [dbo].[Terms] ([TermId], [year], [period]) VALUES (1, 1405, 1)
GO
INSERT [dbo].[Terms] ([TermId], [year], [period]) VALUES (2, 1405, 2)
GO
INSERT [dbo].[Terms] ([TermId], [year], [period]) VALUES (3, 1405, 3)
GO
INSERT [dbo].[Terms] ([TermId], [year], [period]) VALUES (4, 1404, 3)
GO
INSERT [dbo].[Terms] ([TermId], [year], [period]) VALUES (5, 1404, 2)
GO
INSERT [dbo].[Terms] ([TermId], [year], [period]) VALUES (6, 1404, 1)
GO
SET IDENTITY_INSERT [dbo].[Terms] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitSelection] ON 
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (16, 1, 1, 1, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (17, 1, 2, 1, 19)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (18, 2, 1, 1, 18)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (19, 2, 2, 1, 17)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (20, 1, 8, 2, 16)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (21, 1, 9, 2, 15)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (22, 3, 10, 2, 14)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (23, 3, 11, 2, 13)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (24, 3, 12, 2, 12)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (25, 4, 13, 2, 11)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (26, 3, 1, 1, 10)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (27, 3, 17, 1, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (28, 1, 18, 1, 16)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (29, 1, 19, 1, 13)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (30, 1, 19, 3, 14)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (31, 1, 18, 4, 12)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (32, 1, 15, 5, 17)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (33, 1, 15, 6, 18)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (34, 2, 15, 6, 18)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (35, 2, 15, 5, 19)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (36, 2, 15, 4, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (37, 2, 15, 3, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (38, 3, 16, 3, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (39, 3, 16, 2, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (40, 3, 16, 1, 20)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (41, 3, 16, 4, 19)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (42, 3, 16, 5, 18)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (43, 4, 14, 4, 17)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (44, 4, 14, 3, 15)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (45, 4, 14, 2, 14)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (46, 4, 14, 1, 19)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (47, 4, 14, 5, 15)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId], [Score]) VALUES (48, 4, 14, 6, 14)
GO
SET IDENTITY_INSERT [dbo].[UnitSelection] OFF
GO
/****** Object:  Index [Uniq_key_sddsd]    Script Date: 6/6/2026 7:58:44 AM ******/
ALTER TABLE [dbo].[UnitSelection] ADD  CONSTRAINT [Uniq_key_sddsd] UNIQUE NONCLUSTERED 
(
	[StudentId] ASC,
	[PresentationId] ASC,
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [FK_f_p] FOREIGN KEY([fieldId])
REFERENCES [dbo].[Fields] ([FieldId])
GO
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [FK_f_p]
GO
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [FK_l_p] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [FK_l_p]
GO
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [FK_p_p] FOREIGN KEY([professorId])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [FK_p_p]
GO
ALTER TABLE [dbo].[Presentation]  WITH CHECK ADD  CONSTRAINT [FK_t_p] FOREIGN KEY([TermId])
REFERENCES [dbo].[Terms] ([TermId])
GO
ALTER TABLE [dbo].[Presentation] CHECK CONSTRAINT [FK_t_p]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_field_Students] FOREIGN KEY([fieldId])
REFERENCES [dbo].[Fields] ([FieldId])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_field_Students]
GO
ALTER TABLE [dbo].[UnitSelection]  WITH CHECK ADD  CONSTRAINT [FK_p_u] FOREIGN KEY([PresentationId])
REFERENCES [dbo].[Presentation] ([PresentationId])
GO
ALTER TABLE [dbo].[UnitSelection] CHECK CONSTRAINT [FK_p_u]
GO
ALTER TABLE [dbo].[UnitSelection]  WITH CHECK ADD  CONSTRAINT [FK_s_u] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[UnitSelection] CHECK CONSTRAINT [FK_s_u]
GO
ALTER TABLE [dbo].[UnitSelection]  WITH CHECK ADD  CONSTRAINT [FK_t_u] FOREIGN KEY([TermId])
REFERENCES [dbo].[Terms] ([TermId])
GO
ALTER TABLE [dbo].[UnitSelection] CHECK CONSTRAINT [FK_t_u]
GO
USE [master]
GO
ALTER DATABASE [university] SET  READ_WRITE 
GO
