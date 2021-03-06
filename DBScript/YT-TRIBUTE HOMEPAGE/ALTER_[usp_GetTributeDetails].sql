set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 22022012
-- purpose :    contains query to Get TributeDetails
-- RunAS :      --exec usp_GetTributeDetails 'Test',7,'YourTribute'
---------------------------------------------------------

ALTER Procedure [dbo].[usp_GetTributeDetails]
@TributeUrl varchar(200),
@TributeType varchar(100),
@AppliactionType varchar(max)
--SP to get the tribute details based on the TributeUrl and TributeType
--exec usp_GetTributeDetails '22', 'Graduation'
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
    SELECT T.TributeId, T.TributeName,T.CreatedDate,T.Date2,
	   T.TributeUrl, T.TributeImage, T.ThemeId, T.GoogleAdSense, T.IsActive, 
	   (SELECT TypeDescription 
	    FROM PARAMETERSTYPESCODES 
	    WHERE ParameterType = 'TRIBUTE_TYPE' And 
		  TypeCode = T.TributeType) as 'TypeDescription',T.TributePackageType
    FROM Tributes T,USERS,tblApplicationType
    WHERE TributeUrl = @TributeUrl AND T.IsDeleted = 0
      And TributeType in 
      (SELECT TypeCode 
       FROM PARAMETERSTYPESCODES 
       WHERE ParameterType = 'TRIBUTE_TYPE' And TypeDescription = @TributeType)
	and T.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType
  ELSE 
    -- then try to find by TributeUrl only
    BEGIN
      select @cnt = count(*) 
      FROM TRIBUTES,USERS,tblApplicationType
      WHERE TributeUrl = @TributeUrl AND TRIBUTES.IsDeleted = 0
	and TRIBUTES.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType


      if @cnt = 1 
	SELECT T.TributeId, T.TributeName,T.CreatedDate,T.Date2,
			T.TributeUrl, T.TributeImage, T.ThemeId, T.GoogleAdSense, T.IsActive, 
	       (SELECT TypeDescription 
		FROM PARAMETERSTYPESCODES 
		WHERE ParameterType = 'TRIBUTE_TYPE' And 
		      TypeCode = T.TributeType) as 'TypeDescription',T.TributePackageType
	FROM Tributes T,USERS,tblApplicationType
	WHERE TributeUrl = @TributeUrl AND T.IsDeleted = 0
	and T.UserTributeId = USERS.UserId
	and USERS.coApplicationId = tblApplicationType.coApplicationId
	and tblApplicationType.coApplicationType = @AppliactionType

    END
END

--exec usp_GetTributeDetails @TributeUrl='Jaahnavi',@TributeType=NULL,@AppliactionType='YourMOments'