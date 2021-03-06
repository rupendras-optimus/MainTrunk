USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_IsVideoTribute]    Script Date: 12/21/2012 17:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IsAllowedPhotoCheck]
@photoAlbumId int
AS
begin
	if @photoAlbumId in (
	select top 2 (PA.PhotoAlbumId) 
	from PHOTOALBUM as PA
	where PA.UserTributeId = (select UserTributeId from PHOTOALBUM where PhotoAlbumId = @photoAlbumId)
	and PA.IsDeleted = 0 and PA.IsActive = 1
	order by PA.CreatedDate asc )
	begin
		select 'true' as 'IsAllowed'
	end
	else
	begin
		select 'false' as 'IsAllowed'
	end
end

