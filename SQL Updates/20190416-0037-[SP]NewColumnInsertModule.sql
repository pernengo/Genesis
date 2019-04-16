USE [Genesis]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Module]    Script Date: 16/4/2019 00:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Insert_Module] (	@ModuleName varchar(50),
									@Ascx varchar(50),
									@Dll varchar(50), 
									@Icon varchar(50))
as
begin

insert into [Modules] values (@ModuleName, @Ascx, @Dll, @Icon);
select top 1 Id from [Modules] order by Id desc

end								
