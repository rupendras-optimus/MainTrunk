set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

alter Procedure [dbo].[usp_GetVideoDetails]
(
	@VideoId int,
	@UserId int,
	@NextPrev varchar(4)
	/*@UserTributeId int,
	@intPageSize int,
	@intCurrentPageNumber int   */
)
AS
Begin
-- Stored Procedure to get the list of Videos based on the UserTributeId.
--exec usp_GetVideoDetails 10, '', ''
--exec usp_GetVideoDetails 226, 129, 'Prev'
	Declare @intVideoId int
	Declare @intTributeId int

	Select @intTributeId = V.UserTributeId from Videos V,TRIBUTES T Where V.VideoId = @VideoId and V.IsActive = 1 and V.IsDeleted = 0 and T.TributeId = V.UserTributeId and T.IsActive = 1 and T.IsDeleted = 0
	
IF(@intTributeId > 0)
	Begin
	If (@NextPrev = 'Next')
		Begin
			Select TOP 1 @intVideoId = VideoId from Videos where VideoId > @Videoid and UserTributeId = @intTributeId  and IsActive = 1 and IsDeleted = 0
			 Order By VideoId 
		End
		Else If (@NextPrev = 'Prev')
		Begin
			Select TOP 1 @intVideoId = VideoId from Videos where VideoId < @Videoid and UserTributeId = @intTributeId and IsActive = 1 and IsDeleted = 0 
			Order By VideoId desc
		End
	Else
		Begin
			Select @intVideoId = @VideoId
		End

	Select VID.VideoId, VID.UserTributeId, VID.UserId,
				Case (Select COUNT(*) from UserBusiness where UserId = users.userid)
				When 1 Then 
					Case USERS.IsUserNameVisiable
						When 1 Then USERS.UserName
					Else (Select CompanyName from UserBusiness where UserId = users.userid)
					End
			Else 
				Case USERS.IsUserNameVisiable
					when 1 Then USERS.UserName
					Else USERS.FirstName + Char(9) + USERS.LastName
					end
			END as 'UserName',
				VID.VideoTypeId, ISNULL(VID.TributeVideoId, '') AS 'TributeVideoId' , VID.VideoUrl, VID.VideoCaption, VID.VideoDesc, VID.CreatedBy, VID.CreatedDate,
				IsNull((Select Top 1 IsNull(VideoId, 0) from Videos where UserTributeId = VID.UserTributeId and VideoId < VID.VideoId and IsActive = 1 and IsDeleted = 0 and TributeVideoId is null Order By VideoId desc), 0) AS 'NextCount',
				IsNull((Select Top 1 VideoId from Videos where UserTributeId = VID.UserTributeId and VideoId > VID.VideoId and IsActive = 1 and IsDeleted = 0 and TributeVideoId is null Order By VideoId ), 0) AS 'PrevCount',
				(Select count(*) from TributeAdministrator Where UserId = @UserId and UserTributeId = VID.UserTributeId and IsActive = 1 and IsDeleted = 0 ) AS 'IsAdmin',
				(Select count(*) from Videos where UserTributeId = VID.UserTributeId and VideoId <= VID.VideoId and IsActive = 1 and IsDeleted = 0 and TributeVideoId is null) AS 'RecordNumber',
				(Select count(*) from Videos where UserTributeId = VID.UserTributeId and IsActive = 1 and IsDeleted = 0 and TributeVideoId is null) AS 'TotalRecords',
				IsNull((Select Count(*)
					from Comments Where TypeCodeId = (SELECT dbo.ufn_GetParameterTypeCode('Video','APP_SECTION')
														) and CommentTypeId = VID.VideoId and IsActive=1 and IsDeleted=0
					 Group By CommentTypeId), 0) as 'CommentCount'
		From Videos VID
		Inner Join Users USERS ON USERS.UserId = VID.UserId
		Where VID.VideoId = @intVideoId and VID.IsActive = 1 and VID.IsDeleted = 0




	/*	Declare @FirstRec int
	Declare @LastRec int

	-- Initialize variables.
	Set @FirstRec = (@intCurrentPageNumber - 1) * @intPageSize
	Set @LastRec = (@intCurrentPageNumber * @intPageSize + 1);

	With TempVideoGalleryTable AS
	(
		Select ROW_NUMBER() OVER (ORDER BY VID.VideoId) AS 'RowNumber',
				VID.VideoId, VID.UserTributeId, VID.UserId,
				Case USERS.IsUserNameVisiable
				when 1 Then USERS.UserName
						Else USERS.FirstName + Char(9) + USERS.LastName
						END as 'UserName',
				VID.VideoTypeId, VID.VideoUrl, VID.VideoCaption, VID.VideoDesc, VID.CreatedBy
		From Videos VID
		Inner Join Users USERS ON USERS.UserId = VID.UserId
		Where VID.UserTributeId = @UserTributeId and VID.IsDeleted = 0 and VID.IsActive = 1
	)
	Select VideoId, UserTributeId, UserId, UserName, VideoTypeId, VideoUrl, VideoCaption, VideoDesc, CreatedBy,
			(Select Count(*) from TempVideoGalleryTable) as 'TotalRecords'
	from TempVideoGalleryTable
	where RowNumber > @FirstRec and RowNumber < @LastRec
	*/
	End
else
	begin
	select VideoCaption,VideoDesc from videos where VideoId = @VideoId and UserTributeId = @intTributeId
	end
End



