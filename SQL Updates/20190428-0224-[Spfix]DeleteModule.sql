USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Module]    Script Date: 28/4/2019 02:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_Module]	@Id bigint = NULL,
										@ModuleName varchar(50) = NULL
AS

DECLARE @sql nvarchar(max);

SET @sql = 'DELETE FROM Modules WHERE 1=1'

IF @Id IS NOT NULL
	SET @sql = @sql + ' AND Id = @Id';

IF @ModuleName IS NOT NULL
	SET @sql = @sql + ' AND ModuleName = @ModuleName';


IF NOT(@Id IS NULL AND @ModuleName IS NULL)
	EXEC sp_executesql @sql, N'
			@Id bigint, 
			@ModuleName varchar(50)',
			@Id, @ModuleName;