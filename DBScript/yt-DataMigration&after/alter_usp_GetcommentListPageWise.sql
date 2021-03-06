set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[usp_GetcommentListPageWise]
@userId as int,
@TypeCodeId as int,
@CommentTypeId as int,
@TributeId as int,
@CurrentPage As tinyint,
@PageSize As tinyint
AS
BEGIN  
  --DECLARE @USEROLE AS INT
  --select @USEROLE=UserType from users where userid=@userId

  Declare @FirstRec int
  Declare @LastRec int
  Declare @BusinessCount int
  Declare @UserName varchar(200)
  -- Initialize variables.
  Set @FirstRec = (@CurrentPage - 1) * @PageSize
  Set @LastRec = (@CurrentPage * @PageSize + 1);

  With TempCommentTable AS
  (SELECT ROW_NUMBER() OVER (ORDER BY Comments.CreatedDate desc) AS 'RowNumber',
	  CommentId,comments.UserId,TypeCodeId,CommentTypeId,Message,
	  IsPrivate,CreatedBy,(CreatedDate),ModifiedBy,ModifiedDate,
	  comments.IsActive,comments.IsDeleted,
	  users.UserType, users.UserImage, users.FacebookUid,
	  0 as IsAdmin,--isnull(TRIBUTEADMINISTRATOR.UserId,0) as IsAdmin,
	  Case (Select COUNT(*) from UserBusiness where UserId = users.userid)
	  When 1 Then 
	       Case USERS.IsUserNameVisiable
	       When 1 Then USERS.UserName
	       Else (Select CompanyName from UserBusiness where UserId = users.userid)
	       End
	  Else 
	       Case USERS.IsUserNameVisiable
	       when 1 Then USERS.UserName
	       Else 
			CASE USERS.LastName
				WHEN '' THEN USERS.FirstName
				Else	USERS.FirstName + Char(9) + USERS.LastName
			End
			end
	  END as 'UserName',
	  users.City, LOC1.LocationName AS 'State', LOC2.LocationName AS 'Country', users.IsLocationHide
   FROM COMMENTS inner join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
			  --left join TRIBUTEADMINISTRATOR on TRIBUTEADMINISTRATOR.UserTributeId=@TributeId --and TRIBUTEADMINISTRATOR.userid=@userId
	Left Outer Join Locations LOC1 ON LOC1.LocationId = Users.State and LOC1.LocationParentId = Users.Country -- For State
	Left Outer Join Locations LOC2 ON LOC2.LocationId = Users.Country --For Country
   WHERE comments.IsDeleted =0 and comments.IsActive=1      --Isdeleted=1 means comment has been deleted 
     AND TypeCodeId=@TypeCodeId AND CommentTypeId=@CommentTypeId
  )
  Select CommentId, UserId, TypeCodeId, CommentTypeId, Message, IsPrivate, CreatedBy, CreatedDate, ModifiedBy,
	 ModifiedDate, IsActive, IsDeleted, UserType, UserImage, IsAdmin, UserName, FacebookUid,
	 City, State, Country, IsLocationHide
  from TempCommentTable
  where RowNumber > @FirstRec and RowNumber < @LastRec

END

