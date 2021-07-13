--Exercise 1:Using JOINS

--Question 1
select s.name_of_school, c.community_area_name, s.average_student_attendance, c.hardship_index
from chicago_public_schools as s left join census_data as c
on s.community_area_number = c.community_area_number
where c.hardship_index = 98;

--Question 2
select cr.case_number, cr.primary_type, c.community_area_name
from chicago_crime_data as cr left join census_data as c
on cr.community_area_number = c.community_area_number
where cr.location_description like '%SCHOOL%';

--Exercise 2:Creating a View

--Question 1
create view question3(
School_Name, Safety_Rating, Family_Rating, Environment_Rating, 
Instruction_Rating, Leaders_Rating, Teachers_Rating) as
select name_of_school, safety_icon, family_involvement_icon,
environment_icon,instruction_icon,leaders_icon,teachers_icon
from chicago_public_schools;

select * from question3;

select school_name, leaders_rating from question3;

--Exercise 3: Creating a Stored Procedure
--#SET TERMINATOR @
create or replace procedure UPDATE_LEADERS_SCORE(
in in_school_id integer, in in_leader_score integer)

language sql
modifies sql data

begin
	update chicago_public_schools
	set leaders_score = in_leader_score
	where school_id = in_school_id;
	
	if in_leader_score < 20 then
	update chicago_public_schools
	set leaders_icon = 'Very weak'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 20 and in_leader_score < 40 then
	update chicago_public_schools
	set leaders_icon = 'Weak'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 40 and in_leader_score < 60 then
	update chicago_public_schools
	set leaders_icon = 'Average'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 60 and in_leader_score < 80 then
	update chicago_public_schools
	set leaders_icon = 'Strong'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 80 then
	update chicago_public_schools
	set leaders_icon = 'Very strong'
	where school_id = in_school_id;
	
	end if;
end
@
--#SET TERMINATOR ;
call update_leaders_score(609676, 50);

select school_id, name_of_school, leaders_score, leaders_icon
from chicago_public_schools
where school_id = 609676;

--Exercise 4: Using Transactions

--#SET TERMINATOR @
create or replace procedure UPDATE_LEADERS_SCORE(
in in_school_id integer, in in_leader_score integer)

language sql
modifies sql data

begin

	 DECLARE SQLCODE INTEGER DEFAULT 0;                  -- Host variable SQLCODE declared and assigned 0
     DECLARE retcode INTEGER DEFAULT 0;                  -- Local variable retcode with declared and assigned 0
     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION           -- Handler tell the routine what to do when an error or warning occurs
     SET retcode = SQLCODE;
     
	update chicago_public_schools
	set leaders_score = in_leader_score
	where school_id = in_school_id;
	
	if in_leader_score>= 0 and in_leader_score < 20 then
	update chicago_public_schools
	set leaders_icon = 'Very weak'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 20 and in_leader_score < 40 then
	update chicago_public_schools
	set leaders_icon = 'Weak'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 40 and in_leader_score < 60 then
	update chicago_public_schools
	set leaders_icon = 'Average'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 60 and in_leader_score < 80 then
	update chicago_public_schools
	set leaders_icon = 'Strong'
	where school_id = in_school_id;
	
	elseif in_leader_score >= 80 and in_leader_score <= 100 then
	update chicago_public_schools
	set leaders_icon = 'Very strong'
	where school_id = in_school_id;
	
	else
	set retcode = -1;
	end if;
	
	if retcode < 0 then
	rollback work;
	else
	commit work;
	
	end if;
end
@

