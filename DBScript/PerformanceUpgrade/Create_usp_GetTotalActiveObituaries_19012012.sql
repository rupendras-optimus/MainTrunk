set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


Create PROCEDURE [dbo].[usp_GetTotalActiveObituaries]    ---10867
  -- Add the parameters for the stored procedure here    
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
trb.ModifiedDate,
 ptc.TypeDescription,    
 trb.CreatedDate as StartDate,    
 tpg.StartDate as Renewaldate,
 ISNULL(convert(varchar,tpg.EndDate,101),'Never') as Enddate,   
  trb.TributeUrl 
  from tributes trb,dbo.PARAMETERSTYPESCODES ptc,dbo.TRIBUTEPACKAGE tpg, dbo.USERS usr    
where
 --trb.TributeId=@CurrentPage   
--in (select UserTributeId from dbo.TRIBUTEADMINISTRATOR where isdeleted=0)    
 ptc.TypeCode=trb.TributeType    
and ptc.ParameterType='TRIBUTE_TYPE'   
and ptc.TypeCode=7   
and usr.UserType=2
and usr.EnableXMLFeed=1
and usr.UserId=@BusinessUserId
and tpg.UserId=@BusinessUserId
and trb.UserTributeId=@BusinessUserId   
and tpg.UserTributeId=trb.TributeId    
and trb.IsActive=1 and 
trb.TributeType=7 
and trb.IsDeleted=0    
)    
Select   
Count( TributeId) as TotalObitCount
 from TempCommentTable1       
END    

END  

