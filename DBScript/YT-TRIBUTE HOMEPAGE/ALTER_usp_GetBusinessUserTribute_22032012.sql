set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


--exec usp_GetBusinessUserTribute @TributeType_I=NULL,@UserName='yourtribute',@TributeName_I='%',@SortOrder='DESC',@intPageSize=10,@intCurrentPageNumber=1,@coApplicationId=2
  
ALTER PROCEDURE [dbo].[usp_GetBusinessUserTribute]  --'wedding','businessuser',''  
    
 -- Input Parameters for the stored procedure     
 @TributeType_I   varchar(50),    
 @UserName    varchar(100),    
 @TributeName_I   varchar(50),    
 @SortOrder    varchar(4),    
 @intPageSize   int,    
 @intCurrentPageNumber int,
 @coApplicationId int       
    
AS  
BEGIN    
    
 SET NOCOUNT ON;    
    
 DECLARE @FirstRec   int    
 DECLARE @LastRec   int    
    
    
 -- Initialize variables.    
 Set @FirstRec = (@intCurrentPageNumber - 1) * @intPageSize    
 Set @LastRec = (@intCurrentPageNumber * @intPageSize + 1);    
    
 if ( (SELECT COUNT(*) FROM USERS WHERE UserName = @UserName and UserType = 2 and IsActive = 1 and IsDeleted = 0 and coApplicationId = @coApplicationId) > 0)    
 BEGIN    
  SELECT ISNULL(Website, '') AS 'Website', ISNULL(CompanyName, '') AS 'CompanyName', ISNULL(BusinessAddress, '') AS 'BusinessAddress', ISNULL(Phone, '') AS 'Phone',     
     ISNULL(ZipCode, '') AS 'ZipCode', ISNULL(CompanyLogo, '') AS 'CompanyLogo', ISNULL(WelcomeMessage, '') AS 'WelcomeMessage',    
     ISNULL(UR.City, '') AS 'City', UB.UserId, UR.Email AS 'EmailId', UR.UserType AS 'UserType',  
    ( SELECT LocationName    
      FROM Locations     
      WHERE LocationId = UR.State and LocationParentId = UR.Country    
    )AS 'State',    
    ( SELECT LocationName     
      FROM Locations     
      WHERE LocationId = UR.Country    
    )AS 'Country'     
    
  FROM USERBUSINESS UB    
  INNER JOIN USERS UR ON UR.UserName = @UserName and UR.UserType = 2 and UR.IsActive = 1 and UR.IsDeleted = 0 and coApplicationId = @coApplicationId   
  WHERE UB.IsActive = 1 and UB.UserId = (SELECT UserId FROM USERS WHERE UserName = @UserName and UserType = 2 and IsActive = 1 and IsDeleted = 0 and coApplicationId = @coApplicationId)    
    
  IF (@TributeType_I != 'ALL') --FOR Wedding,Aniversery,Birthday,Memorial,New Baby, Graduation tribute    
  BEGIN    
   With TempTributeTable AS    
   (    
    SELECT CASE @SortOrder    
      WHEN 'ASC' THEN    
       ROW_NUMBER() OVER (ORDER BY CreatedDate ASC)    
      WHEN 'DESC' THEN    
       ROW_NUMBER() OVER (ORDER BY CreatedDate DESC)    
      END AS 'RowNumber',    
    TR.TributeId, TR.UserTributeId, TR.TributeName, TR.TributeUrl, TR.TributeImage, TR.Date1, TR.Date2, ISNULL(TR.City, '') AS 'City', TR.CreatedDate,    
    US.FirstName, US.LastName, US.IsUserNameVisiable, US.UserType, UB.CompanyName, US.UserName,    
    ( SELECT Count(*)     
      FROM WEBSTATISTICS     
      WHERE SectionTypeID = TR.TributeId and SectionTypeCodeId = (SELECT TypeCode From PARAMETERSTYPESCODES Where TypeDescription = 'Tribute')    
    )AS 'hits',    
    ( SELECT TypeDescription     
      FROM PARAMETERSTYPESCODES     
      WHERE (ParameterType = 'TRIBUTE_TYPE') and (TypeCode = TR.TributeType)    
    )AS 'TributeType',    
    ( SELECT LocationName    
      FROM Locations     
      WHERE LocationId = TR.State and LocationParentId = TR.Country    
    )AS 'State',    
    ( SELECT LocationName     
      FROM Locations     
      WHERE LocationId = TR.Country    
    )AS 'Country',    
--    (Select IsNull(TributeVIdeoId, '') from Videos Where UserTributeId = TR.TributeId AND TributeVideoId Is Not Null AND IsDeleted=0 And IsActive=1)    
--     AS 'VideoTributeId'   
(Select IsNull(VIdeoId, '') from Videos Where UserTributeId = TR.TributeId AND TributeVideoId Is Not Null AND IsDeleted=0 And IsActive=1)    
     AS 'VideoTributeId'   
    FROM TRIBUTES TR    
    LEFT OUTER JOIN Users US On US.UserId = TR.UserTributeId and US.IsActive = 1 and US.IsDeleted = 0    
    LEFT OUTER JOIN USERBUSINESS UB On UB.UserId= TR.UserTributeId and UB.IsActive = 1    
    WHERE TR.TributeName LIKE @TributeName_I and TR.IsPrivate = 0 and 
--TR.IsActive = 1 and 
TR.IsDeleted = 0     
     and TR.TributeType = ( SELECT TypeCode FROM PARAMETERSTYPESCODES WHERE (ParameterType = 'TRIBUTE_TYPE') and (TypeDescription = @TributeType_I))    
     and TR.UserTributeId = (SELECT UserId FROM USERS WHERE UserName = @UserName and UserType = 2 and IsActive = 1 and IsDeleted = 0 and coApplicationId = @coApplicationId)    
   )    
   SELECT TributeId, UserTributeId, TributeName, TributeType, TributeUrl, TributeImage, Date1, Date2, City, State, Country, CreatedDate,     
    FirstName, LastName, IsUserNameVisiable, UserType, CompanyName, UserName, hits, IsNull(VideoTributeId, '') as 'VideoTributeId',     
    (SELECT Count(*) FROM TempTributeTable) as 'TotalRecords'    
   FROM TempTributeTable    
   WHERE RowNumber > @FirstRec and RowNumber < @LastRec    
    
  END    
  ELSE    --FOR ALL TRIBUTE    
  BEGIN    
   With TempTributeTable AS    
   (    
    SELECT CASE @SortOrder    
      WHEN 'ASC' THEN    
       ROW_NUMBER() OVER (ORDER BY CreatedDate ASC)    
      WHEN 'DESC' THEN    
       ROW_NUMBER() OVER (ORDER BY CreatedDate DESC)    
      END AS 'RowNumber',    
    TR.TributeId, TR.UserTributeId, TR.TributeName, TR.TributeImage, TR.TributeUrl, TR.Date1, TR.Date2, ISNULL(TR.City, '') AS 'City', TR.CreatedDate,    
    US.FirstName, US.LastName, US.IsUserNameVisiable, US.UserType, UB.CompanyName, US.UserName,    
    ( SELECT Count(*)     
      FROM WEBSTATISTICS     
      WHERE SectionTypeID = TR.TributeId and SectionTypeCodeId = (SELECT TypeCode From PARAMETERSTYPESCODES Where TypeDescription = 'Tribute')    
    )AS 'hits',    
    ( SELECT TypeDescription     
      FROM PARAMETERSTYPESCODES     
      WHERE (ParameterType = 'TRIBUTE_TYPE') and (TypeCode = TR.TributeType)    
    )AS 'TributeType',    
    ( SELECT LocationName    
      FROM Locations     
      WHERE LocationId = TR.State and LocationParentId = TR.Country    
    )AS 'State',    
    ( SELECT LocationName     
      FROM Locations     
      WHERE LocationId = TR.Country    
    )AS 'Country',    
    --    (Select IsNull(TributeVIdeoId, '') from Videos Where UserTributeId = TR.TributeId AND TributeVideoId Is Not Null AND IsDeleted=0 And IsActive=1)    
--     AS 'VideoTributeId'   
(Select IsNull(VIdeoId, '') from Videos Where UserTributeId = TR.TributeId AND TributeVideoId Is Not Null AND IsDeleted=0 And IsActive=1)    
     AS 'VideoTributeId'   
    FROM TRIBUTES TR    
    LEFT OUTER JOIN Users US On US.UserId = TR.UserTributeId and US.IsActive = 1 and US.IsDeleted = 0    
    LEFT OUTER JOIN USERBUSINESS UB On UB.UserId= TR.UserTributeId and UB.IsActive = 1    
    WHERE TR.TributeName LIKE @TributeName_I and TR.IsPrivate = 0 and 
--TR.IsActive = 1 and 
TR.IsDeleted = 0    
     and TR.UserTributeId = (SELECT UserId FROM USERS WHERE UserName = @UserName and UserType = 2 and IsActive = 1 and IsDeleted = 0 and coApplicationId = @coApplicationId)    
   )    
    
   SELECT TributeId, UserTributeId, TributeName, TributeType, TributeImage, TributeUrl, Date1, Date2, City, State, Country, CreatedDate,     
    FirstName, LastName, IsUserNameVisiable, UserType, CompanyName, UserName, hits, IsNull(VideoTributeId, '') as 'VideoTributeId',    
    (SELECT Count(*) FROM TempTributeTable) as 'TotalRecords'    
   FROM TempTributeTable    
   WHERE RowNumber > @FirstRec and RowNumber < @LastRec    
  END    
 END     
END  
  
