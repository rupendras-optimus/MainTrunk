set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_InsertDefaultTheme]
@UserId int,
@ThemeId int,
@TributeType varchar(100)
as

if exists(select * from DefaultTheme where UserId=@UserId and TributeType=dbo.ufn_GetParameterTypeCode(@TributeType,'TRIBUTE_TYPE'))
BEGIN
      update DefaultTheme set ThemeId=@ThemeId where UserId=@UserId and TributeType=dbo.ufn_GetParameterTypeCode(@TributeType,'TRIBUTE_TYPE')       
END
ELSE
BEGIN
       insert into DefaultTheme(UserId,TributeType,ThemeId) values(@UserId,dbo.ufn_GetParameterTypeCode(@TributeType,'TRIBUTE_TYPE'),@ThemeId)
END
