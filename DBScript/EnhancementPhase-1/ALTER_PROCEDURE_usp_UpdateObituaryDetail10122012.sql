USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateObituaryDetail]    Script Date: 12/10/2012 17:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_UpdateObituaryDetail]
	@TributeId			int,
	@PostMessage	   text,
	@MessageWithoutHtml text,
	@MessageAddedModifiedBy				int

AS
BEGIN

	SET NOCOUNT ON;
	if((select MessageCreatedBy from TRIBUTES Where TributeId = @TributeId )> 0)
	Begin
			UPDATE	TRIBUTES
		SET		PostMessage = @PostMessage,
				MessageWithoutHtml = @MessageWithoutHtml,
				MessageModifiedDate = getdate(),
				MessageModifiedBy = @MessageAddedModifiedBy

		WHERE	TributeId = @TributeId
	End	
	else
	Begin
		UPDATE	TRIBUTES
		SET		PostMessage = @PostMessage,
				MessageWithoutHtml = @MessageWithoutHtml,
				MessageCreatedDate = getdate(),
				MessageCreatedBy = @MessageAddedModifiedBy

		WHERE	TributeId = @TributeId
	end
END