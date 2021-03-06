USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetcommentListPageWise]    Script Date: 12/28/2012 12:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
  (
SELECT ROW_NUMBER() OVER (ORDER BY Comments.CreatedDate desc) AS 'RowNumber',
	  CommentId,comments.UserId,TypeCodeId,CommentTypeId,Message,
	  IsPrivate,CreatedBy,(CreatedDate),ModifiedBy,ModifiedDate,
	  comments.IsActive,comments.IsDeleted
	,comments.UserType
	, users.UserImage, users.FacebookUid,
	  0 as IsAdmin,   
	 	  Case (Select COUNT(*) from UserBusiness where UserId = comments.UserId)
	  When 1 Then 
	       Case USERS.IsUserNameVisiable
	       When 1 Then USERS.UserName
	       Else (Select CompanyName from UserBusiness where UserId = users.userid)
	       End
	  Else 
		Case((Select COUNT(*) from Users where UserId = comments.UserId))
		 When 1 Then
				   Case USERS.IsUserNameVisiable
				   when 1 Then USERS.UserName
				   Else 
					CASE USERS.LastName
						WHEN '' THEN USERS.FirstName
						Else	USERS.FirstName + Char(9) + USERS.LastName
					End
			End
	  Else 
			comments.UserName
		end
	  END as 'UserName'
		-- New Added field on 22-june-2011
     --,comments.UserType
     ,users.City, LOC1.LocationName AS 'State', LOC2.LocationName AS 'Country', users.IsLocationHide
    
     ,'2' "tableType"   --- 2 for this data is comming from tblComments_New table
	FROM tblComments_New Comments
 
	left outer join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
	 --left join TRIBUTEADMINISTRATOR on TRIBUTEADMINISTRATOR.UserTributeId=@TributeId --and TRIBUTEADMINISTRATOR.userid=@userId
	Left Outer Join Locations LOC1 ON LOC1.LocationId = Users.State and LOC1.LocationParentId = Users.Country -- For State
	Left Outer Join Locations LOC2 ON LOC2.LocationId = Users.Country --For Country
   WHERE comments.IsDeleted =0 and comments.IsActive=1      --Isdeleted=1 means comment has been deleted 
     AND TypeCodeId=@TypeCodeId AND CommentTypeId=@CommentTypeId

	Union all

	SELECT ROW_NUMBER() OVER (ORDER BY Comments.CreatedDate desc) AS 'RowNumber',
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
	  END as 'UserName'
	-- Added on 22-june-2011
--     ,'1' "UserType"
	,users.City, LOC1.LocationName AS 'State', LOC2.LocationName AS 'Country', users.IsLocationHide
	
--Added on 22-june-2011
   ,'1' "tableType"   --- 1 for this data is comming from Comments table


   FROM COMMENTS inner join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
			  --left join TRIBUTEADMINISTRATOR on TRIBUTEADMINISTRATOR.UserTributeId=@TributeId --and TRIBUTEADMINISTRATOR.userid=@userId
	Left Outer Join Locations LOC1 ON LOC1.LocationId = Users.State and LOC1.LocationParentId = Users.Country -- For State
	Left Outer Join Locations LOC2 ON LOC2.LocationId = Users.Country --For Country
   WHERE comments.IsDeleted =0 and comments.IsActive=1      --Isdeleted=1 means comment has been deleted 
     AND TypeCodeId=@TypeCodeId AND CommentTypeId=@CommentTypeId

	--- Added new on 22-june-2011 by rupendra


	

  )
  Select CommentId, UserId, TypeCodeId, CommentTypeId, Message, IsPrivate, CreatedBy, CreatedDate, ModifiedBy,
	 ModifiedDate, IsActive, IsDeleted, UserType, UserImage, IsAdmin, UserName, FacebookUid,
	 City, State, Country, IsLocationHide
     -- Added new
    ,UserType,tableType
  from TempCommentTable
  where RowNumber > @FirstRec and RowNumber < @LastRec

END


