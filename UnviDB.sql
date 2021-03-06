USE [master]
GO
/****** Object:  Database [UnivDB]    Script Date: 8/22/2021 3:34:50 AM ******/
CREATE DATABASE [UnivDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UnivDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UnivDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UnivDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UnivDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UnivDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UnivDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UnivDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnivDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnivDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnivDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnivDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnivDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UnivDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnivDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnivDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnivDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnivDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnivDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnivDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnivDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnivDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UnivDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnivDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnivDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnivDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnivDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnivDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnivDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnivDB] SET RECOVERY FULL 
GO
ALTER DATABASE [UnivDB] SET  MULTI_USER 
GO
ALTER DATABASE [UnivDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnivDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnivDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnivDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UnivDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UnivDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UnivDB', N'ON'
GO
ALTER DATABASE [UnivDB] SET QUERY_STORE = OFF
GO
USE [UnivDB]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 8/22/2021 3:34:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[Material] [nvarchar](50) NULL,
	[UnvId] [int] NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/22/2021 3:34:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[Collage] [nvarchar](50) NULL,
	[Average] [float] NULL,
	[UnvId] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 8/22/2021 3:34:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Established] [datetime] NULL,
	[Logo] [nvarchar](50) NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lecturer] ON 

INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (2, N'Maryam', 44, N'Female', N'Archaeology and Anthropology', 15, N'maryam@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (3, N'sami', 66, N'Male', N'Physics', 4, N'sami@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (4, N'hosam', 77, N'Male', N'Chemistry', 18, N'hosam@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (7, N'Mona', 77, N'Female', N'Engineering Science', 17, N'mona@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (10, N'Fadi', 77, N'Male', N'Earth Sciences (Geology)', 6, N'fadi@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (11, N'Salwa', 74, N'Female', N'History and Economics', 14, N'salwa@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (12, N'Malik', 56, N'Male', N'Materials Science', 15, N'malik@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (13, N'Hiba', 85, N'Female', N'Chemistry', 16, N'hiba@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (14, N'Malak', 49, N'Female', N'Archaeology and Anthropology', 17, N'malak@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (15, N'Kifah', 74, N'Male', N'Archaeology and Anthropology', 18, N'kifah@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (16, N'Saif', 44, N'Male', N'Computer Science', 17, N'saif@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (17, N'Hani', 77, N'Male', N'Materials Science', 16, N'hani@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (18, N'Adham', 66, N'Male', N'Biomedical Sciences', 14, N'adham@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (19, N'Mahmoud', 85, N'Male', N'Computer Science', 18, N'mahmoud@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (20, N'Sanaa', 54, N'Female', N'Materials Science', 17, N'ssanaa@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (21, N'Zaid', 44, N'Male', N'Mathematics', 6, N'Zaid@gmail.com', N'123456')
INSERT [dbo].[Lecturer] ([Id], [Name], [Age], [Gender], [Material], [UnvId], [Email], [Password]) VALUES (22, N'Farah', 55, N'Male', N'Economics and Management', 16, N'Farah@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Lecturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (2, N'Ahmed', 30, N'Male', N'Arts & Humanities', 88, 6)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (4, N'sawsan', 22, N'Female', N'Medicine & Health', 95, 17)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (5, N'Firas', 23, N'Male', N'Arts & Humanities', 66, 6)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (7, N'mona', 22, N'Female', N'Medicine & Health', 77, 14)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (8, N'Farah', 25, N'Female', N'Science & Technology', 77, 6)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (9, N'khaled', 23, N'Male', N'Language & Cultural', 58, 14)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (10, N'Marah', 22, N'Female', N'Engineering', 96, 15)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (11, N'Fawaz', 29, N'Male', N'Science & Technology', 79, 16)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (12, N'Samya', 26, N'Female', N'Business & Social Sciences', 84, 17)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (13, N'Fatima', 25, N'Female', N'Medicine & Health', 83, 18)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (14, N'Mostafa', 22, N'Male', N'Engineering', 88, 17)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (15, N'Suheer', 23, N'Female', N'Language & Cultural', 77, 16)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (16, N'Ayoub', 22, N'Male', N'Arts & Humanities', 75, 14)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (17, N'Ibrahim', 22, N'Male', N'Business & Social Sciences', 66, 6)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (18, N'Huda', 28, N'Female', N'Language & Cultural', 77, 16)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Gender], [Collage], [Average], [UnvId]) VALUES (19, N'Farouq', 22, N'Male', N'Language & Cultural', 66, 14)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[University] ON 

INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (4, N'Birzeit University', N'Birzeit', CAST(N'1975-01-01T00:00:00.000' AS DateTime), N'~/Images/Birzeit.jpg')
INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (6, N'An-Najah National University', N'Nablus', CAST(N'1977-01-01T00:00:00.000' AS DateTime), N'~/Images/AL-Najah.jfif')
INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (14, N'Al-Quds University', N'Jerusalem', CAST(N'1984-01-01T00:00:00.000' AS DateTime), N'~/Images/Quds.png')
INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (15, N'Bethlehem University', N'Bethlehem ', CAST(N'1973-01-01T00:00:00.000' AS DateTime), N'~/Images/Bethlehem.jpg')
INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (16, N'Arab American University', N'Jenin', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'~/Images/ArabicAmerican.jpg')
INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (17, N'Palestine Polytechnic University', N'Hebron', CAST(N'1999-01-01T00:00:00.000' AS DateTime), N'~/Images/Hebron.png')
INSERT [dbo].[University] ([Id], [Name], [Address], [Established], [Logo]) VALUES (18, N'Palestine Technical University Kadoorie', N'Tulkarm', CAST(N'1930-01-01T00:00:00.000' AS DateTime), N'~/Images/Khadoori.jfif')
SET IDENTITY_INSERT [dbo].[University] OFF
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_University] FOREIGN KEY([UnvId])
REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_University]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_University] FOREIGN KEY([UnvId])
REFERENCES [dbo].[University] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_University]
GO
USE [master]
GO
ALTER DATABASE [UnivDB] SET  READ_WRITE 
GO
