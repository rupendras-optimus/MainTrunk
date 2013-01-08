set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[usp_GetDefaultTheme] 
@UserId int,
@TributeType varchar(100)
as 

select * from DefaultTheme where UserId=@UserId and TributeType=dbo.ufn_GetParameterTypeCode(@TributeType,'TRIBUTE_TYPE') 

