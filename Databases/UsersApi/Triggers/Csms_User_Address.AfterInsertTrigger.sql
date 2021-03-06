USE [CSMS.DB.Users]
GO
/****** Object:  Trigger [dbo].[Csms_User_Address.AfterInsertTrigger]    Script Date: 2/19/2020 9:54:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Csms_User_Address.AfterInsertTrigger] ON [dbo].[CSMS_User_Address]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @address_id int;
	DECLARE @user_id int;
	DECLARE @count int;
	DECLARE @new_is_default_value bit;

	SELECT @address_id = i.Id, @user_id = i.UserId, @new_is_default_value = i.IsDefault FROM inserted i;
	SELECT @count = COUNT(*) FROM CSMS_User_Address i WHERE i.UserId = @user_id;

	IF @count = 1
    BEGIN
		UPDATE CSMS_User_Address
		SET IsDefault = 1
		WHERE Id = @address_id
    END

	IF @count != 1 AND @new_is_default_value = 1
	BEGIN
		UPDATE CSMS_User_Address
		SET IsDefault = 0
		WHERE Id != @address_id AND UserId = @user_id
	END
END
