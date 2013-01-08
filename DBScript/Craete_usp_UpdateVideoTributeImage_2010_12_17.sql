set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[usp_UpdateVideoTributeImage]
	@TributeId			int,
	@TributeImage	varchar(255)

AS
BEGIN
		UPDATE	TRIBUTES 
		SET		TributeImage = @TributeImage
		WHERE	TributeId = @TributeId 

END

exec usp_UpdateVideoTributeImage