USE [master]
GO
/****** Object:  Database [Красный_Якорь_БД]    Script Date: 20.06.2025 1:40:44 ******/
CREATE DATABASE [Красный_Якорь_БД]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Красный_Якорь_БД', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCALHOST\MSSQL\DATA\Красный_Якорь_БД.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Красный_Якорь_БД_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCALHOST\MSSQL\DATA\Красный_Якорь_БД_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Красный_Якорь_БД] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Красный_Якорь_БД].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Красный_Якорь_БД] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET ARITHABORT OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Красный_Якорь_БД] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Красный_Якорь_БД] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Красный_Якорь_БД] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Красный_Якорь_БД] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET RECOVERY FULL 
GO
ALTER DATABASE [Красный_Якорь_БД] SET  MULTI_USER 
GO
ALTER DATABASE [Красный_Якорь_БД] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Красный_Якорь_БД] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Красный_Якорь_БД] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Красный_Якорь_БД] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Красный_Якорь_БД] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Красный_Якорь_БД] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Красный_Якорь_БД', N'ON'
GO
ALTER DATABASE [Красный_Якорь_БД] SET QUERY_STORE = OFF
GO
USE [Красный_Якорь_БД]
GO
/****** Object:  Table [dbo].[Виды_продукции]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Виды_продукции](
	[ID_вида_продукции] [int] NOT NULL,
	[Наименование_продукции] [varchar](100) NOT NULL,
	[Толщина_мм] [decimal](5, 2) NOT NULL,
	[Размер] [varchar](20) NOT NULL,
	[Класс_качества] [varchar](10) NOT NULL,
	[Цена_за_кв_м] [decimal](10, 2) NOT NULL,
	[Описание] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_вида_продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[ID_Заказа] [int] NOT NULL,
	[Дата_Заказа] [date] NOT NULL,
	[Дата_Доставки] [date] NULL,
	[Коичество] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ID_клиента] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Контактное_лицо] [varchar](100) NULL,
	[Телефон] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
	[Процент_скидки] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[ID_оборудования] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Дата_покупки] [date] NOT NULL,
	[Последнее_ТО] [date] NULL,
	[Статус] [varchar](20) NOT NULL,
	[Стоимость] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отходы_производства]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отходы_производства](
	[ID_отхода] [int] NOT NULL,
	[Дата_образования] [date] NULL,
	[Наименование] [varchar](255) NULL,
	[Количество] [decimal](12, 3) NULL,
	[Единица_измерения] [varchar](50) NULL,
	[Способ_утилизации] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_отхода] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ID_поставщика] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Тип_материала] [varchar](50) NOT NULL,
	[Контактное_лицо] [varchar](100) NULL,
	[Телефон] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
	[Рейтинг_надежности] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продажи]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продажи](
	[ID_продажи] [int] NOT NULL,
	[Дата_продажи] [date] NULL,
	[ID_клиента] [int] NULL,
	[ID_продукции] [int] NULL,
	[Количество] [int] NULL,
	[Цена_за_единицу] [decimal](12, 2) NULL,
	[Сумма] [decimal](12, 2) NULL,
	[ID_кампании] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_продажи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукция]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукция](
	[ID_продукции] [int] NOT NULL,
	[Наименование] [varchar](255) NOT NULL,
	[Сорт] [varchar](50) NULL,
	[Толщина] [decimal](5, 2) NULL,
	[Ширина] [decimal](6, 2) NULL,
	[Длина] [decimal](6, 2) NULL,
	[Цена_за_единицу] [decimal](10, 2) NOT NULL,
	[Единица_измерения] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Производственные_цеха]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Производственные_цеха](
	[ID_цеха] [int] NOT NULL,
	[Наименование_цеха] [varchar](50) NOT NULL,
	[ID_руководителя] [int] NULL,
	[Площадь_кв_м] [decimal](8, 2) NOT NULL,
	[Количество_оборудования] [int] NOT NULL,
	[Специализация] [varchar](100) NOT NULL,
	[Количество_рабочих_смен] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_цеха] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_Сотрудника] [int] NOT NULL,
	[Польное_имя] [varchar](100) NOT NULL,
	[Должность] [varchar](50) NOT NULL,
	[Отдел] [varchar](50) NOT NULL,
	[Дата_найма] [date] NOT NULL,
	[Зарплата] [decimal](10, 2) NOT NULL,
	[Телефон] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сырье]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сырье](
	[ID_материала] [int] NOT NULL,
	[Наименование] [varchar](100) NOT NULL,
	[Количество_на_складе] [decimal](10, 2) NOT NULL,
	[Единица_измерения] [varchar](10) NOT NULL,
	[Последняя_поставка] [date] NULL,
	[Рейтинг_качества] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Техника_безопасности]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Техника_безопасности](
	[ID_инструктажа] [int] NOT NULL,
	[Дата_проведения] [date] NULL,
	[ID_сотрудника] [int] NULL,
	[Тип_инструктажа] [varchar](255) NULL,
	[Инструктор] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_инструктажа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Транспорт]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Транспорт](
	[ID_транспорта] [int] NOT NULL,
	[Тип_транспорта] [varchar](255) NULL,
	[Гос_номер] [varchar](20) NULL,
	[Водитель] [varchar](255) NULL,
	[Грузоподъемность] [numeric](7, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_транспорта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЦЕх]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЦЕх](
	[ID_цеха] [int] NULL,
	[ID_отхода] [int] NULL,
	[ID_оборудования] [int] NULL,
	[ID_материала] [int] NULL,
	[ID_записи] [int] NULL,
	[ID_инструктажа] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Энергопотребление]    Script Date: 20.06.2025 1:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Энергопотребление](
	[ID_записи] [int] NOT NULL,
	[Дата_записи] [date] NULL,
	[Тип_ресурса] [varchar](255) NULL,
	[Показатель] [decimal](12, 3) NULL,
	[Единица_измерения] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Клиенты] ADD  DEFAULT ((0)) FOR [Процент_скидки]
GO
ALTER TABLE [dbo].[Производственные_цеха]  WITH CHECK ADD FOREIGN KEY([ID_руководителя])
REFERENCES [dbo].[Сотрудники] ([ID_Сотрудника])
GO
ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD CHECK  (([Рейтинг_надежности]>=(1) AND [Рейтинг_надежности]<=(5)))
GO
ALTER TABLE [dbo].[Сырье]  WITH CHECK ADD CHECK  (([Рейтинг_качества]>=(1) AND [Рейтинг_качества]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Красный_Якорь_БД] SET  READ_WRITE 
GO
