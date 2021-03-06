set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 22022012
-- purpose :    contains query to Get TributeId OnTributeUrl
-- RunAS :      --exec usp_GetTributeIdOnTributeUrl @TributeUrl='Jaahnavi',@AppliactionType='YourMoments'
				--exec usp_GetTributeIdOnTributeUrl @TributeUrl='Jaahnavi',@AppliactionType='YourTribute'

---------------------------------------------------------

ALTER PROCEDURE [dbo].[usp_GetTributeIdOnTributeUrl]
	@TributeUrl varchar(max),
	@AppliactionType varchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select statements for procedure here
	SELECT distinct TributeId from Tributes,USERS,tblApplicationType 
	where TributeUrl=@TributeUrl 
	and TRIBUTES.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType

union
SELECT distinct TributeId from Tributes,USERS,tblApplicationType 
	where OldtributeUrl=@TributeUrl 
	and TRIBUTES.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType

END


