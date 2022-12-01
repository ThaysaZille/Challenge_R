/*
Dentre os top 16 filmes mais alugados, qual o nome completo do ator mais presente nesses filmes?
Saída esperada: 1 coluna e 1 linha com o nome completo.
*/
select /* Mostrar somente a coluna ator, com o nome completo */
	concat (ac.first_name, ' ', ac.last_name) as "Ator"
from
	film_actor fa 
	inner join actor ac on ac.actor_id = fa.actor_id 
where fa.film_id in (
	select f.film_id
		from inventory i 
			inner join rental r on r.inventory_id = i.inventory_id 
			inner join film f on f.film_id = i.film_id 
		group by f.film_id 
		order by count(f.film_id) desc limit 16 /* top 16 filmes mais alugados */
)
group by
	ac.first_name, ac.last_name
order by COUNT (fa.actor_id) desc  /* ordem decrescente */
limit 1 /* Exibir somente 1 */