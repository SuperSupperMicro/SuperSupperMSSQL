USE [master]
GO
/****** Object:  Database [SuperSupper]    Script Date: 3/6/2023 9:39:52 PM ******/
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
/****** Object:  Table [dbo].[grocery_inventory_items]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grocery_inventory_items](
	[grocery_item_id] [bigint] IDENTITY(1,1) NOT NULL,
	[in_date] [date] NOT NULL,
	[exp_date] [date] NOT NULL,
	[qty] [nvarchar](50) NOT NULL,
	[inventory_item] [bigint] NOT NULL,
	[user] [bigint] NOT NULL,
 CONSTRAINT [PK_GroceryInventoryItems] PRIMARY KEY CLUSTERED 
(
	[grocery_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory_items]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory_items](
	[inventory_item_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[fdc_id] [nvarchar](50) NULL,
 CONSTRAINT [PK_InventoryItems] PRIMARY KEY CLUSTERED 
(
	[inventory_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UName] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNames] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meal_plans]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meal_plans](
	[meal_plan_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user] [bigint] NOT NULL,
 CONSTRAINT [PK_MealPlans] PRIMARY KEY CLUSTERED 
(
	[meal_plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meals]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meals](
	[meal_id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[recipe] [bigint] NOT NULL,
	[user] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_ingredient]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_ingredient](
	[recipe_ingredient_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[qty] [nvarchar](50) NOT NULL,
	[notes] [nvarchar](100) NOT NULL,
	[recipe] [bigint] NOT NULL,
	[inventory_item] [bigint] NOT NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[recipe_ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_steps]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_steps](
	[recipe_step_id] [bigint] IDENTITY(1,1) NOT NULL,
	[step_order] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[recipe] [bigint] NOT NULL,
 CONSTRAINT [PK_RecipeSteps] PRIMARY KEY CLUSTERED 
(
	[recipe_step_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_tag]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_tag](
	[recipe_tag_id] [bigint] IDENTITY(1,1) NOT NULL,
	[recipe] [bigint] NOT NULL,
	[tag] [bigint] NOT NULL,
 CONSTRAINT [PK_RecipeTag] PRIMARY KEY CLUSTERED 
(
	[recipe_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipes]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[recipe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[description] [nvarchar](350) NULL,
	[url] [nvarchar](100) NULL,
	[user] [bigint] NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_list_items]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_list_items](
	[shopping_list_item_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[notes] [nvarchar](50) NOT NULL,
	[qty] [nvarchar](50) NOT NULL,
	[inventory_item] [bigint] NOT NULL,
	[user] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[tag_id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_favorite_recipes]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_favorite_recipes](
	[user_favorite_recipe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user] [bigint] NOT NULL,
	[recipe] [bigint] NOT NULL,
 CONSTRAINT [PK_UserFavoriteRecipes] PRIMARY KEY CLUSTERED 
(
	[user_favorite_recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/6/2023 9:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[grocery_inventory_items]  WITH CHECK ADD  CONSTRAINT [FK_GroceryInventoryItems_InventoryItems] FOREIGN KEY([inventory_item])
REFERENCES [dbo].[inventory_items] ([inventory_item_id])
GO
ALTER TABLE [dbo].[grocery_inventory_items] CHECK CONSTRAINT [FK_GroceryInventoryItems_InventoryItems]
GO
ALTER TABLE [dbo].[grocery_inventory_items]  WITH CHECK ADD  CONSTRAINT [FK_GroceryInventoryItems_Users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[grocery_inventory_items] CHECK CONSTRAINT [FK_GroceryInventoryItems_Users]
GO
ALTER TABLE [dbo].[meals]  WITH CHECK ADD  CONSTRAINT [FK_Meals_Recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[meals] CHECK CONSTRAINT [FK_Meals_Recipes]
GO
ALTER TABLE [dbo].[meals]  WITH CHECK ADD  CONSTRAINT [FK_Meals_Users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[meals] CHECK CONSTRAINT [FK_Meals_Users]
GO
ALTER TABLE [dbo].[recipe_ingredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_ingredient] CHECK CONSTRAINT [FK_RecipeIngredient_Recipes]
GO
ALTER TABLE [dbo].[recipe_steps]  WITH CHECK ADD  CONSTRAINT [FK_RecipeSteps_Recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_steps] CHECK CONSTRAINT [FK_RecipeSteps_Recipes]
GO
ALTER TABLE [dbo].[recipe_tag]  WITH CHECK ADD  CONSTRAINT [FK_RecipeTag_Recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_tag] CHECK CONSTRAINT [FK_RecipeTag_Recipes]
GO
ALTER TABLE [dbo].[recipe_tag]  WITH CHECK ADD  CONSTRAINT [FK_RecipeTag_Tags] FOREIGN KEY([tag])
REFERENCES [dbo].[tags] ([tag_id])
GO
ALTER TABLE [dbo].[recipe_tag] CHECK CONSTRAINT [FK_RecipeTag_Tags]
GO
ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [FK_Recipes_Users]
GO
ALTER TABLE [dbo].[shopping_list_items]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingListItems_InventoryItems] FOREIGN KEY([inventory_item])
REFERENCES [dbo].[inventory_items] ([inventory_item_id])
GO
ALTER TABLE [dbo].[shopping_list_items] CHECK CONSTRAINT [FK_ShoppingListItems_InventoryItems]
GO
ALTER TABLE [dbo].[shopping_list_items]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingListItems_Users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[shopping_list_items] CHECK CONSTRAINT [FK_ShoppingListItems_Users]
GO
ALTER TABLE [dbo].[user_favorite_recipes]  WITH CHECK ADD  CONSTRAINT [FK_UserFavoriteRecipes_Recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[user_favorite_recipes] CHECK CONSTRAINT [FK_UserFavoriteRecipes_Recipes]
GO
ALTER TABLE [dbo].[user_favorite_recipes]  WITH CHECK ADD  CONSTRAINT [FK_UserFavoriteRecipes_Users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_favorite_recipes] CHECK CONSTRAINT [FK_UserFavoriteRecipes_Users]
GO
USE [master]
GO
ALTER DATABASE [SuperSupper] SET  READ_WRITE 
GO
