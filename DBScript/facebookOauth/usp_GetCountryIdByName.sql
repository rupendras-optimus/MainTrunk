
Create procedure [dbo].[usp_GetCountryIdByName]
@country varchar(255)
as
begin
select Locationid from LOCATIONS where LocationName =@country
end
  


