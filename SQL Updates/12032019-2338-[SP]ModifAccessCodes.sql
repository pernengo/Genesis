USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Insert_AccessCode]    Script Date: 12/03/2019 23:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Insert_AccessCode] (@AccessCode varchar(50), @IdUser bigint, @LoginDate varchar(50), @AlreadyUsed bit)
as
begin
INSERT INTO AccessCodes (AccessCode, IdUser, LoginDate, AlreadyUsed) VALUES (@AccessCode, @IdUser, convert(datetime, @LoginDate, 120), @AlreadyUsed)
end

