set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go
---------------------------------------------------------
-- Updated by : Laxman
-- updated on : 22022012
-- purpose :    contains query to Old TributeUrl On TributeId
-- RunAS :      --exec usp_OldTributeUrlOnTributeId 51426
---------------------------------------------------------

Create PROCEDURE usp_OldTributeUrlOnTributeId
	@TributeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select statements for procedure here
	SELECT OldTributeURL from Tributes where TributeId=@TributeId;
END

