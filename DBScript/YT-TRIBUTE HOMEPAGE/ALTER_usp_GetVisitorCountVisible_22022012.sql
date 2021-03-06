set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Udham
-- updated on : 22022012
-- purpose :    contains query to Get Visitor Count Visiblility
-- RunAS :     usp_GetVisitorCountVisible,'Test','YourTribute'

---------------------------------------------------------

ALTER PROCEDURE [dbo].[usp_GetVisitorCountVisible]

	-- Input Parameters for the stored procedure 
	@TributeUrl	varchar(max),
	@AppliactionType varchar(max)
AS

BEGIN
	SELECT dbo.USERS.IsVisitCountHide
	FROM dbo.USERS,dbo.TRIBUTES,tblApplicationType
	WHERE dbo.USERS.IsActive = 1 
and dbo.TRIBUTES.TributeUrl =  @TributeUrl 
and dbo.TRIBUTES.UserTributeId = dbo.USERS.UserId
and USERS.coApplicationId = tblApplicationType.coApplicationId
and tblApplicationType.coApplicationType = @AppliactionType
END


-- usp_GetVisitorCountVisible 'Stella-Archuleta','YourTribute'
