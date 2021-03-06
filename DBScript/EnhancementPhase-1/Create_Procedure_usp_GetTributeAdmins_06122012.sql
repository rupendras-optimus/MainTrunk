USE [TributePortal_New_P1]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTributeAdminis]    Script Date: 12/06/2012 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_GetTributeAdmins]
@intUserTributeId int
AS
Begin	

select TA.UserId, TA.Email, 
Case 
	(Select COUNT(*) from UserBusiness where UserId = US.UserId)
	when 1 Then 
	(
		Select Case usr1.IsUserNameVisiable
		When 1 then 
			usr1.UserName
		else
			urb.CompanyName
		end
		from 
			USERS usr1,UserBusiness urb where
			usr1.Userid=urb.Userid
			and usr1.Userid=US.UserId
	)
Else 
	Case US.IsUserNameVisiable
	when 1 Then US.UserName
		Else US.FirstName + Char(9) + US.LastName
	end
end
as FirstName,
US.LastName,
TA.IsOwner
	from TRIBUTEADMINISTRATOR TA
	Inner Join Users US ON US.UserId = TA.UserId
	Where TA.UserTributeId = @intUserTributeId
    --and TA.IsOwner!=1
    and TA.IsDeleted=0


   
End

--exec usp_GetTributeAdmins 1
