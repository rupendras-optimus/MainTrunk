Alter table [dbo].[USERBUSINESS]
Add HeaderBGColor Varchar(10)

Alter table [dbo].[USERBUSINESS]
Add IsAddressOn bit

Alter table [dbo].[USERBUSINESS]
Add IsWebAddressOn bit

Alter table [dbo].[USERBUSINESS]
Add IsObUrlLinkOn bit

Alter table [dbo].[USERBUSINESS]
Add IsPhoneNoOn bit

Alter table [dbo].[USERBUSINESS]
Add DisplayCustomHeader bit

Alter table [dbo].[USERBUSINESS]
Add HeaderLogo varchar(255)


--only to be rum for the first time


Update [dbo].[USERBUSINESS]
Set IsAddressOn = 'false'

Update [dbo].[USERBUSINESS]
Set IsWebAddressOn = 'false'

Update [dbo].[USERBUSINESS]
Set IsObUrlLinkOn = 'false'

Update [dbo].[USERBUSINESS]
Set IsPhoneNoOn = 'false'

Update [dbo].[USERBUSINESS]
Set DisplayCustomHeader = 'false'
