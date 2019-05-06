USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Insert_RolesPermissions]    Script Date: 5/5/2019 21:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Insert_RolesPermissions]	@RoleId bigint,
													@ModuleId bigint
AS

INSERT INTO RolesPermissions VALUES(@RoleId, @ModuleId);
SELECT TOP 1 Id FROM RolesPermissions ORDER BY Id DESC