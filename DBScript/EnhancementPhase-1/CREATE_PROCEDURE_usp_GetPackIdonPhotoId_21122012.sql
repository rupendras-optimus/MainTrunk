USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_IsAllowedPhotoCheck]    Script Date: 12/21/2012 21:45:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].usp_GetPackIdonPhotoId
@PhotoId int
AS
begin
	select min(PackageId) as  PackageId from TRIBUTEPACKAGE where UserTributeId = (select UserTributeId from PHOTOALBUM as PA,PHOTO as P where PA.PhotoAlbumId = P.PhotoAlbumId and P.UserPhotoId = @PhotoId)
end

