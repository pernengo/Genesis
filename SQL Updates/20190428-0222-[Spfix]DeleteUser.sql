USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_User]    Script Date: 28/4/2019 02:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_User]	@Id bigint = NULL,
										@UserName varchar(50) = NULL,
										@Email varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM Users WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

IF @UserName IS NOT NULL
	SET @sql = @sql + ' AND UserName = @Username';

IF @Email IS NOT NULL
	SET @sql = @sql + ' AND Email = @Email';


IF NOT(@Id IS NULL AND @UserName IS NULL AND @Email IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@UserName varchar(50), 
			@Email varchar(50)',
			@Id, @UserName, @Email;