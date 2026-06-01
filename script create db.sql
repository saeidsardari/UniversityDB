USE [master]
GO
/****** Object:  Database [university]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[Fields]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[Lessons]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[Presentation]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[Professors]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[Scores]    Script Date: 6/1/2026 7:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[ScoreId] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NULL,
	[StudentId] [int] NULL,
	[PresentationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[Terms]    Script Date: 6/1/2026 7:56:00 AM ******/
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
/****** Object:  Table [dbo].[UnitSelection]    Script Date: 6/1/2026 7:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitSelection](
	[UnitSelectionId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[PresentationId] [int] NULL,
	[TermId] [int] NULL,
PRIMARY KEY CLUSTERED 
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
SET IDENTITY_INSERT [dbo].[Scores] ON 
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (1, 20, 1, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (2, 20, 1, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (3, 20, 2, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (4, 20, 3, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (5, 20, 4, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (6, 20, 5, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (7, 20, 6, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (8, 20, 7, 1)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (9, 19, 2, 2)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (10, 19, 3, 2)
GO
INSERT [dbo].[Scores] ([ScoreId], [Score], [StudentId], [PresentationId]) VALUES (12, 18, 4, 8)
GO
SET IDENTITY_INSERT [dbo].[Scores] OFF
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
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (16, 1, 1, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (17, 1, 2, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (18, 2, 1, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (19, 2, 2, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (20, 1, 8, 2)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (21, 1, 9, 2)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (22, 3, 10, 2)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (23, 3, 11, 2)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (24, 3, 12, 2)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (25, 4, 13, 2)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (26, 3, 1, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (27, 3, 17, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (28, 1, 18, 1)
GO
INSERT [dbo].[UnitSelection] ([UnitSelectionId], [StudentId], [PresentationId], [TermId]) VALUES (29, 1, 19, 1)
GO
SET IDENTITY_INSERT [dbo].[UnitSelection] OFF
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
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_p_s] FOREIGN KEY([PresentationId])
REFERENCES [dbo].[Presentation] ([PresentationId])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_p_s]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_s_s] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_s_s]
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
