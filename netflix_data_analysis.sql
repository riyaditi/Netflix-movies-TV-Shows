/* for each director count the no of movies and tv shows created by them in separate columns 
for directors who have created tv shows and movies both */

select nd.director
,count(distinct case when n.type = 'Movie' then n.show_id end)as no_of_movies
,count(distinct case when n.type = 'TV Show' then n.show_id end)as no_of_tv_shows
--count(distinct n.type) as distinct_type
from netflix n
inner join netflix_directors nd on 
n.show_id = nd.show_id
group by nd.director
having count(distinct n.type)>1


-- which country has highest number of comedy movies
select  top 1 nc.country , COUNT(distinct ng.show_id ) as no_of_movies
from netflix_listedin ng
inner join netflix_country nc on ng.show_id=nc.show_id
inner join netflix n on ng.show_id=nc.show_id
where ng.listed_in='Comedies' and n.type='Movie'
group by  nc.country 
order by no_of_movies desc

-- for each year (as per date added to netflix), which director has maximum number of movies released
with cte as (
select nd.director, YEAR(date_added) as date_year, count(n.show_id) as no_of_movies 
from netflix n
inner join netflix_directors nd	on n.show_id = nd.show_id
where type = 'Movie'
group by nd.director , YEAR (date_added)
)
, cte2 as (
select * , ROW_NUMBER() over(partition by date_year order by no_of_movies desc, director)as rn
from cte
)
select * from cte2 where rn = 1



-- what is average duration of movies in each genre
select ng.listed_in, avg(cast(Replace(duration,'min','') as int)) as avg_duration
from netflix n
inner join netflix_listedin ng on n.show_id=ng.show_id
where type='Movie'
group by ng.listed_in


-- find the list of directors who have created horror and comedy movies both.
-- display director names along with number of comedy and horror movies directed by them.

select nd.director 
, count(distinct case when ng.listed_in = 'Comedies' then n.show_id end) as no_of_comedy
, count(distinct case when ng.listed_in = 'Horror Movies' then n.show_id end) no_of_horror
from netflix n
inner join netflix_listedin ng on n.show_id = ng.show_id
inner join netflix_directors nd on n.show_id = nd.show_id
where type ='Movie' and ng.listed_in in ('Comedies', 'Horror Movies')
group by nd.director
having COUNT(distinct ng.listed_in)= 2;

select * from netflix_listedin where show_id in 
(select show_id from netflix_directors where director = 'Steve Brill')
order by listed_in

