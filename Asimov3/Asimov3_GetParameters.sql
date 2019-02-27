USE Genesis
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ASIMOV3_GetParameters] @ProcName varchar(50) AS

SELECT  
	'Parameter_name' = name,  
	'Type'   = type_name(user_type_id),  
	'Length'   = max_length

FROM sys.parameters WHERE object_id = object_id(@ProcName)