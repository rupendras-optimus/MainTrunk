GO
/****** Object:  Table [dbo].[CreditPackageCostMaster]    Script Date: 11/16/2010 11:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditPackageCostMaster](
	[CostId] [int] IDENTITY(1,1) NOT NULL,
	[CreditPoints] [int] NOT NULL,
	[CostPerCredit] [numeric](18, 2) NOT NULL,
	[TributeType] [int] NULL,
	[IsActive] [bit] NULL
) 
GO 
INSERT INTO [CreditPackageCostMaster] ([CostId],[CreditPoints],[CostPerCredit],[TributeType],[IsActive])VALUES(1,1,12.00,8,NULL)
INSERT INTO [CreditPackageCostMaster] ([CostId],[CreditPoints],[CostPerCredit],[TributeType],[IsActive])VALUES(2,10,11.40,8,NULL)
INSERT INTO [CreditPackageCostMaster] ([CostId],[CreditPoints],[CostPerCredit],[TributeType],[IsActive])VALUES(3,20,10.80,8,NULL)
INSERT INTO [CreditPackageCostMaster] ([CostId],[CreditPoints],[CostPerCredit],[TributeType],[IsActive])VALUES(4,50,9.60,8,NULL)
INSERT INTO [CreditPackageCostMaster] ([CostId],[CreditPoints],[CostPerCredit],[TributeType],[IsActive])VALUES(5,100,7.85,8,NULL)
INSERT INTO [CreditPackageCostMaster] ([CostId],[CreditPoints],[CostPerCredit],[TributeType],[IsActive])VALUES(6,250,6.00,8,NULL)

GO
/****** Object:  Table [dbo].[CreditPackageMaster]    Script Date: 11/16/2010 11:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreditPackageMaster](
	[credit_package_id] [int] IDENTITY(1,1) NOT NULL,
	[credit_package_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[credit_points] [int] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[tribute_type] [int] NULL,
	[deleted_date] [datetime] NULL
) 

Go
INSERT INTO [CreditPackageMaster] ([credit_package_id],[credit_package_name],[credit_points],[created_date],[tribute_type],[deleted_date])VALUES(1,'Life Time',3,'Oct 26 2010  1:53:09:217PM',7,NULL)
INSERT INTO [CreditPackageMaster] ([credit_package_id],[credit_package_name],[credit_points],[created_date],[tribute_type],[deleted_date])VALUES(2,'1 Year',1,'Oct 26 2010  1:53:09:217PM',7,NULL)
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CreditPointTransaction]    Script Date: 11/16/2010 11:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditPointTransaction](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[NetCreditPoints] [int] NULL,
	[AmountPaid] [int] NULL,
	[CreditPackageId] [int] NULL,
	[PurchasedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
	[CouponId] [int] NULL,
	[CreditCardId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ConfirmationNo] [int] NULL
) 


GO
Create PROCEDURE [dbo].[usp_GetCreditCount]  
  
 -- Input Parameters for the stored procedure   
 @userId int
AS
Begin
if((Select COUNT(*) from CreditPointTransaction   where UserId=@UserId)>0)    
     BEGIN   
     SELECT top 1 * from CreditPointTransaction   where UserId= @UserId order by TransactionId desc 
End
Else 
begin
 Select * from CreditPointTransaction   where UserId=@UserId
End
End

GO
Create PROCEDURE [dbo].[usp_GetCreditCostMappingDetails]  
  AS
Begin
Select CreditPoints,Convert(decimal(10,2),CostPerCredit) as CostPerCredit,TributeType from CreditPackageCostMaster
End

GO

     
Create PROCEDURE [dbo].[usp_InsertCurrentCreditPoints]        
 @UserId  int,        
 @NetCreditPoints int,        
 @AmountPaid int,        
 @CreditPackageId int,        
 @PurchasedDate DateTime,        
 @IsDeleted bit,        
 @ModifiedDate DateTime,        
 @CouponId int,        
 @CreditCardId int,        
 @CreatedDate DateTime,        
 @ConfirmationNo varchar(20) 
       
AS        
BEGIN        
SET NOCOUNT ON;       
    
      
Declare @TransactionId int      
        
INSERT INTO [dbo].[CreditPointTransaction]        
(        
  UserId,        
  NetCreditPoints,         
  AmountPaid,         
  CreditPackageId,         
  PurchasedDate,         
  IsDeleted,        
  ModifiedDate,        
  CouponId,         
  CreditCardId,        
  CreatedDate,        
  ConfirmationNo   
        
)        
       VALUES        
(        
  @UserId,        
  @NetCreditPoints,         
  @AmountPaid,         
  @CreditPackageId,         
  @PurchasedDate,         
  @IsDeleted,        
  @ModifiedDate,        
  @CouponId,         
  @CreditCardId,        
  @CreatedDate,        
  @ConfirmationNo
      
)     
      
Select @TransactionId = @@IDENTITY       
Select @TransactionId  
End


GO
Create Procedure [dbo].[usp_GetVideoTributeTransactionDetails]  
@TributePackageId int  
AS  
BEGIN  
 select top 1 dbo.ISNULLorEmpty(cpt.Transactionid)AS 'TransactionId',tp.TributePackageId,tp.IsAutomaticRenew, tb.TributeId, tb.Tributename,ptc.TypeDescription,pk.Packagename,tp.Enddate,ucd.CardholdersName,ucd.Address,  
  ucd.City,lc.LocationName as State,(select LocationName from LOCATIONS lts where lts.Locationid=ucd.Country)as Country ,  
  ucd.Zip,ucd.Telephone,tp.StartDate,ucd.CreditCardType,ucd.CreditCardNo,tp.AmountPaid, tp.CreditCardId, Tb.TributeId,  
  ucd.SponsorEmailAddress  
 from TributePackage tp  
  Left Outer Join Tributes tb ON tb.TributeId = tp.UserTributeId  
  Left Outer Join Package pk ON pk.PackageId = tp.PackageId  
 Left Outer Join CreditPointTransaction cpt ON cpt.UserId = tp.UserId 
  Left Outer Join USERCREDITCARDDETAILS ucd ON ucd.UserId = tp.UserId  
  Left Outer Join Locations lc ON lc.LocationId = ucd.State  
  Left Outer Join PARAMETERSTYPESCODES ptc ON ptc.ParameterType='TRIBUTE_TYPE' and ptc.TypeCode=tb.TributeType  
 Where tp.TributePackageId = @TributePackageId order by ucd.createddate desc
END

GO
ALTER procedure [dbo].[usp_CreateTribute]
@UserTributeId as int,
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
@Date2 as datetime

as
Begin
Declare @_Email varchar(250)
Set NoCount On

Begin Transaction
Insert into Tributes (UserTributeId, TributeName,
  						TributeType, WelcomeMessage,
                        TributeImage,TributeUrl, 
                        ThemeId, City, [State],	
                       	Country, IsPrivate,IsOrderDVDChecked,IsMemTributeBoxChecked,
                        Date1,Date2,
                        CreatedBy, CreatedDate)
				values( @UserTributeId, @tributeName,
                        @tributeType, @welcomeMessage,
                        @tributeImage, @tributeUrl, @themeId, 
                        @city,  @state, @country, @IsPrivate,@IsOrderDVDChecked,@IsMemTributeBoxChecked,
                        @Date1,@Date2,
                        @UserTributeId, getdate())
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
Go

Alter Table add IsOrderDVDChecked bit, IsMemTributeBoxChecked bit

Go


INSERT INTO [themes] ([ThemeName],[ThemePath],[Tributetype],[ThemeClassId],[ThemeValue],[IsActive])VALUES('Legacy','http://172.26.176.214/DevelopmentWebsite/assets/images/Default Video.JPG','Video','yt-MemorialDefault','MemorialDefault',1)
INSERT INTO [themes] ([ThemeName],[ThemePath],[Tributetype],[ThemeClassId],[ThemeValue],[IsActive])VALUES('Flowers','http://172.26.176.214/DevelopmentWebsite/assets/images/Default Video.JPG','Video','yt-MemorialFlowers','MemorialFlowers',1)
INSERT INTO [themes] ([ThemeName],[ThemePath],[Tributetype],[ThemeClassId],[ThemeValue],[IsActive])VALUES('Patriotic','http://172.26.176.214/DevelopmentWebsite/assets/images/Default Video.JPG','Video','yt-MemorialPatriotic','MemorialPatriotic',1)
INSERT INTO [themes] ([ThemeName],[ThemePath],[Tributetype],[ThemeClassId],[ThemeValue],[IsActive])VALUES('Religious','http://172.26.176.214/DevelopmentWebsite/assets/images/Default Video.JPG','Video','yt-MemorialReligious','MemorialReligious',1)
INSERT INTO [themes] ([ThemeName],[ThemePath],[Tributetype],[ThemeClassId],[ThemeValue],[IsActive])VALUES('Celestial','http://172.26.176.214/DevelopmentWebsite/assets/images/Default Video.JPG','Video','yt-MemorialReligiousII','MemorialReligiousII',1)
INSERT INTO [themes] ([ThemeName],[ThemePath],[Tributetype],[ThemeClassId],[ThemeValue],[IsActive])VALUES('Sky','http://172.26.176.214/DevelopmentWebsite/assets/images/Default Video.JPG','Video','yt-MemorialSky','MemorialSky',1)