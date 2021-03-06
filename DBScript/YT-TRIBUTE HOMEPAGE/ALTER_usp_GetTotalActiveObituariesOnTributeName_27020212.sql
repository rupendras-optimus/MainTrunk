set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 27022012
-- purpose :    contains query to Get TotalActiveObituaries On TributeName
-- RunAS :      --exec usp_GetTotalActiveObituariesOnTributeName 'Test',7,10867
---------------------------------------------------------

ALTER PROCEDURE [dbo].[usp_GetTotalActiveObituariesOnTributeName]    ---8962,1,1,100
  -- Add the parameters for the stored procedure here    
@TributeName varchar(30),
@TributeTypeId int,
@BusinessUserId int     
    
AS       
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
   
BEGIN    
With TempCommentTable1 AS    
(    
select    
    ROW_NUMBER() OVER (ORDER BY trb.CreatedDate desc) AS 'RowNumber',    
 trb.TributeId,
 trb.UserTributeId,   
 trb.TributeName,
 trb.TributeImage,
 trb.Date1,
 trb.Date2,
trb.MessageWithoutHtml ,
 ptc.TypeDescription,    
 trb.CreatedDate as StartDate,    
 tpg.StartDate as Renewaldate,    
 ISNULL(convert(varchar,tpg.EndDate,101),'Never') as Enddate, 
trb.TributeUrl
from tributes trb,dbo.PARAMETERSTYPESCODES ptc,dbo.TRIBUTEPACKAGE tpg    
where TributeName like @TributeName   
--in (select UserTributeId from dbo.TRIBUTEADMINISTRATOR where UserId=(select UserId from dbo.TRIBUTES where TributeName=@TributeName)
--and isdeleted=0)   
and ptc.TypeCode=trb.TributeType    
and ptc.ParameterType='TRIBUTE_TYPE'    
and ptc.TypeCode=@TributeTypeId    
--and tpg.UserId=trb.UserTributeId    
and tpg.UserTributeId=trb.TributeId    
--and trb.IsActive=1 
and trb.TributeType=7 
and trb.IsDeleted=0    
and tpg.CreatedDate=(SELECT MAX(CreatedDate)  FROM TRIBUTEPACKAGE where UserTributeId=trb.TributeId and IsDeleted=0 )    
and (@BusinessUserId is NULL OR trb.UserTributeId = @BusinessUserId)
)    
Select count(TributeId) as [TotalObitCount]   
 from TempCommentTable1     
 
  
END
END

