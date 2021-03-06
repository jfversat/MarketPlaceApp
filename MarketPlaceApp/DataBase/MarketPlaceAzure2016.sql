/****** Object:  Database [MarketPlace]    Script Date: 18/09/2020 11:46:42 p. m. ******/
CREATE DATABASE [MarketPlace]  ;
GO
ALTER DATABASE [MarketPlace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketPlace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketPlace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketPlace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketPlace] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketPlace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketPlace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketPlace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketPlace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketPlace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketPlace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketPlace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketPlace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketPlace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketPlace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketPlace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketPlace] SET  MULTI_USER 
GO
ALTER DATABASE [MarketPlace] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productDescription] [nvarchar](2000) NULL,
	[productPrice] [real] NULL,
	[productCategory] [int] NOT NULL,
	[productPhoto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsCategory]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsCategory](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
	[categoryDescription] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ProductsCategory] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[transactionDate] [smalldatetime] NOT NULL,
	[transactionPrice] [real] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartDetail]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartDetail](
	[detailId] [int] IDENTITY(1,1) NOT NULL,
	[transactionId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[productPrice] [real] NOT NULL,
 CONSTRAINT [PK_ShoppingCartDetail] PRIMARY KEY CLUSTERED 
(
	[detailId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userPhone] [nvarchar](20) NULL,
	[userAddress] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productId], [productName], [productDescription], [productPrice], [productCategory], [productPhoto]) VALUES (1, N'Xbox One X', N'Xbox One X', 500, 1, N'https://images-na.ssl-images-amazon.com/images/I/31tT6ODzxZL.jpg')
INSERT [dbo].[Products] ([productId], [productName], [productDescription], [productPrice], [productCategory], [productPhoto]) VALUES (2, N'Xbox One S', N'Xbox One S', 600, 1, N'https://compass-ssl.xbox.com/assets/05/b0/05b01a46-58eb-4927-ad21-3c43b545ebaf.jpg?n=X1S-2019_Panes-2-Up-1084_111_570x400.jpg')
INSERT [dbo].[Products] ([productId], [productName], [productDescription], [productPrice], [productCategory], [productPhoto]) VALUES (3, N'PS5 Pro', N'PS5 Pro', 400, 1, N'https://as.com/meristation/imagenes/2020/06/11/noticias/1591911399_527301_1591911770_sumario_normal.jpg')
INSERT [dbo].[Products] ([productId], [productName], [productDescription], [productPrice], [productCategory], [productPhoto]) VALUES (4, N'PS5 ', N'PS5', 500, 1, N'https://cnet4.cbsistatic.com/img/IDolzKTJaO78EjjlQ8eBrFrWqUs=/940x0/2020/06/12/8fe98e53-bbed-4346-acd2-8bf2dbcf561c/1.jpg')
INSERT [dbo].[Products] ([productId], [productName], [productDescription], [productPrice], [productCategory], [productPhoto]) VALUES (5, N'Soccer Shoes', N'Soccer Shoes', 80, 2, N'https://image.dhgate.com/0x0s/f2-albu-g7-M01-D7-CD-rBVaSluqeSGATm5kAAKWZDATLpo556.jpg/original-white-gold-cr7-unisex-soccer-cleats.jpg')
INSERT [dbo].[Products] ([productId], [productName], [productDescription], [productPrice], [productCategory], [productPhoto]) VALUES (15, N'Archer', N'Archer Controller', 2000, 1, N'https://www.archery360.com/wp-content/uploads/2016/05/recurve-bows.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductsCategory] ON 

INSERT [dbo].[ProductsCategory] ([categoryId], [categoryName], [categoryDescription]) VALUES (1, N'GAMES', N'G')
INSERT [dbo].[ProductsCategory] ([categoryId], [categoryName], [categoryDescription]) VALUES (2, N'SPORT', N'Sport category')
INSERT [dbo].[ProductsCategory] ([categoryId], [categoryName], [categoryDescription]) VALUES (3, N'WORK', N'S')
INSERT [dbo].[ProductsCategory] ([categoryId], [categoryName], [categoryDescription]) VALUES (4, N'HOBBIES', N'Office tools for your home work')
SET IDENTITY_INSERT [dbo].[ProductsCategory] OFF
INSERT [dbo].[Users] ([userId], [userName], [userEmail], [userPhone], [userAddress]) VALUES (111111, N'Jeferson', N'jefer@email.com', N'1112223334', N'Awesome address')
INSERT [dbo].[Users] ([userId], [userName], [userEmail], [userPhone], [userAddress]) VALUES (123456, N'Jhon Doe', N'jhondoe@email.com', N'748945613', N'Cra Amityville')
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductsCategory] FOREIGN KEY([productCategory])
REFERENCES [dbo].[ProductsCategory] ([categoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductsCategory]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Users]
GO
ALTER TABLE [dbo].[ShoppingCartDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartDetail_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[ShoppingCartDetail] CHECK CONSTRAINT [FK_ShoppingCartDetail_Products]
GO
ALTER TABLE [dbo].[ShoppingCartDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartDetail_ShoppingCart] FOREIGN KEY([transactionId])
REFERENCES [dbo].[ShoppingCart] ([transactionId])
GO
ALTER TABLE [dbo].[ShoppingCartDetail] CHECK CONSTRAINT [FK_ShoppingCartDetail_ShoppingCart]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProductToShoppingCart]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddProductToShoppingCart] 
	@transactionId int, @userId int, @productId int, @quantity int, @productPrice real
