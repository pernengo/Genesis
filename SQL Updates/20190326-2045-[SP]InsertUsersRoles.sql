USE [Genesis]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_UsersRoles]	@UserId bigint,
											@RoleId bigint
AS

INSERT INTO UsersRoles VALUES(@UserId, @RoleId);
SELECT TOP 1 Id FROM UsersRoles ORDER BY Id DESC