USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[ASIMOV3_GetSPs]    Script Date: 9/3/2019 01:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CodeReplicator_GetSPs] AS

SELECT ROUTINE_NAME FROM Genesis.information_schema.routines WHERE routine_type = 'PROCEDURE'