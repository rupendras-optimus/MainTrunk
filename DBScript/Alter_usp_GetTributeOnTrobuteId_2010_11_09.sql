set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[usp_GetTributeOnTrobuteId]
@TributeId int
--SP to get the tribute details based on the TributeUrl and TributeType
--exec usp_GetTributeDetails '22', 'Graduation'
AS
BEGIN
SELECT	
	TributeImage,
	TributeName,
	TributeType,
    Date1,
	Date2,
	City,
	State,
	Country,
    IsOrderDVDChecked,
    IsMemTributeBoxChecked,
    LinkMemTributeId

FROM    dbo.TRIBUTES ,dbo.PARAMETERSTYPESCODES, dbo.TRIBUTEPACKAGE,	dbo.LOCATIONS		
WHERE  dbo.TRIBUTES.TributeType=dbo.PARAMETERSTYPESCODES.TypeCode
and dbo.TRIBUTEPACKAGE.UserTributeId = dbo.TRIBUTES.TributeId
and  dbo.TRIBUTES.TributeId = @TributeId and dbo.PARAMETERSTYPESCODES.ParameterType = 'TRIBUTE_TYPE'
and dbo.TRIBUTES.State=dbo.LOCATIONS.LocationId
END
