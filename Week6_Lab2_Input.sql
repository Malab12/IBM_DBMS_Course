--Exercise 1

--#SET TERMINATOR @
CREATE PROCEDURE RETRIEVE_ALL       -- Name of this stored procedure routine

LANGUAGE SQL                        -- Language used in this routine 
READS SQL DATA                      -- This routine will only read data from the table

DYNAMIC RESULT SETS 1               -- Maximum possible number of result-sets to be returned to the caller query

BEGIN 

    DECLARE C1 CURSOR               -- CURSOR C1 will handle the result-set by retrieving records row by row from the table
    WITH RETURN FOR                 -- This routine will return retrieved records as a result-set to the caller query
    
    SELECT * FROM PETSALE;          -- Query to retrieve all the records from the table
    
    OPEN C1;                        -- Keeping the CURSOR C1 open so that result-set can be returned to the caller query

END
@


--Exercise 2

--#SET TERMINATOR @
create procedure UPDATE_SALEPRICE (in animal_id integer, in animal_health varchar(5))

language sql
modifies sql data

begin
	if animal_health = 'BAD' then
	update petsale
	set saleprice = 0.75 * saleprice
	where id = animal_id;
	
	elseif animal_health = 'WORSE' then
	update petsale
	set saleprice = 0.5 * saleprice
	where id = animal_id;
	
	else
	update petsale
	set saleprice = saleprice
	where id = animal_id;
	
	end if;
	
end
@