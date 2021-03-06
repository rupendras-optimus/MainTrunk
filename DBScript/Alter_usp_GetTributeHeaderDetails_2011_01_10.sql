set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[usp_GetTributeHeaderDetails]            
@UserId int            
AS
BEGIN           
           
SELECT 
BusinessAddress,
dbo.USERS.City AS City,
dbo.ufn_GetCountryStateName(dbo.USERS.State) AS State,
Phone,
HeaderBGColor,
WebSite,
HeaderLogo,
IsAddressOn,
IsPhoneNoOn,
IsWebAddressOn,
DisplayCustomHeader, 
IsObUrlLinkOn,
ObituaryLinkPage
FROM dbo.userbusiness,dbo.USERS
WHERE dbo.userbusiness.userid = dbo.USERS.UserId
and dbo.USERS.IsActive=1
and dbo.USERS.userid=@UserId
and dbo.USERS.UserType=2
END

