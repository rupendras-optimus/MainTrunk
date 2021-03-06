set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- =============================================
-- Author:		<Laxman
-- Create date: 22 03 2012
-- Description:	<Get UserId By UserName,,>
-- Execution : GetUserIdByUserName @UserName='yourtribute',@ApplicationType='YourTribute'
-- =============================================
Create PROCEDURE [dbo].[usp_GetUserIdByUserName]
	@UserName varchar(max),
	@ApplicationType varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select statements for procedure here
	SELECT UserId from USERS,tblApplicationType where UserName=@UserName and coApplicationType=@ApplicationType and tblApplicationType.coApplicationId = USERS.coApplicationId and IsDeleted = 0;
END


