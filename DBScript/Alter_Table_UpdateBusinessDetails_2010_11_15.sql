set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[usp_UpdateBusinessDetails]  
@UserId int,  
@Website varchar(100),  
@CompanyName varchar(255),  
@BusinessType int,  
@BusinessAddress varchar(100),  
@Phone varchar(20),  
@ZipCode varchar(20),
@HeaderBGColor varchar(10),
@HeaderLogo varchar(255),
@IsAddressOn bit,
@IsWebAddressOn bit,
@IsObUrlLinkOn bit,
@IsPhoneNoOn bit,
@DisplayCustomHeader bit
        
AS  
BEGIN  
  SET NOCOUNT ON    
  BEGIN  
     
    UPDATE [dbo].[USERBUSINESS]  
    SET      [Website] =@Website,  
       [CompanyName] = @CompanyName,  
       [BusinessType] = @BusinessType,  
       [BusinessAddress] = @BusinessAddress,  
       [Phone] = @Phone,  
       [ZipCode] = @ZipCode,
	   [HeaderBGColor] = @HeaderBGColor ,
	   [HeaderLogo] = @HeaderLogo,
	   [IsAddressOn]=@IsAddressOn ,
	   [IsWebAddressOn]=@IsWebAddressOn ,
   	   [IsObUrlLinkOn]=@IsObUrlLinkOn ,
	   [IsPhoneNoOn]=@IsPhoneNoOn,
	   [DisplayCustomHeader]=@DisplayCustomHeader
     where        
     [IsActive]=1 and [UserId]=@UserId  
  
        END  
  SET NOCOUNT OFF  
      
END  

