USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[ASIMOV3_GetParameters]    Script Date: 9/3/2019 01:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CodeReplicator_GetTableNames] AS

SELECT name
FROM sys.TABLES