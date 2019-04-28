USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_DynamicField]    Script Date: 28/4/2019 02:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Delete_DynamicField] @Id bigint,
									   @Name varchar(100)
AS
DECLARE @sql nvarchar(max);
SET @sql = 'DELETE FROM DynamicFields WHERE 1=1'
IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';
IF @Name IS NOT NULL
	SET @sql = @sql + ' AND Name = @Name';
IF NOT(@Id IS NULL AND @Name IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@Name varchar(100)',
			@Id, @Name;
