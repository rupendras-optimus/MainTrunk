USE [TributePortal]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetFolderName]    Script Date: 07/05/2011 17:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_GetFolderName]        
        
 (    
-- Input Parameters for the stored procedure         
 @ThemeId int

       ) 
AS        
        
BEGIN       
        
select FolderName from Themes where ThemeId =@ThemeId   
END 

