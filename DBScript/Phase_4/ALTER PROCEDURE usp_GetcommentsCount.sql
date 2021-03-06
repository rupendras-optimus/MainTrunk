
/****** Object:  StoredProcedure [dbo].[usp_GetcommentsCount]    Script Date: 07/19/2011 19:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC usp_GetcommentsCount 5,3,2,1

ALTER PROCEDURE [dbo].[usp_GetcommentsCount]
@userId as int,
@TypeCodeId as int,
@CommentTypeId as int,
@UserTributeId as int
AS


--DECLARE @USEROLE AS INT
--select @USEROLE=UserType from users where userid=@userId
--
--IF @USEROLE=2 OR @USEROLE=3 
--	BEGIN
      
	declare @Total_Records int
	select @Total_Records='0'
     --- New query added by rupendra to display the New Comments Table record count

		select @Total_Records = @Total_Records + count (*) 
		--FROM COMMENTS inner join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
		FROM COMMENTS left outer join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
		WHERE comments.IsDeleted <>1 and comments.IsActive=1      --Isdeleted=1 means comment has been deleted 
		AND TypeCodeId=@TypeCodeId
		AND CommentTypeId=@CommentTypeId
		
		select @Total_Records = @Total_Records + count (*) 
		--FROM COMMENTS inner join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
		FROM tblCOMMENTS_New COMMENTS left outer join users on users.userid=comments.userid  --TO CHECK WHETHTER LOGIN USER IS ADMIN OR NOT
		WHERE comments.IsDeleted <>1 and comments.IsActive=1      --Isdeleted=1 means comment has been deleted 
		AND TypeCodeId=@TypeCodeId
		AND CommentTypeId=@CommentTypeId

		Select @Total_Records "RecordCount"



