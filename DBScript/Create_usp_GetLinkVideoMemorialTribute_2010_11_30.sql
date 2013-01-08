set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[usp_GetLinkVideoMemorialTribute]
@UserId int,
@VideoTributeId int

as
	Begin
			select MemTributeId
			from  dbo.LinkVideoMemorialTribute
 where 
VideoTributeId = @VideoTributeId
and UserId = @UserId
End
