   
ALTER PROCEDURE [dbo].[usp_UpdatePrivacySettings] 
    @UserId int,
	@IsUsernameVisiable bit,
    @AllowIncomingMsg bit,
    @IsLocationHide bit,
    @IsVisitCountHide bit
AS
BEGIN
	
	SET NOCOUNT ON;
		UPDATE [dbo].[USERS]
		   SET 
			  [IsUsernameVisiable] = @IsUsernameVisiable,
			  [AllowIncomingMsg] = @AllowIncomingMsg,
			  [IsLocationHide] = @IsLocationHide	,
			  [IsVisitCountHide] =@IsVisitCountHide		  
		 WHERE 
				[IsActive]=1 and [IsDeleted]=0 and [UserId]=@UserId
    
	
END
