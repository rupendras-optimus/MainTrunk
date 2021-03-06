set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_AddComments]   
@UserId as int,  
@TypeCodeId as int,  
@CommentTypeId as varchar(100),  
@Message as varchar (3000), --should be text  
@IsPrivate as bit,  
@CreatedBy as int,  
 
@IsActive as bit,  
@IsDeleted as bit ,  

--- Added by rupendra for YT phase 4 Enhancement on 21 jun 2011
@UserName varchar(200)='',
@UserType smallint='0'

--- end here

AS  
--first time entry would be Active (1)  
set @IsActive=1     
--first time entry would be Active (1)  
set @IsDeleted=0  
 



--- end
Declare @CommentId int  


--- previous Query
--		INSERT INTO Comments  
--					(
--						UserId,TypeCodeId,CommentTypeId,Message,IsPrivate,CreatedBy,CreatedDate,IsActive,IsDeleted
--						
--					)  
--			VALUES   
--				(
--					@UserId,@TypeCodeId,@CommentTypeId,@Message,@IsPrivate,@CreatedBy,GETDATE(),@IsActive,@IsDeleted
--					
--				)  

--- End
   

-- here @UserType ---->  0 -- guest user , 1---> YT user , 2 ---> facebook user
INSERT INTO [tblCOMMENTS_New]
					(
						UserId,TypeCodeId,CommentTypeId,Message,IsPrivate,CreatedBy,CreatedDate,IsActive,IsDeleted
						--- Added by rupendra for YT phase 4 Enhancement on 21 jun 2011
						,UserName,UserType
					)  
VALUES   
	(
		@UserId,@TypeCodeId,@CommentTypeId,@Message,@IsPrivate,@CreatedBy,GETDATE(),@IsActive,@IsDeleted
		--- Added by rupendra for YT phase 4 Enhancement on 21 jun 2011
						,@UserName,@UserType
	)  
  
 Set @CommentId = @@Identity  
  
 Declare @CreateDate datetime  
 Set @CreateDate = GetDate()  
 --to insert data in Latest Summary Table  
 Exec usp_InsertLatestSummary 'Guestbook', @CommentId, @CreatedBy, @CommentTypeId, @CommentTypeId, 0, @CreateDate  
 
 


