USE [master]
GO
/****** Object:  Database [Eos]    Script Date: 3/24/2023 12:32:18 AM ******/
CREATE DATABASE [Eos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Eos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Eos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Eos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Eos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Eos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Eos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Eos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Eos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Eos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Eos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Eos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Eos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Eos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Eos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Eos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Eos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Eos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Eos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Eos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Eos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Eos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Eos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Eos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Eos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Eos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Eos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Eos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Eos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Eos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Eos] SET  MULTI_USER 
GO
ALTER DATABASE [Eos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Eos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Eos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Eos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Eos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Eos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Eos] SET QUERY_STORE = ON
GO
ALTER DATABASE [Eos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Eos]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 3/24/2023 12:32:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[exam_id] [varchar](50) NOT NULL,
	[exam_name] [varchar](255) NULL,
	[subject] [varchar](255) NULL,
	[time_limit] [int] NULL,
	[image] [text] NULL,
 CONSTRAINT [PK__Exams__9C8C7BE9A17C9B4C] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/24/2023 12:32:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [varchar](50) NULL,
	[text] [text] NULL,
	[option_1] [varchar](255) NULL,
	[option_2] [varchar](255) NULL,
	[option_3] [varchar](255) NULL,
	[option_4] [varchar](255) NULL,
	[correct] [varchar](255) NULL,
 CONSTRAINT [PK__Question__2EC2154925F757F0] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 3/24/2023 12:32:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[exam_id] [varchar](50) NULL,
	[score] [float] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
 CONSTRAINT [PK__Results__AFB3C316D3E89A0A] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/24/2023 12:32:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
 CONSTRAINT [PK__Users__B9BE370FC9983D85] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Exams] ([exam_id], [exam_name], [subject], [time_limit], [image]) VALUES (N'JPD113_2023_PT3', N'Japanese', N'JPD113', 40, N'https://jccc.on.ca/sites/default/files/styles/slide_16x9/public/imgs/events/japanese-language-class-16-9.jpg?itok=7kNpkOnv')
INSERT [dbo].[Exams] ([exam_id], [exam_name], [subject], [time_limit], [image]) VALUES (N'MAS291_2023_PT3', N'Probability and Statistics', N'MAS291', 40, N'https://dezyre.gumlet.io/images/blog/probability-and-statistics-for-machine-learning/image_73439737241632916840550.png?w=400&dpr=2.6')
INSERT [dbo].[Exams] ([exam_id], [exam_name], [subject], [time_limit], [image]) VALUES (N'PRJ301_FE_2023_1', N'Java Web Application Development - Final', N'PRJ301', 60, N'https://img.freepik.com/free-vector/chalkboard-with-math-elements_1411-88.jpg')
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (7, N'PRJ301_FE_2023_1', N'Which method returns the actual length of the request sent by the client? Select one:', N'getServerName()', N'getParameter()', N'None of the others', N'getContentLength()', N'getContentLength()')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (8, N'PRJ301_FE_2023_1', N'Which scripting element lets you define methods or fields that get inse
		   rted into the main body of the servlet class (outside of the _jspService meth
		   od that is called by service to process the request)? Select one:', N'expression', N'scriptlet', N'None of the others', N'declaration', N'expression')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (9, N'PRJ301_FE_2023_1', N'A basketball player has made 95% of his foul shots during the season. If he s
		   hoots 3 foul shots in tonights game, what is the probability that he makes all of the shots?', N'0.09', N'0.857', N'0.343', N'0.21', N'0.21')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (10, N'PRJ301_FE_2023_1', N'A survey of senior citizens at a doctors office shows that 65% take blood pressure-lowering 
		   medication, 38% take cholesterol-lowering medication, and 7% take both medications. What is 
		   the probability that a senior citizen takes either blood pressure-lowering or cholesterol-lowering medication?', N'0.14', N'0.90', N'0.85', N'0.96', N'0.96')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (11, N'PRJ301_FE_2023_1', N'For two events A and B, P(A) = 0.4, P(B) = 0.3, and P(A and B) = 0. It follows that A and B are', N'disjoint but not independent', N'neither disjoint nor independent', N'both disjoint and independent', N'complementary', N'both disjoint and independent')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (12, N'PRJ301_FE_2023_1', N'The collection and summarization of the socioeconomic and physical characteristics of the employees of a particular firm is an example of', N'a parameter', N'inferential statistics', N'a statistic', N'descriptive statistics', N'descriptive statistics')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (13, N'PRJ301_FE_2023_1', N'Which of the followings is a correct syntax of the method that is used to get the initialized parameter in ServletContext or ServletConfig? Select one:', N'String getContextParameter(String name);', N'All of the others.', N'String getInitParameter(String name);', N'String getInitializedParameter(String name);', N'String getInitParameter(String name);')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (14, N'PRJ301_FE_2023_1', N'To send text outptut in a response, the following method of HttpServletResponse may be used to get the appropriate Writer/Stream object. Select one or more:', N'getWriter', N'getStream', N'getBinaryStream', N'getOutputStream', N'getStream')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (15, N'PRJ301_FE_2023_1', N'Which of the following attributes of the Page directive is used to specify the page to display errors which may occur in the JSP page? Select one:', N'errorPage', N'Error', N'isErrorPage', N'excption', N'errorPage')
INSERT [dbo].[Questions] ([question_id], [exam_id], [text], [option_1], [option_2], [option_3], [option_4], [correct]) VALUES (16, N'PRJ301_FE_2023_1', N'Name the implicit variable available to JSP pages that may be used to access all the other implicit objects. Select one:', N'pageContext', N'request', N'page', N'response', N'pageContext')
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Results] ON 

INSERT [dbo].[Results] ([result_id], [user_id], [exam_id], [score], [start_time], [end_time]) VALUES (91, 2, N'PRJ301_FE_2023_1', 2, CAST(N'2023-03-23T20:49:13.000' AS DateTime), CAST(N'2023-03-23T20:55:13.000' AS DateTime))
INSERT [dbo].[Results] ([result_id], [user_id], [exam_id], [score], [start_time], [end_time]) VALUES (92, NULL, N'PRJ301_FE_2023_1', 2, CAST(N'2023-03-23T20:55:51.000' AS DateTime), CAST(N'2023-03-23T20:56:05.000' AS DateTime))
INSERT [dbo].[Results] ([result_id], [user_id], [exam_id], [score], [start_time], [end_time]) VALUES (93, NULL, N'PRJ301_FE_2023_1', 0, CAST(N'2023-03-24T00:26:03.000' AS DateTime), CAST(N'2023-03-24T00:26:19.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Results] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [fullname]) VALUES (2, N'dangducloi', N'123', N'Dang Duc Loi')
INSERT [dbo].[Users] ([user_id], [username], [password], [fullname]) VALUES (3, N'nguyenhoangminh', N'123', N'Nguyen Hoang Minh')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC572E2496DBB]    Script Date: 3/24/2023 12:32:18 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__F3DBC572E2496DBB] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__exam___4BAC3F29] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exams] ([exam_id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__exam___4BAC3F29]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK__Results__exam_id__52593CB8] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exams] ([exam_id])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK__Results__exam_id__52593CB8]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK__Results__user_id__5165187F] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK__Results__user_id__5165187F]
GO
USE [master]
GO
ALTER DATABASE [Eos] SET  READ_WRITE 
GO
