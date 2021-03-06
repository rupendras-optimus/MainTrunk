set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[usp_GetTributeOnTributeId]
@TributeId int
--SP to get the tribute details based on the TributeUrl and TributeType
--exec usp_GetTributeDetails '22', 'Graduation'
AS
BEGIN
SELECT
	TributeImage,
	TributeName,
    TributeURL,
	TributeType,
	TRIBUTES.UserTributeId,
    Date1,
	Date2,
	dbo.TRIBUTES.City,
	dbo.ufn_GetCountryStateName(dbo.TRIBUTES.State) AS State,
	dbo.ufn_GetCountryStateName(dbo.TRIBUTES.Country) AS Country,
    IsOrderDVDChecked,
    IsMemTributeBoxChecked,
    LinkMemTributeId,
	USERS.Email,
    IsPrivate
	

FROM   dbo.TRIBUTES ,dbo.PARAMETERSTYPESCODES, dbo.TRIBUTEPACKAGE  ,dbo.USERS
			WHERE  dbo.TRIBUTES.TributeType=dbo.PARAMETERSTYPESCODES.TypeCode
			and dbo.TRIBUTEPACKAGE.UserTributeId = dbo.TRIBUTES.TributeId
			and TRIBUTES.UserTributeId = dbo.USERS.UserId
			and  dbo.TRIBUTES.TributeId =@TributeId and dbo.PARAMETERSTYPESCODES.ParameterType = 'TRIBUTE_TYPE'
END


