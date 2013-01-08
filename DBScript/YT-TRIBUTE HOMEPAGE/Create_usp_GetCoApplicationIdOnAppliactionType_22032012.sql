set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

--Craeted By: Laxman
--Date : 22/3/2012
--purpose : to Get CoApplicationId On AppliactionType
--execute as : usp_GetCoApplicationIdOnAppliactionType @AppliactionType='YourTribute'

Create Procedure [dbo].[usp_GetCoApplicationIdOnAppliactionType]

@AppliactionType varchar(max)

AS
BEGIN
	Select 
	coApplicationId
	from tblApplicationType
		Where coApplicationType = @AppliactionType
END
  