USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_IsAllowedPhotoCheck]    Script Date: 12/21/2012 22:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[usp_IsAllowedPhotoCheckonPhotoId]
@photoId int
AS
begin
	if (select Ph.PhotoAlbumId from PHOTO as Ph where Ph.UserPhotoId = @photoId) in (
	select top 2 (PA.PhotoAlbumId) 
	from PHOTOALBUM as PA , PHOTO as P
	where PA.UserTributeId = (select UserTributeId from PHOTOALBUM where PhotoAlbumId = P.PhotoAlbumId and p.UserPhotoId = @photoId)
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

