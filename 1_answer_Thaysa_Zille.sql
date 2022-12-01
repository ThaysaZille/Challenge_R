/*
Qual foi os top 2 filmes mais alugados de todos os tempos?
Saída esperada: 2 colunas(título do filme, quantidade) e 2 linhas.
*/
select
   f.title as "Título",
   count(f.film_id) as "Quantidade" 
from inventory i 
   inner join rental r on r.inventory_id = i.inventory_id 
   inner join film f on f.film_id = i.film_id 
group by
   f.title 
order by /* Ordem de classificação */
   2 desc 
limit 2 /* Exibir somente 2 */