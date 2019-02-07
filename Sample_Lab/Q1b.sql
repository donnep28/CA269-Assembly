select t.title, s.name
from film t 
join film_category c on t.film_id = c.film_id
join category s on s.category_id = c.category_id
where s.name like 'A%'
order by t.title;
