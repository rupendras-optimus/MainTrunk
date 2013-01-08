USE [TributePortal]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteThemeCategory]    Script Date: 07/05/2011 17:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
/*  Delete Theme  - This procedure will Delete the theme.   
*/  
  
Create PROCEDURE [dbo].[usp_DeleteThemeCategory]  
  
 -- Input Parameters for the stored procedure   
 @themeId  int   
AS  
  
BEGIN   
  delete from themes where themeid=@themeId
END  
  
  
  
  
  