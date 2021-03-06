USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateTribute]    Script Date: 11/26/2012 16:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[usp_CreateTribute]
@UserTributeId as int,
@tributeFirstName as varchar(50),
@tributeLastName as varchar(50),
@tributeName as varchar(250),
@tributeType as int,
@welcomeMessage as varchar(1000),
@tributeImage as varchar(250)=null,
@tributeUrl as varchar(250),
@themeId as int,
@city as varchar(50),
@state as int,
@country as int,
@IsPrivate as bit,
@IsOrderDVDChecked as bit,
@IsMemTributeBoxChecked  as bit,
@Date1 as datetime,
@Date2 as datetime,
@PostMessage text, 
@MessageWithoutHtml text

as
Begin
Declare @_Email varchar(250)
Set NoCount On

Begin Transaction
Insert into Tributes (UserTributeId, TributeFirstName, TributeLastName,TributeName,
        TributeType, WelcomeMessage,
                        TributeImage,TributeUrl,OldTributeURL ,
                        ThemeId, City, [State], 
                        Country, IsPrivate,IsOrderDVDChecked,IsMemTributeBoxChecked,
                        Date1,Date2,
                        CreatedBy, CreatedDate,PostMessage,MessageWithoutHtml)
    values( @UserTributeId, @tributeFirstName, @tributeLastName, @tributeName,
                        @tributeType, @welcomeMessage,
                        @tributeImage, @tributeUrl,@tributeUrl, @themeId, 
                        @city,  @state, @country, @IsPrivate,@IsOrderDVDChecked,@IsMemTributeBoxChecked,
                        @Date1,@Date2,
                        @UserTributeId, getdate(),@PostMessage,@MessageWithoutHtml)
Select @@IDENTITY

Select @_Email=Email from dbo.USERS where UserID=@UserTributeId;

EXEC usp_SaveAdminConfirm @@IDENTITY,@UserTributeId,@_Email,1
---- @UserTributeId  int,
----      @UserId int,
----      @Email varchar(250),
----      @IsOwner bit  
If @@Error<>0
Begin
Rollback transaction
Return -1
End
Commit Transaction
  
Set NoCount Off
End

