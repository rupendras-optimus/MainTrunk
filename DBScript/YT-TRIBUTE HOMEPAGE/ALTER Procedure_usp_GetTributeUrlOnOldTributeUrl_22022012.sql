set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 22022012
-- purpose :    contains query to usp_GetTributeUrlOnOldTributeUrl
-- RunAS :      --exec usp_GetTributeUrlOnOldTributeUrl 'Test',7,'YourTribute'
---------------------------------------------------------
ALTER Procedure [dbo].[usp_GetTributeUrlOnOldTributeUrl]
@TributeUrl varchar(200),
@TributeType varchar(100),
@AppliactionType varchar(max)

AS
BEGIN
  IF @TributeType='NewBaby' SET @TributeType='New Baby'
 
  DECLARE @cnt int
  select @cnt = count(*)
  from TRIBUTES,USERS,tblApplicationType
  where TributeUrl = @TributeUrl AND TRIBUTES.IsDeleted = 0
    And TributeType in
      (Select TypeCode
       from PARAMETERSTYPESCODES
       where ParameterType = 'TRIBUTE_TYPE' And TypeDescription = @TributeType)
	and TRIBUTES.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType

  IF @cnt = 1
    SELECT TributeURL,TypeDescription from Tributes,PARAMETERSTYPESCODES,USERS,tblApplicationType
	 where OldTributeURL=@TributeURL
	and  ParameterType='TRIBUTE_TYPE'
	and TypeCode=TributeType 
	and TypeDescription = @TributeType
    and TRIBUTES.IsDeleted=0 
	and TRIBUTES.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType
  ELSE
    -- then try to find by TributeUrl only
    BEGIN
      SELECT TributeURL,TypeDescription from Tributes,PARAMETERSTYPESCODES,USERS,tblApplicationType
		where OldTributeURL=@TributeURL
	and  ParameterType='TRIBUTE_TYPE' 
	and TypeCode=TributeType
    and TRIBUTES.IsDeleted=0
	and TRIBUTES.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType
    END
END


--usp_GetTributeUrlOnOldTributeUrl @TributeUrl='Jaahnavi',@TributeType=NULL,@AppliactionType='YourMOments'