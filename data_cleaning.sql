--select * from dbo.netflix_titles 
-- where show_id = 's5023'

-- handling foriegn characters 
	-- changed 'title' data type : varchar -> nvarchar
	-- changed datatype sizes for fast execution


-- remove duplicates
select show_id,COUNT(*) 
from netflix_titles
group by show_id
having COUNT(*) >1 


SELECT *
FROM netflix_titles
WHERE concat(upper(title),type) IN (
    SELECT concat(upper(title),type)
    FROM netflix_titles
    GROUP BY upper(title),type
    HAVING COUNT(*) > 1
)
order by title


with cte as (
SELECT *
,ROW_NUMBER() over (partition by title, type order by show_id) as rn 
FROM netflix_titles 
) 
select show_id , type, title, cast(date_added as DATE) as date_added, release_year
,rating, case when duration is null then rating else duration end as duration, description
into netflix

from cte
where rn =1 and date_added is null 

select * from netflix

-- new table for listed in, director, country, cast
select show_id , trim(value) as director
into netflix_directors
from netflix_titles
cross apply string_split(director ,',') 

select * from netflix_directors;

select show_id , trim(value) as country
into netflix_country
from netflix_titles
cross apply string_split(country ,',') 

select * from netflix_country;

select show_id , trim(value) as listed_in
into netflix_listedin
from netflix_titles
cross apply string_split(listed_in , ',')

select * from netflix_listedin

select show_id , trim(value) as cast
into netflix_cast
from netflix_titles 
cross apply string_split(cast , ',')

select * from netflix_cast

-- data type conversion
insert into netflix_country
select  show_id,m.country 
from netflix_titles nr
inner join (
select director,country
from  netflix_country nc
inner join netflix_directors nd on nc.show_id=nd.show_id
group by director,country
) m on nr.director=m.director
where nr.country is null


select * from netflix_titles where director = 'Ahishor Solomon'


select * from netflix_titles where duration is null

select director,country
from  netflix_country nc
inner join netflix_directors nd on nc.show_id=nd.show_id
group by director,country


select n.show_id , n.type, n.director
from netflix n
inner join netflix_directors nd on 
n.show_id = nd.show_id