AS
BEGIN
	SET NOCOUNT ON;
    IF NOT EXISTS(SELECT transactionId FROM ShoppingCart WHERE transactionId = @transactionId)
	BEGIN
		INSERT INTO ShoppingCart(userId, transactionDate,transactionPrice) 
		VALUES(@userId, GETDATE(), 0)

		SET @transactionId = (SELECT IDENT_CURRENT('ShoppingCart'))

		INSERT INTO ShoppingCartDetail(transactionId, productId, quantity, productPrice)
		VALUES(@transactionId, @productId, @quantity, @productPrice)
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT productId FROM ShoppingCartDetail WHERE transactionId = @transactionId AND productId = @productId)
			UPDATE ShoppingCartDetail SET quantity = (quantity+@quantity) WHERE transactionId = @transactionId AND productId = @productId;
		ELSE
			INSERT INTO ShoppingCartDetail(transactionId, productId, quantity, productPrice)
			VALUES(@transactionId, @productId, @quantity, @productPrice)
	END

	SELECT @transactionId AS [TransactionId]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateCategory]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateCategory] 
	-- Add the parameters for the stored procedure here
	@categoryName varchar(100), @categoryDescription varchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ProductsCategory(categoryName, categoryDescription) VALUES(@categoryName, @categoryDescription)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateProduct]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateProduct] 
	@productName varchar(50), @productDescription varchar(MAX), @productPrice real, @productCategory int, @prodcutPhoto varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Products(productName, productDescription, productPrice, productCategory, productPhoto) 
	VALUES (@productName, @productDescription, @productPrice, @productCategory, @prodcutPhoto)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateUser]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateUser]
	@userId int, @userName varchar(50), @userEmail varchar(255), 
	@userPhone varchar(20), @userAddress varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT userId FROM Users WHERE userId=@userId)
		INSERT INTO Users(userId, userName, userEmail, userPhone, userAddress)
		VALUES(@userId, @userName, @userEmail, @userPhone, @userAddress)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCategory]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteCategory] 
	-- Add the parameters for the stored procedure here
	@categoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM ProductsCategory WHERE categoryId = @categoryId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProduct]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteProduct] 
	@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM Products WHERE productId = @productId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCategories]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCategories]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT categoryId, categoryName, categoryDescription FROM ProductsCategory
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCategory]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCategory] 
	@categoryId int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT categoryId, categoryName, categoryDescription 
	FROM ProductsCategory WHERE categoryId = @categoryId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetProduct]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetProduct] 
	@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT productId, productName, productDescription, productPrice, productCategory, productPhoto FROM Products WHERE productId = @productId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetProducts]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetProducts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT productId, productName, productDescription, productPrice, productCategory, productPhoto FROM Products
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetShoppingCartDetail]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetShoppingCartDetail] 
	@transactionId int, @userId int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT B.detailId, B.productId, P.productName, B.quantity, B.productPrice AS [UnitPrice], (B.quantity*B.productPrice) AS [Subtotal]
	FROM ShoppingCartDetail B
	INNER JOIN ShoppingCart A ON B.transactionId = A.transactionId AND A.userId = @userId
	INNER JOIN Products P ON B.productId = P.productId
	WHERE B.transactionId = @transactionId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUser]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUser]
	@userId int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT userId, userName, userEmail, userPhone, userAddress FROM Users
	WHERE userId = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsers]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUsers]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT userId, userName, userEmail, userPhone, userAddress FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveProductFromShoppingCart]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RemoveProductFromShoppingCart] 
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @itemsInCart int;
	DECLARE @transactionId int;

	SET @transactionId = (SELECT transactionId FROM ShoppingCartDetail WHERE detailId = @Id)

	DELETE FROM ShoppingCartDetail WHERE detailId = @Id

	SET @itemsInCart = (SELECT COUNT(productId) FROM ShoppingCartDetail 
		WHERE transactionId = @transactionId)

	IF(@itemsInCart <= 0)
	BEGIN
		DELETE FROM ShoppingCart WHERE transactionId = @transactionId
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchByCategory]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SearchByCategory] 
	@productCategory VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(@productCategory = 'Show All')
		BEGIN
			SELECT P.productId, P.productName, P.productDescription, P.productPrice, productPhoto 
			FROM Products P
			INNER JOIN ProductsCategory PC ON P.productCategory = PC.categoryId
		END
	ELSE IF(@productCategory IS NOT NULL)
		BEGIN
			SELECT P.productId, P.productName, P.productDescription, P.productPrice, productPhoto 
			FROM Products P
			INNER JOIN ProductsCategory PC ON P.productCategory = PC.categoryId 
			WHERE PC.categoryName LIKE '%'+@productCategory+'%'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchByName]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SearchByName] 
	@productName varchar(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(@productName IS NOT NULL)
		SELECT productId, productName, productDescription, productPrice, productPhoto
		FROM Products WHERE productName LIKE '%'+@productName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCategory]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateCategory] 
	@categoryId int, @categoryName varchar(100), @categoryDescription varchar(500)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE ProductsCategory SET categoryName = @categoryName, categoryDescription= @categoryDescription
	WHERE categoryId = @categoryId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProduct]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateProduct] 
	@productId int, @productName varchar(50), @productDescription varchar(2000), @productPrice real, @productCategory int, @productPhoto varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Products SET productName=@productName, productDescription=@productDescription, productPrice=@productPrice, productCategory=@productCategory,
	productPhoto = @productPhoto
	WHERE productId = @productId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUser]    Script Date: 18/09/2020 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateUser]
	@userId int, @userName varchar(50), @userEmail varchar(255), 
	@userPhone varchar(20), @userAddress varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT userId FROM Users WHERE userId=@userId)
		UPDATE Users SET userName = @userName, userEmail = @userEmail, 
		userPhone = @userPhone, userAddress = @userAddress
		WHERE userId = @userId
END
GO
ALTER DATABASE [MarketPlace] SET  READ_WRITE 
GO
