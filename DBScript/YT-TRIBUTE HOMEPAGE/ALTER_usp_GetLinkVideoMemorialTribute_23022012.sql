set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 23022012
-- purpose :    contains query to Get Linked Video MemorialTribute to a tribute.
-- RunAS :      --exec usp_GetLinkVideoMemorialTribute 10867,52424
---------------------------------------------------------

ALTER Procedure [dbo].[usp_GetLinkVideoMemorialTribute]
@UserId int,
@VideoTributeId int

as
	Begin
			select MemTributeId
			from  dbo.LinkVideoMemorialTribute,dbo.TRIBUTES
 where 
VideoTributeId = @VideoTributeId
and UserId = @UserId
and MemTributeId = TRIBUTES.TributeId
and TRIBUTES.IsDeleted = 0
End


