create database Cursorproblemstatement;
use Cursorproblemstatement;
--
create table Customers(
CustomerID int primary key,
CustomerName varchar(50),
City varchar(50),
Phone bigint
);
insert into Customers values(1,'ask','hyd',7418529634);
insert into Customers values(2,'anand','kkd',7418529635);
insert into Customers values(3,'sai','rjy',7418529636);
insert into Customers values(4,'kumar','ptprp',7418529637);
insert into Customers values(5,'vijaya','hyd',7418529638);
select * from Customers;
--declare
declare
@CustomerID int,
@CustomerName varchar(50),
@City varchar(50),
@Phone bigint,
@Length int
declare Customer_Cursor Cursor local scroll for select CustomerID,CustomerName,City,Phone from Customers;
--open
open Customer_Cursor;
--fetch
fetch next from Customer_Cursor into @CustomerID,@CustomerName,@City,@Phone
	fetch first from Customer_Cursor into @CustomerID,@CustomerName,@City,@Phone
		print ('CustomerID: '+Convert(nvarchar(max),@CustomerID)+'|'+'CustomerName: '+@CustomerName+'|'+'City: '+@City+'|'+'Phone: '+Convert(nvarchar(max),@Phone))
		fetch last from Customer_Cursor into @CustomerID,@CustomerName,@City,@Phone
		print ('CustomerID: '+Convert(nvarchar(max),@CustomerID)+'|'+'CustomerName: '+@CustomerName+'|'+'City: '+@City+'|'+'Phone: '+Convert(nvarchar(max),@Phone))
		fetch prior from Customer_Cursor into @CustomerID,@CustomerName,@City,@Phone
		print ('CustomerID: '+Convert(nvarchar(max),@CustomerID)+'|'+'CustomerName: '+@CustomerName+'|'+'City: '+@City+'|'+'Phone: '+Convert(nvarchar(max),@Phone))
		fetch absolute 3 from Customer_Cursor into @CustomerID,@CustomerName,@City,@Phone
		print ('CustomerID: '+Convert(nvarchar(max),@CustomerID)+'|'+'CustomerName: '+@CustomerName+'|'+'City: '+@City+'|'+'Phone: '+Convert(nvarchar(max),@Phone))


while @@FETCH_STATUS=0
begin
	set @Length=Len(@Phone);
	print 'phone number length is: '+Cast(@Length as varchar);
	print ('CustomerID: '+Convert(nvarchar(max),@CustomerID)+'|'+'CustomerName: '+@CustomerName+'|'+'City: '+@City+'|'+'Phone: '+Convert(nvarchar(max),@Phone))
	--update
	update Customers
	set CustomerName='anandsaikumar' where CustomerID=3
	fetch next from Customer_Cursor into @CustomerID,@CustomerName,@City,@Phone

end
--close
close Customer_Cursor;
--deallocate
deallocate Customer_Cursor;