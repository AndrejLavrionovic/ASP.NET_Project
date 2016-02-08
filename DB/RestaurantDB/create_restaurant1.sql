USE [restaurant]
GO
ALTER TABLE [dbo].[order] DROP CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order] DROP CONSTRAINT [FK_order_starter]
GO
ALTER TABLE [dbo].[order] DROP CONSTRAINT [FK_order_mains]
GO
ALTER TABLE [dbo].[order] DROP CONSTRAINT [FK_order_drinks]
GO
ALTER TABLE [dbo].[order] DROP CONSTRAINT [FK_order_deserts]
GO
ALTER TABLE [dbo].[login] DROP CONSTRAINT [FK_login_user]
GO
/****** Object:  Table [dbo].[user]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[user]
GO
/****** Object:  Table [dbo].[starters]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[starters]
GO
/****** Object:  Table [dbo].[order]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[order]
GO
/****** Object:  Table [dbo].[mains]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[mains]
GO
/****** Object:  Table [dbo].[login]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[login]
GO
/****** Object:  Table [dbo].[drinks]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[drinks]
GO
/****** Object:  Table [dbo].[deserts]    Script Date: 08/02/2016 19:25:36 ******/
DROP TABLE [dbo].[deserts]
GO
USE [master]
GO
/****** Object:  Database [restaurant]    Script Date: 08/02/2016 19:25:36 ******/
DROP DATABASE [restaurant]
GO
/****** Object:  Database [restaurant]    Script Date: 08/02/2016 19:25:36 ******/
CREATE DATABASE [restaurant] ON  PRIMARY 
( NAME = N'restaurant', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\restaurant.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'restaurant_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\restaurant_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [restaurant] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [restaurant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [restaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restaurant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [restaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restaurant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [restaurant] SET  MULTI_USER 
GO
ALTER DATABASE [restaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restaurant] SET DB_CHAINING OFF 
GO
USE [restaurant]
GO
/****** Object:  Table [dbo].[deserts]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deserts](
	[id] [int] IDENTITY(301,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_deserts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[drinks]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[drinks](
	[id] [int] IDENTITY(401,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_drinks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[user_id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](40) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mains]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mains](
	[id] [int] IDENTITY(201,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_mains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[time_date] [timestamp] NOT NULL,
	[starter_id] [int] NULL,
	[main_id] [int] NULL,
	[desert_id] [int] NULL,
	[drinks_id] [int] NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[starters]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[starters](
	[id] [int] IDENTITY(101,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_starters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 08/02/2016 19:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1001,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[age] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address1] [varchar](100) NOT NULL,
	[address2] [varchar](100) NULL,
	[town] [varchar](50) NOT NULL,
	[county] [varchar](50) NOT NULL,
	[zip] [varchar](10) NULL,
	[is_admin] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[deserts] ON 

INSERT [dbo].[deserts] ([id], [name], [description], [price]) VALUES (301, N'Bailey’s Cheesecake', N'Homemade Bailey’s cheesecake, topped with chocolate flakes and severed with a side of cream.', 8.0000)
INSERT [dbo].[deserts] ([id], [name], [description], [price]) VALUES (302, N'Crème Brulee', N'Caramelised Custard', 9.5000)
INSERT [dbo].[deserts] ([id], [name], [description], [price]) VALUES (303, N'Apple Tart and Cream', N'Homemade warm Apple tart served with fresh cream.', 6.5000)
SET IDENTITY_INSERT [dbo].[deserts] OFF
SET IDENTITY_INSERT [dbo].[drinks] ON 

INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (401, N'Tea', N'Medium', 1.5000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (402, N'Tea', N'Large', 2.0000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (403, N'Espresso', N'Single', 1.5000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (404, N'Espresso', N'Double', 2.0000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (405, N'Amerecano', N'Medium', 2.0000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (406, N'Amerecano', N'Large', 2.5000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (407, N'Latte', N'Medium', 3.0000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (408, N'Latte', N'Large', 3.5000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (409, N'Cappuccino', N'Medium', 3.0000)
INSERT [dbo].[drinks] ([id], [name], [type], [price]) VALUES (410, N'Cappuccino', N'Large', 3.5000)
SET IDENTITY_INSERT [dbo].[drinks] OFF
INSERT [dbo].[login] ([user_id], [username], [password]) VALUES (1001, N'g00196984', N'ZqGbpU$8')
INSERT [dbo].[login] ([user_id], [username], [password]) VALUES (1002, N'john.doe@gmit.ie', N'0000')
INSERT [dbo].[login] ([user_id], [username], [password]) VALUES (1003, N'roma', N'1111')
SET IDENTITY_INSERT [dbo].[mains] ON 

INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (201, N'Fresh Cod and Chips', N'Frshly caught Cod seved with a side of chips and tartar sauce.', 14.5000)
INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (202, N'10oz Sirloin Steak', N'Beautiful Irish beef, cooked to order, severed with chunky chips, mushrooms and onions.', 23.9500)
INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (203, N'Chicken and Veg Mexican Torillias', N'Succulent chicken strips, with roasted Veg, severed in homemade Torillias and salsa sauce.', 16.9500)
INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (204, N'Vegetarian Lasagne', N'We use Tender vegetables, a light tomato sauce and lots of cheese make this vegetable lasagne recipe.', 16.5000)
INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (205, N'Chicken Breast Sandwich', N'Succulent chicken breast chargrilled, severed on a homemade patty, with caramelized onions, lettuce, baby tomatoes, melted cheese and homemade garlic mayo. And comes with chunky Chips.', 13.5000)
INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (206, N'Lamb Shanks', N'Beautiful Connemara Lamb Shanks, slow roasted, served with mash potatoes, vegetables and a red wine jus.', 22.5000)
INSERT [dbo].[mains] ([id], [name], [description], [price]) VALUES (207, N'Stuffed Roast Duck', N'Wonderfully prepared Roast duck stuffed with wild.', 22.9500)
SET IDENTITY_INSERT [dbo].[mains] OFF
SET IDENTITY_INSERT [dbo].[starters] ON 

INSERT [dbo].[starters] ([id], [name], [description], [price]) VALUES (101, N'Prawn Cocktail', N'A selection of Galway Bay prawns, marinated in MarieRose sauce and served on a bed of lettuce.', 7.8500)
INSERT [dbo].[starters] ([id], [name], [description], [price]) VALUES (103, N'Vegetable Soup', N'A wonderful assortment of country vegetables.', 5.9500)
INSERT [dbo].[starters] ([id], [name], [description], [price]) VALUES (104, N'Bruschetta', N'Thick slices of bread grilled, rubbed with garlic, drizzled with olive, topped with tomatoes and herbs.', 7.5000)
SET IDENTITY_INSERT [dbo].[starters] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [name], [age], [email], [phone], [address1], [address2], [town], [county], [zip], [is_admin]) VALUES (1001, N'Andrej Lavrinovic', 33, N'andrei.lavrinovic@gmail.com', N'0863011480', N'189 Fearann Ri', N'Doughiska', N'Galway', N'Galway', N'091', 1)
INSERT [dbo].[user] ([id], [name], [age], [email], [phone], [address1], [address2], [town], [county], [zip], [is_admin]) VALUES (1002, N'John Doe', 25, N'john.doe@gmit.ie', N'0861234567', N'86 Scail Guard', N'Roscomon', N'Galway', N'Galway', N'091', 0)
INSERT [dbo].[user] ([id], [name], [age], [email], [phone], [address1], [address2], [town], [county], [zip], [is_admin]) VALUES (1003, N'Roman Abramovic', 49, N'roma@abramovic.com', N'1234567890', N'Stamphord Bridge', NULL, N'London', N'Galway', N'091', 0)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_user]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_deserts] FOREIGN KEY([desert_id])
REFERENCES [dbo].[deserts] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_deserts]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_drinks] FOREIGN KEY([drinks_id])
REFERENCES [dbo].[drinks] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_drinks]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_mains] FOREIGN KEY([main_id])
REFERENCES [dbo].[mains] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_mains]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_starter] FOREIGN KEY([starter_id])
REFERENCES [dbo].[starters] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_starter]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
USE [master]
GO
ALTER DATABASE [restaurant] SET  READ_WRITE 
GO
