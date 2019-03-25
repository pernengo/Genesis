create procedure Insert_AccessCode (@AccessCode varchar(50), @IdUser bigint, @LoginDate varchar(50), @AlreadyUsed bit)
as
begin
INSERT INTO AccessCodes (AccessCode, IdUser, LoginDate, AlreadyUsed) VALUES (@AccessCode, @IdUser, @LoginDate, @AlreadyUsed)
end

GO


create procedure Get_IdUserByAccessCode (@AccessCode varchar(50))
as
begin
SELECT IdUser FROM AccessCodes WHERE AccessCode = @AccessCode
end

GO

create procedure Update_AccessCode(@AccessCode varchar(50))
as
begin
UPDATE AccessCodes SET AlreadyUsed = 1 WHERE AccessCode = @AccessCode
end

GO