USE [master]
GO
/****** Object:  Database [SuperSupper]    Script Date: 3/3/2023 2:29:47 PM ******/
CREATE DATABASE [SuperSupper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperSupper', FILENAME = N'/var/opt/mssql/data/SuperSupper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperSupper_log', FILENAME = N'/var/opt/mssql/data/SuperSupper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SuperSupper] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SuperSupper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SuperSupper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SuperSupper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SuperSupper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SuperSupper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SuperSupper] SET ARITHABORT OFF 
GO
ALTER DATABASE [SuperSupper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SuperSupper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SuperSupper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SuperSupper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SuperSupper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SuperSupper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SuperSupper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SuperSupper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SuperSupper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SuperSupper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SuperSupper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SuperSupper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SuperSupper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SuperSupper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SuperSupper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SuperSupper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SuperSupper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SuperSupper] SET RECOVERY FULL 
GO
ALTER DATABASE [SuperSupper] SET  MULTI_USER 
GO
ALTER DATABASE [SuperSupper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SuperSupper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SuperSupper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SuperSupper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SuperSupper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SuperSupper] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SuperSupper', N'ON'
GO
ALTER DATABASE [SuperSupper] SET QUERY_STORE = ON
GO
ALTER DATABASE [SuperSupper] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SuperSupper]
GO
/****** Object:  Table [dbo].[GroceryInventoryItems]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroceryInventoryItems](
	[GroceryItemId] [int] NOT NULL,
	[InDate] [date] NOT NULL,
	[ExpDate] [date] NOT NULL,
	[QTY] [nvarchar](50) NOT NULL,
	[InventoryItem] [int] NOT NULL,
	[User] [int] NOT NULL,
 CONSTRAINT [PK_GroceryInventoryItems] PRIMARY KEY CLUSTERED 
(
	[GroceryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryItems]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItems](
	[InventoryItemId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[FDCId] [nvarchar](50) NULL,
 CONSTRAINT [PK_InventoryItems] PRIMARY KEY CLUSTERED 
(
	[InventoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealPlans]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealPlans](
	[MealPlanId] [int] NOT NULL,
	[User] [int] NOT NULL,
 CONSTRAINT [PK_MealPlans] PRIMARY KEY CLUSTERED 
(
	[MealPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meals]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meals](
	[MealId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Recipe] [int] NOT NULL,
	[User] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredient]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredient](
	[RecipeIngredientId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[QTY] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](100) NOT NULL,
	[Recipe] [int] NOT NULL,
	[InventoryItem] [int] NOT NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[RecipeIngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](350) NULL,
	[URL] [nvarchar](100) NULL,
	[User] [int] NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeSteps]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeSteps](
	[RecipeStepId] [int] NOT NULL,
	[StepOrder] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Recipe] [int] NOT NULL,
 CONSTRAINT [PK_RecipeSteps] PRIMARY KEY CLUSTERED 
(
	[RecipeStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeTag]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeTag](
	[RecipeTagId] [int] NOT NULL,
	[Recipe] [int] NOT NULL,
	[Tag] [int] NOT NULL,
 CONSTRAINT [PK_RecipeTag] PRIMARY KEY CLUSTERED 
(
	[RecipeTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingListItems]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingListItems](
	[ShoppingListItemId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
	[QTY] [nvarchar](50) NOT NULL,
	[InventoryItem] [int] NOT NULL,
	[User] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFavoriteRecipes]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFavoriteRecipes](
	[UserFavoriteRecipeId] [int] NOT NULL,
	[User] [int] NOT NULL,
	[Recipe] [int] NOT NULL,
 CONSTRAINT [PK_UserFavoriteRecipes] PRIMARY KEY CLUSTERED 
(
	[UserFavoriteRecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/3/2023 2:29:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroceryInventoryItems]  WITH CHECK ADD  CONSTRAINT [FK_GroceryInventoryItems_InventoryItems] FOREIGN KEY([InventoryItem])
REFERENCES [dbo].[InventoryItems] ([InventoryItemId])
GO
ALTER TABLE [dbo].[GroceryInventoryItems] CHECK CONSTRAINT [FK_GroceryInventoryItems_InventoryItems]
GO
ALTER TABLE [dbo].[GroceryInventoryItems]  WITH CHECK ADD  CONSTRAINT [FK_GroceryInventoryItems_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[GroceryInventoryItems] CHECK CONSTRAINT [FK_GroceryInventoryItems_Users]
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD  CONSTRAINT [FK_Meals_Recipes] FOREIGN KEY([Recipe])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
ALTER TABLE [dbo].[Meals] CHECK CONSTRAINT [FK_Meals_Recipes]
GO
ALTER TABLE [dbo].[Meals]  WITH CHECK ADD  CONSTRAINT [FK_Meals_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Meals] CHECK CONSTRAINT [FK_Meals_Users]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Recipes] FOREIGN KEY([Recipe])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Recipes]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_Users]
GO
ALTER TABLE [dbo].[RecipeSteps]  WITH CHECK ADD  CONSTRAINT [FK_RecipeSteps_Recipes] FOREIGN KEY([Recipe])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
ALTER TABLE [dbo].[RecipeSteps] CHECK CONSTRAINT [FK_RecipeSteps_Recipes]
GO
ALTER TABLE [dbo].[RecipeTag]  WITH CHECK ADD  CONSTRAINT [FK_RecipeTag_Recipes] FOREIGN KEY([Recipe])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
ALTER TABLE [dbo].[RecipeTag] CHECK CONSTRAINT [FK_RecipeTag_Recipes]
GO
ALTER TABLE [dbo].[RecipeTag]  WITH CHECK ADD  CONSTRAINT [FK_RecipeTag_Tags] FOREIGN KEY([Tag])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[RecipeTag] CHECK CONSTRAINT [FK_RecipeTag_Tags]
GO
ALTER TABLE [dbo].[ShoppingListItems]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingListItems_InventoryItems] FOREIGN KEY([InventoryItem])
REFERENCES [dbo].[InventoryItems] ([InventoryItemId])
GO
ALTER TABLE [dbo].[ShoppingListItems] CHECK CONSTRAINT [FK_ShoppingListItems_InventoryItems]
GO
ALTER TABLE [dbo].[ShoppingListItems]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingListItems_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ShoppingListItems] CHECK CONSTRAINT [FK_ShoppingListItems_Users]
GO
ALTER TABLE [dbo].[UserFavoriteRecipes]  WITH CHECK ADD  CONSTRAINT [FK_UserFavoriteRecipes_Recipes] FOREIGN KEY([Recipe])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
ALTER TABLE [dbo].[UserFavoriteRecipes] CHECK CONSTRAINT [FK_UserFavoriteRecipes_Recipes]
GO
ALTER TABLE [dbo].[UserFavoriteRecipes]  WITH CHECK ADD  CONSTRAINT [FK_UserFavoriteRecipes_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserFavoriteRecipes] CHECK CONSTRAINT [FK_UserFavoriteRecipes_Users]
GO
USE [master]
GO
ALTER DATABASE [SuperSupper] SET  READ_WRITE 
GO
