set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

Create procedure [dbo].[usp_EnableXMLFeedOnUserIdOrName]
(
@UserId int,
@UserName varchar(255),
@EnableXMLFeed bit
)
as
Begin
SET NOCOUNT ON;
Declare @cnt int
if (@UserId > 0)
	Begin
		Select @cnt= 	Count(UserId) 
				from	dbo.USERS 
		where	UserId = @UserId and UserType = 2 and IsDeleted = 0
	If @cnt > 0
		Begin
			Update USERS
			Set EnableXMLFeed = @EnableXMLFeed
			where UserId=@UserId
			Select 1 as UpdateOutput, @UserId as UserId 
		End
else
Select 0 as UpdateOutput, 0 as UserId
	End	
Else
	Begin
		Select @cnt= Count(UserId) 
				from	dbo.USERS 
		where	UserName = @UserName and UserType = 2 and IsDeleted = 0
	If @cnt > 0
		Begin
			Update USERS
			Set EnableXMLFeed = @EnableXMLFeed
			where UserName = @UserName
			Select 1 as UpdateOutput, UserId from USERS where UserName = @UserName
		End
else
Select 0 as UpdateOutput, 0 as UserId
	End				

END
