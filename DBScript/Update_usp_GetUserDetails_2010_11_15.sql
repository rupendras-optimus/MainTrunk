set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[usp_GetUserDetails]    
@UserId int    
AS    
BEGIN    
  SET NOCOUNT ON      
  BEGIN    
   TRY    
   if((Select COUNT(*) from USERBUSINESS where [UserId]=@UserId)>0)    
     BEGIN   
     SELECT users.[UserId]    
     ,users.[UserName]    
     ,users.[Password]                                            
    -- ,users.[FirstName]  
  ,usrBus.[CompanyName] as FirstName  
     ,users.[LastName]    
     ,users.[Email]    
     ,users.[VerificationCode]    
     ,users.[UserType]    
     ,users.[UserImage]    
     ,users.[IsUsernameVisiable]    
     ,users.[AllowIncomingMsg]    
     ,users.[IsLocationHide]    
     ,users.[Status]    
     ,users.[City]    
     ,users.[State]    
     ,users.[Country]     
     ,usrBus.[Website]    
     ,usrBus.[CompanyName]  
     ,usrBus.[BusinessType]    
     ,usrBus.[BusinessAddress]    
     ,usrBus.[ZipCode]         
     ,usrBus.[Phone]    
     ,usrBus.[CompanyLogo]
	 ,usrBus.[HeaderBGColor]
	,usrBus.[HeaderLogo]
	,usrBus.[IsAddressOn]
	,usrBus.[IsWebAddressOn]
	,usrBus.[IsObUrlLinkOn]
	,usrBus.[IsPhoneNoOn]
,usrBus.[DisplayCustomHeader]
     FROM [dbo].[USERS] users INNER JOIN [USERBUSINESS]AS usrBus    
     ON  users.[UserId]=usrBus.[UserId]    
     where     
     users.[IsActive]=1    
     and    
     users.[IsDeleted]=0    
     and    
     usrBus.[IsActive]=1    
     and     
     users.[UserId]=@UserId    
     END    
                ELSE    
                    BEGIN    
      SELECT users.[UserId]    
      ,users.[UserName]    
      ,users.[Password]    
      ,users.[FirstName]    
      ,users.[LastName]    
      ,users.[Email]    
      ,users.[VerificationCode]    
      ,users.[UserType]    
      ,users.[UserImage]    
      ,users.[IsUsernameVisiable]    
      ,users.[AllowIncomingMsg]    
      ,users.[IsLocationHide]    
      ,users.[Status]    
      ,users.[City]    
      ,users.[State]    
      ,users.[Country]          
      FROM [dbo].[USERS] users    
      where                
      users.[IsActive]=1    
      and    
      users.[IsDeleted]=0    
      and          
      users.[UserId]=@UserId     
                    END     
   END TRY    
      BEGIN CATCH    
    EXEC RethrowError;    
   END CATCH    
    
        --END    
  SET NOCOUNT OFF    
        
END 



