
Create procedure [dbo].[usp_GetstateIdByName]
@country varchar(255),
@state varchar(255)
as
begin
declare @x int
select @x=Locationid from LOCATIONS where LocationName =@country
select locationId from LOCATIONS where LocationName =@state and LocationParentId=@x
end