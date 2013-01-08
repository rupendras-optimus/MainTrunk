set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[usp_GetVideoDetailsOnUserTributeId]
@tributeId int
as
	Begin
			select VideoId ,UserId, TributeVideoId, UserTributeId
			from  dbo.VIDEOS where UserTributeId=@tributeId			
	End


