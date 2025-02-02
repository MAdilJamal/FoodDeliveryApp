﻿CREATE DATABASE FoodDeliveryAppDB
GO
/****** Script Date: 28-11-2024 11:44:40 ******/
USE [FoodDeliveryAppDB]
GO
/****** Object:  Table [dbo].[FoodItems]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItems](
	[FoodItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NULL,
	[ImageUrl] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FoodItemID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](10, 2) NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FoodItems] ON 

INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (1, N'Crispy Veggie Burger', N'A crunchy patty made from a blend of 7 exotic veggies, topped with onions', CAST(190.00 AS Decimal(10, 2)), N'hr8d4266fd4e6338d13b845fsdgad.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (2, N'Crispy Chicken Burger', N'Delightfully crispy chicken sandwich with a crispy chicken patty topped with mayonnaise', CAST(218.00 AS Decimal(10, 2)), N'ffsdaa6fd4e6338d13b845fcffdsaa.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (3, N'Crispy Veggie Double patty Burger', N'A crunchy patty made from a blend of 7 exotic veggies', CAST(309.00 AS Decimal(10, 2)), N'grfs3gSdd4e6338d13b845fcf2fd9.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (4, N'Aloo Wrap VM', NULL, CAST(118.00 AS Decimal(10, 2)), N'htd6456fd4e6338d13b845fcf289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (5, N'Tandoori Chicken Wrap VM', NULL, CAST(176.00 AS Decimal(10, 2)), N'88d4266fdfe123338d13b845fcf289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (6, N'Cappuccino Small', N'A refreshing shot of our signature coffee made with 100% arabica beans', CAST(114.00 AS Decimal(10, 2)), N'88d42htews3aw338d13b845fcf289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (7, N'Latte', N'Rich in flavour espresso balanced with steamed milk and a light layer of hot chocolate', CAST(183.00 AS Decimal(10, 2)), N'8vdsessdages338d13b845fcf289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (8, N'Cold Coffee Frappe', N'Rich, creamy and irresistible cold coffee, created by blending a double shot', CAST(200.00 AS Decimal(10, 2)), N'fsgsDSadsag3rsa6338d13b845fcf289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (9, N'HappyMeal Chicken Nuggets Meal', N'Combo of your Favorite Burger with choice of Beverage and Surprise Toy!', CAST(280.00 AS Decimal(10, 2)), N'fdf4266fd4e633fasfb845fcf289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (10, N'Spicy Paneer/Spicy Chicken Wrap(Any 2)+1 Med. Fries+2 Puff', NULL, CAST(635.00 AS Decimal(10, 2)), N'88d42wqffewe6338d13b845fff289.jpg')
INSERT [dbo].[FoodItems] ([FoodItemID], [Name], [Description], [Price], [ImageUrl]) VALUES (11, N'Medium-Fries', N'World Famous Fries. These epic, fan-favourite fries are crispy and golden on the outside and fluffy on the inside.', CAST(117.00 AS Decimal(10, 2)), N'fdd4266fd4e6338d13b845fcf289.jpg')
SET IDENTITY_INSERT [dbo].[FoodItems] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckUsernameExist]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CheckUsernameExist]
    @UserName NVARCHAR(50)
AS
BEGIN
    SELECT UserID
    FROM Users
    WHERE UserName = @UserName;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFoodItem]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetFoodItem]
    @FoodItemID INT
AS
BEGIN
    SELECT *
    FROM FoodItems
    WHERE FoodItemID = @FoodItemID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrderItems]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetOrderItems]
    @OrderID INT
AS
BEGIN
    SELECT fi.Name AS FoodItemName, oi.Quantity, oi.Price
    FROM OrderItems oi
    JOIN FoodItems fi ON oi.FoodItemID = fi.FoodItemID
    WHERE oi.OrderID = @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserOrders]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserOrders]
    @UserName nvarchar(50)
AS
BEGIN
    SELECT OrderID, Status, OrderDate, TotalAmount
    FROM Orders
    WHERE UserName = @UserName
    ORDER BY OrderDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUser]
    @UserName NVARCHAR(50),
    @Password NVARCHAR(100)
AS
BEGIN
    SELECT UserID, UserName, Role
    FROM Users
    WHERE UserName = @UserName AND Password = @Password;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_PlaceOrder]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PlaceOrder]
    @UserName nvarchar(50),
    @TotalAmount DECIMAL(10, 2),
    @OrderDate DATETIME
AS
BEGIN
   -- Insert into Orders Table
    DECLARE @OrderID INT;
    INSERT INTO Orders (UserName, TotalAmount, OrderDate, Status)
    VALUES (@UserName, @TotalAmount, @OrderDate, 'Pending');

    -- Get the last inserted OrderID
    SET @OrderID = SCOPE_IDENTITY();

    -- Return the OrderID
    SELECT @OrderID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 28-11-2024 11:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegisterUser]
	@Name NVARCHAR(50),
    @UserName NVARCHAR(50),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @Role NVARCHAR(50)
AS
BEGIN
    INSERT INTO Users (Name, UserName, Password, Email, Role)
    VALUES (@Name, @UserName, @Password, @Email, @Role);
END;
GO
