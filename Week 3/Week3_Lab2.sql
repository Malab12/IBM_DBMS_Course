--Exercise 2: Aggregate Functions

--Question 1 and 2
select sum(cost) as total_cost
from petrescue;

--Question 3
select max(quantity) as max_quantity
from petrescue;

--Question 4
select avg(cost) as avg_rescue_cost
from petrescue;

--Question 5
select avg(cost) as avg_rescue_cost_dog
from petrescue
where animal = 'Dog';

--Exercise 3: Scaler and String Functions

--Question 1
select id, animal, quantity, round(cost)
from petrescue;

--Question 2
select distinct animal, length(animal) as length_of_name
from petrescue;

--Question 3 and 4
select distinct upper(animal) as ANIMAL
from petrescue;

--Question 5
select *
from petrescue
where lower(animal) = 'cat';

--Exercise 4: Date and Time Functions

--Question 1
select day(rescuedate)
from petrescue
where animal = 'Cat';

--Question 2
select sum(quantity) as no_of_rescues
from petrescue
where month(rescuedate) = '05';

--Question 3
select sum(quantity) as no_of_rescues
from petrescue
where day(rescuedate) = '14';

--Question 4
select (rescuedate + 3 days) as vet_visit
from petrescue;

--Question 5
select id, animal, quantity, (current date - rescuedate) as time_in_rescue
from petrescue;