USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Get_Module]    Script Date: 21/2/2019 01:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Get_Module] 		@Id bigint = NULL,
										@ModuleName varchar(50) = NULL,
										@Ascx varchar(50) = NULL,
										@Dll varchar(50) = NULL
AS
BEGIN

DECLARE @Sql nvarchar(max)

SET @Sql = 'SELECT * from [Modules] where 1=1';

IF @Id IS NOT NULL
	SET @Sql = @Sql + ' AND Id = @Id';

IF @ModuleName IS NOT NULL
	SET @Sql = @Sql + ' AND ModuleName = @ModuleName';

IF @Ascx IS NOT NULL
	SET @Sql = @Sql + ' AND Ascx = @Ascx';

IF @Dll IS NOT NULL
	SET @Sql = @Sql + ' AND Dll = @Dll';


EXEC sp_executesql @sql, N'
		@Id bigint,
		@ModuleName varchar(50),
		@Ascx varchar(50),
		@Dll varchar(50)',
		@Id, @ModuleName, @Ascx, @Dll;		

END


