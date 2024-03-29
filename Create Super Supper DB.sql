USE [master]
GO
/****** Object:  Database [SuperSupper]    Script Date: 3/25/2023 4:59:37 PM ******/
CREATE DATABASE [SuperSupper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SuperSupper', FILENAME = N'/var/opt/mssql/data/SuperSupper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SuperSupper_log', FILENAME = N'/var/opt/mssql/data/SuperSupper_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[grocery_inventory_items]    Script Date: 3/25/2023 4:59:38 PM ******/
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
	[available_qty] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GroceryInventoryItems] PRIMARY KEY CLUSTERED 
(
	[grocery_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory_ingredients]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory_ingredients](
	[inventory_Ingredient_id] [bigint] IDENTITY(1,1) NOT NULL,
	[grocery_item] [bigint] NOT NULL,
	[qty] [nvarchar](50) NOT NULL,
	[meal_plan] [bigint] NOT NULL,
	[meal] [bigint] NOT NULL,
	[recipe] [bigint] NOT NULL,
	[recipe_ingredient] [nvarchar](50) NOT NULL,
	[user] [bigint] NOT NULL,
 CONSTRAINT [PK_inventory_ingredients] PRIMARY KEY CLUSTERED 
(
	[inventory_Ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory_items]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[item_substitutions]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_substitutions](
	[substiution_id] [bigint] IDENTITY(1,1) NOT NULL,
	[substitution_for] [bigint] NOT NULL,
	[item] [bigint] NOT NULL,
	[recipe] [bigint] NOT NULL,
	[user] [bigint] NOT NULL,
 CONSTRAINT [PK_item_substitutions] PRIMARY KEY CLUSTERED 
(
	[substiution_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meal_plans]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meal_plans](
	[meal_plan_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user] [bigint] NOT NULL,
	[completed] [bit] NOT NULL,
 CONSTRAINT [PK_MealPlans] PRIMARY KEY CLUSTERED 
(
	[meal_plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meals]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meals](
	[meal_id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[recipe] [bigint] NOT NULL,
	[user] [bigint] NOT NULL,
	[completed] [bit] NOT NULL,
 CONSTRAINT [PK_meals] PRIMARY KEY CLUSTERED 
(
	[meal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_comments]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_comments](
	[recipe_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[recipe] [bigint] NOT NULL,
	[user] [bigint] NOT NULL,
	[body] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_recipe_comments] PRIMARY KEY CLUSTERED 
(
	[recipe_comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_ingredient]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[recipe_notes]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_notes](
	[recipe_note_id] [bigint] IDENTITY(1,1) NOT NULL,
	[recipe] [bigint] NOT NULL,
	[note] [nvarchar](max) NOT NULL,
	[user] [bigint] NOT NULL,
 CONSTRAINT [PK_recipe_notes] PRIMARY KEY CLUSTERED 
(
	[recipe_note_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_rating]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_rating](
	[recipe_rating_id] [bigint] IDENTITY(1,1) NOT NULL,
	[recipe] [bigint] NOT NULL,
	[user] [bigint] NOT NULL,
	[rating] [int] NOT NULL,
 CONSTRAINT [PK_recipe_rating] PRIMARY KEY CLUSTERED 
(
	[recipe_rating_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_steps]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[recipe_tag]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[recipes]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipes](
	[recipe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[description] [nvarchar](350) NULL,
	[url] [nvarchar](100) NULL,
	[created_by] [bigint] NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_list_items]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[tags]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[user_favorite_recipes]    Script Date: 3/25/2023 4:59:38 PM ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user] [bigint] NOT NULL,
	[role] [bigint] NOT NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[google_id] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__users__F3DBC5722D838313] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_active]  DEFAULT ((1)) FOR [active]
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
ALTER TABLE [dbo].[inventory_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_inventory_ingredients_grocery_inventory_items] FOREIGN KEY([grocery_item])
REFERENCES [dbo].[grocery_inventory_items] ([grocery_item_id])
GO
ALTER TABLE [dbo].[inventory_ingredients] CHECK CONSTRAINT [FK_inventory_ingredients_grocery_inventory_items]
GO
ALTER TABLE [dbo].[inventory_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_inventory_ingredients_meal_plans] FOREIGN KEY([meal_plan])
REFERENCES [dbo].[meal_plans] ([meal_plan_id])
GO
ALTER TABLE [dbo].[inventory_ingredients] CHECK CONSTRAINT [FK_inventory_ingredients_meal_plans]
GO
ALTER TABLE [dbo].[inventory_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_inventory_ingredients_meals] FOREIGN KEY([meal])
REFERENCES [dbo].[meals] ([meal_id])
GO
ALTER TABLE [dbo].[inventory_ingredients] CHECK CONSTRAINT [FK_inventory_ingredients_meals]
GO
ALTER TABLE [dbo].[inventory_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_inventory_ingredients_recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[inventory_ingredients] CHECK CONSTRAINT [FK_inventory_ingredients_recipes]
GO
ALTER TABLE [dbo].[inventory_ingredients]  WITH CHECK ADD  CONSTRAINT [FK_inventory_ingredients_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[inventory_ingredients] CHECK CONSTRAINT [FK_inventory_ingredients_users]
GO
ALTER TABLE [dbo].[item_substitutions]  WITH CHECK ADD  CONSTRAINT [FK_item_substitutions_inventory_items] FOREIGN KEY([substitution_for])
REFERENCES [dbo].[inventory_items] ([inventory_item_id])
GO
ALTER TABLE [dbo].[item_substitutions] CHECK CONSTRAINT [FK_item_substitutions_inventory_items]
GO
ALTER TABLE [dbo].[item_substitutions]  WITH CHECK ADD  CONSTRAINT [FK_item_substitutions_inventory_items1] FOREIGN KEY([item])
REFERENCES [dbo].[inventory_items] ([inventory_item_id])
GO
ALTER TABLE [dbo].[item_substitutions] CHECK CONSTRAINT [FK_item_substitutions_inventory_items1]
GO
ALTER TABLE [dbo].[item_substitutions]  WITH CHECK ADD  CONSTRAINT [FK_item_substitutions_recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[item_substitutions] CHECK CONSTRAINT [FK_item_substitutions_recipes]
GO
ALTER TABLE [dbo].[item_substitutions]  WITH CHECK ADD  CONSTRAINT [FK_item_substitutions_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[item_substitutions] CHECK CONSTRAINT [FK_item_substitutions_users]
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
ALTER TABLE [dbo].[recipe_comments]  WITH CHECK ADD  CONSTRAINT [FK_recipe_comments_recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_comments] CHECK CONSTRAINT [FK_recipe_comments_recipes]
GO
ALTER TABLE [dbo].[recipe_comments]  WITH CHECK ADD  CONSTRAINT [FK_recipe_comments_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[recipe_comments] CHECK CONSTRAINT [FK_recipe_comments_users]
GO
ALTER TABLE [dbo].[recipe_ingredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_ingredient] CHECK CONSTRAINT [FK_RecipeIngredient_Recipes]
GO
ALTER TABLE [dbo].[recipe_notes]  WITH CHECK ADD  CONSTRAINT [FK_recipe_notes_recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_notes] CHECK CONSTRAINT [FK_recipe_notes_recipes]
GO
ALTER TABLE [dbo].[recipe_notes]  WITH CHECK ADD  CONSTRAINT [FK_recipe_notes_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[recipe_notes] CHECK CONSTRAINT [FK_recipe_notes_users]
GO
ALTER TABLE [dbo].[recipe_rating]  WITH CHECK ADD  CONSTRAINT [FK_recipe_rating_recipes] FOREIGN KEY([recipe])
REFERENCES [dbo].[recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_rating] CHECK CONSTRAINT [FK_recipe_rating_recipes]
GO
ALTER TABLE [dbo].[recipe_rating]  WITH CHECK ADD  CONSTRAINT [FK_recipe_rating_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[recipe_rating] CHECK CONSTRAINT [FK_recipe_rating_users]
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
ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Users] FOREIGN KEY([created_by])
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
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FK_user_roles_roles] FOREIGN KEY([role])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FK_user_roles_roles]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FK_user_roles_users] FOREIGN KEY([user])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FK_user_roles_users]
GO
/****** Object:  StoredProcedure [dbo].[AddUserRole]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/25/2023
-- Description:	Add new user_role for user
-- =============================================
CREATE PROCEDURE [dbo].[AddUserRole] 
	-- Add the parameters for the stored procedure here
	@UserID BIGINT,
	@RoleID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT INTO [dbo].[user_roles] ([user], [role]) VALUES (@UserID, @RoleID)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewGoogleUser]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/20/2023
-- Description:	Create new user
-- =============================================
CREATE PROCEDURE [dbo].[CreateNewGoogleUser]
	-- Add the parameters for the stored procedure here
	@Username nvarchar(50), @GID nvarchar(50), @Email nvarchar(50) 
AS
BEGIN
	DECLARE @NewID BigInt;
	INSERT INTO [dbo].[users] (username, google_id, email)
	VALUES (@Username, @GID, @Email);
	SET @NewID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[user_roles] ([user], [role]) VALUES ((SELECT TOP(1) [user_id] FROM [dbo].[users] WHERE google_id = @GID), 1)

	RETURN @NewID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/21/2023
-- Description:	Delete user
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser] 
	@UserId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	DELETE FROM [dbo].[users]

	WHERE user_id = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/24/2023
-- Description:	Get all active users
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT user_id, username, email FROM [dbo].[users] WHERE active = 'TRUE';
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByEmail]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/21/2023
-- Description:	Lookup user by email
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByEmail] 
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT TOP(1) user_id, username, email FROM [dbo].[users] WHERE username = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByGID]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/21/2023
-- Description:	Lookup user by GID
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByGID]
	@GID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT TOP(1) user_id, username, google_id FROM [dbo].[users] WHERE google_id = @GID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/24/2023
-- Description:	Get user by user_id
-- =============================================
CREATE PROCEDURE [dbo].[GetUserById]
	@UserId bigint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT TOP(1) user_id, username, email FROM [dbo].[users] WHERE user_id = @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByName]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/21/2023
-- Description:	Lookup user by name
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByName] 
	@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT TOP(1) user_id, username, email FROM [dbo].[users] WHERE username = @Name
END
GO
/****** Object:  StoredProcedure [dbo].[GoogleUserLogin]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/24/2023
-- Description:	Google User login
-- =============================================
CREATE PROCEDURE [dbo].[GoogleUserLogin]
	@GID NVARCHAR(50),
	@Username NVARCHAR(50),
	@Email NVARCHAR(50)

AS
DECLARE @UserID BIGINT;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [dbo].[users] WHERE google_id = @GID)
		BEGIN
			EXEC CreateNewGoogleUser @Username, @GID, @Email
		END

	EXEC @UserID = GetUserByGID @GID
	RETURN @UserID

END
GO
/****** Object:  StoredProcedure [dbo].[IsAdmin]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/25/2023
-- Description:	Checks if User had "ADMIN" user_role
-- =============================================
CREATE PROCEDURE [dbo].[IsAdmin] 
	-- Add the parameters for the stored procedure here
	@UserID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @RoleID bigint;
	SET @RoleID = (SELECT TOP(1) role_id from roles WHERE role = 'ADMIN');
	SELECT
		CASE WHEN NOT EXISTS (SELECT * FROM user_roles WHERE [role] = @RoleID AND [user] = @UserID) THEN 'TRUE' ELSE 'FALSE'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[IsAdmins]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/25/2023
-- Description:	Checks if User had "ADMIN" user_role
-- =============================================
CREATE PROCEDURE [dbo].[IsAdmins] 
	-- Add the parameters for the stored procedure here
	@UserID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @RoleID BIGINT;
	SET @RoleID = (SELECT TOP(1) role_id from [dbo].[roles] WHERE role = 'ADMIN');
	SELECT
		CASE WHEN EXISTS
		(
			SELECT * FROM [dbo].[user_roles] WHERE user = @UserID AND role = @RoleID
		)
		THEN 'TRUE'
		ELSE 'FALSE'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ReactivateUser]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/24/2023
-- Description:	reset user's active flag
-- =============================================
CREATE PROCEDURE [dbo].[ReactivateUser]
	@UserId bigint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[users]
	SET active = 'TRUE'
	WHERE user_id = @UserId;

END
GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteUser]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/24/2023
-- Description:	Make User Inactive
-- =============================================
CREATE PROCEDURE [dbo].[SoftDeleteUser]
	@UserID NVARCHAR(50)

AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[users]
	SET active = 'FALSE'
	WHERE user_id = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 3/25/2023 4:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HeftyB
-- Create date: 03/21/2023
-- Description:	Update user
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser] 
	@UserId bigint,
	@Username nvarchar(50),
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	UPDATE [dbo].[users]
	SET [username] = @Username
		,[email] = @Email
	WHERE user_id = @UserID
END
GO
USE [master]
GO
ALTER DATABASE [SuperSupper] SET  READ_WRITE 
GO
