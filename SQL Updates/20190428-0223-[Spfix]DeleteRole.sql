USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Role]    Script Date: 28/4/2019 02:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_Role]	@Id bigint = NULL,
										@Role varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM Roles WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

IF @Role IS NOT NULL
	SET @sql = @sql + ' AND Role = @Role';


IF NOT(@Id IS NULL AND @Role IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@Role varchar(50)',
			@Id, @Role;