set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_UpdateVideoTributeOwnerCredit]
	-- Input Parameters for the stored procedure 
	@videoTributeUserId		int	

AS
BEGIN
Update dbo.CreditPointTransaction Set NetCreditPoints= NetCreditPoints +1,ModifiedDate= getdate() where transactionid in (select top 1 transactionid from dbo.CreditPointTransaction where UserId = @videoTributeUserId order by CreatedDate desc)

	
END