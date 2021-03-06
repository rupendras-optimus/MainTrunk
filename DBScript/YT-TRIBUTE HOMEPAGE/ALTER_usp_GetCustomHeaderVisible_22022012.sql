set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 22022012
-- purpose :    contains query to Get CustomHeader Visiblity
-- RunAS :      --exec usp_GetCustomHeaderVisible 'Test','YourTribute'
---------------------------------------------------------

ALTER PROCEDURE [dbo].[usp_GetCustomHeaderVisible]

	-- Input Parameters for the stored procedure 
	@TributeUrl	varchar(max),
	@AppliactionType varchar(max)
AS

BEGIN
	SELECT USERBUSINESS.DisplayCustomHeader
	FROM USERBUSINESS,TRIBUTES,USERS,tblApplicationType
	WHERE USERBUSINESS.IsActive = 1 
and TRIBUTES.TributeUrl =  @TributeUrl 
and TRIBUTES.UserTributeId = USERBUSINESS.UserId
and USERBUSINESS.UserId = USERS.UserId
and USERS.coApplicationId = tblApplicationType.coApplicationId
and tblApplicationType.coApplicationType = @AppliactionType
END

