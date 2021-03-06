set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER PROCEDURE [dbo].[usp_UpdateWelcomeMessage]
	-- Input Parameters for the stored procedure 
	@UserName		varchar(100),
	@WelcomeMessage	varchar(1000),
	@ApplicationType varchar(max)

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @UserId int

	SELECT @UserId = UserId
	FROM USERS,tblApplicationType
	WHERE UserName = @UserName and UserType = 2 and IsActive = 1 and IsDeleted = 0 and coApplicationType=@ApplicationType and tblApplicationType.coApplicationId = USERS.coApplicationId

	if ( (SELECT COUNT(*) FROM USERS,tblApplicationType WHERE UserName = @UserName and UserType = 2 and IsActive = 1 and IsDeleted = 0 and coApplicationType=@ApplicationType and tblApplicationType.coApplicationId = USERS.coApplicationId) > 0)
	BEGIN
		UPDATE	USERBUSINESS 
		SET		WelcomeMessage = @WelcomeMessage
		WHERE	UserId = @UserId
	
		SELECT 1
	END
	ELSE
		SELECT 0

END

