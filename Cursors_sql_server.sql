create database CursorsSql;
use CursorsSql;
create table Students(
StudentID int primary key,
StudentName varchar(50),
StudentClass varchar(50),
Math_Marks decimal(10,2),
Science_Marks decimal(10,2),
Social_Marks decimal(10,2)
);
---
insert into Students values(1,'ask','10th',90,85,95);
insert into Students values(2,'anand','8th',98,95,95);
insert into Students values(3,'sai','10th',65,75,85);
insert into Students values(4,'kumar','9th',70,65,90);
insert into Students values(5,'nandhu','8th',80,95,65);
insert into Students values(6,'nani','10th',80,75,90);
insert into Students values(7,'balu','9th',75,80,90);
select * from Students;
--cursor--
--DECLARE--
declare 
@StudentID int,
@StudentName varchar(50),
@Math_Marks decimal(10,2),
@Science_Marks decimal(10,2),
@Social_Marks decimal(10,2),
@Total_Marks decimal(10,2),
@Percentage decimal(10,2)
declare Student_Cursor Cursor local Scroll for select StudentID,StudentName,Math_Marks,Science_Marks,Social_Marks from Students;
--open cursor--
Open Student_Cursor;
--Fetch Cursor--
--relative--
--FETCH Relative 3 from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 
--print  ('StudentID: ' + Convert(nvarchar(max),@StudentID) +','+ 'StudentName: '+ @StudentName +','+ 'Math_Marks: '+ Convert(nvarchar(max),@Math_Marks) +','+ 'Science_Marks: '+ Convert(nvarchar(max),@Science_Marks) +','+ 'Social_Marks: '+ Convert(nvarchar(max),@Social_Marks));
--absolute--
--FETCH absolute 5 from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 
--print  ('StudentID: ' + Convert(nvarchar(max),@StudentID) +','+ 'StudentName: '+ @StudentName +','+ 'Math_Marks: '+ Convert(nvarchar(max),@Math_Marks) +','+ 'Science_Marks: '+ Convert(nvarchar(max),@Science_Marks) +','+ 'Social_Marks: '+ Convert(nvarchar(max),@Social_Marks));
--first--
--FETCH First from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 
--print  ('StudentID: ' + Convert(nvarchar(max),@StudentID) +','+ 'StudentName: '+ @StudentName +','+ 'Math_Marks: '+ Convert(nvarchar(max),@Math_Marks) +','+ 'Science_Marks: '+ Convert(nvarchar(max),@Science_Marks) +','+ 'Social_Marks: '+ Convert(nvarchar(max),@Social_Marks));
--last--
--FETCH Last from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 
--print  ('StudentID: ' + Convert(nvarchar(max),@StudentID) +','+ 'StudentName: '+ @StudentName +','+ 'Math_Marks: '+ Convert(nvarchar(max),@Math_Marks) +','+ 'Science_Marks: '+ Convert(nvarchar(max),@Science_Marks) +','+ 'Social_Marks: '+ Convert(nvarchar(max),@Social_Marks));
--Prior
--FETCH absolute 5 from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 
--print  ('StudentID: ' + Convert(nvarchar(max),@StudentID) +','+ 'StudentName: '+ @StudentName +','+ 'Math_Marks: '+ Convert(nvarchar(max),@Math_Marks) +','+ 'Science_Marks: '+ Convert(nvarchar(max),@Science_Marks) +','+ 'Social_Marks: '+ Convert(nvarchar(max),@Social_Marks));
--
FETCH Next from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 
while @@FETCH_STATUS=0
BEGIN
	print Concat('StudentID: ',@StudentID);
	print Concat('StudentName: ',@StudentName);
	print Concat('Math_Marks: ',@Math_Marks);
	print Concat('Science_Marks: ',@Science_Marks);
	print Concat('Social_Marks: ',@Social_Marks);
	set @Total_Marks=@Math_Marks+@Science_Marks+@Social_Marks;
	print Concat('Total_Marks: ',@Total_Marks);
	set @Percentage=@Total_Marks/3;
	print Concat('Percentage: ',@Percentage,'%');
	if @Percentage>80
	BEGIN
		print 'Grade A';
	END
	Else if @Percentage>=60 AND @Percentage<=80
	BEGIN
		print 'GRADE B';
	END
	Else
	BEGIN
		print 'GRADE C';
	END
	print '<----------->';
FETCH Next from Student_Cursor into @StudentID,@StudentName,@Math_Marks,@Science_Marks,@Social_Marks 

END
--Close Cursor--
Close Student_Cursor;
--Deallocate--
Deallocate Student_Cursor;

