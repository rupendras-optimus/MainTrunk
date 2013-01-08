set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_GetLinkedVideoTributeId]  
  
 -- Input Parameters for the stored procedure   
 @tributeId int,
 @userId int
AS
Begin
if((Select COUNT(*) from LinkVideoMemorialTribute   where MemTributeId =@tributeId and UserId =@userId ) >0)
select videotributeid from LinkVideoMemorialTribute where  MemTributeId =  @tributeId and UserId =@userId
else
Select COUNT(*) tributeid from LinkVideoMemorialTribute   where MemTributeId =@tributeId and UserId =@userId
    
End
