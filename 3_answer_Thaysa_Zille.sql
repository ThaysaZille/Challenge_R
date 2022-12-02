/*
Quantos clientes novos a empresa adquiriu por mês? Considere a data de início de um novo cliente como sendo a data do primeiro filme que esse cliente alugou.
Saída esperada: 2 colunas ( mês_entrada_cliente:date | quantidade_de_clientes:int ) e 3 linhas.
*/
select date_trunc('month', CAST(r.rental_date as TIMESTAMP)) as "Mês de entrada do cliente",
COUNT(r.customer_id) as "Quantidade de Clientes"
from rental r
inner join (
  select
  MIN(rental_date) as "rental_date", rental.customer_id /* pegar a data do primeiro filme que o cliente alugou */
    from rental
  group by
  rental.customer_id
) b
  on (b.rental_date = r.rental_date
and b.customer_id = r.customer_id)
  group by
  date_trunc('month', CAST(r.rental_date as TIMESTAMP))
  order by
   1
limit 3 /* 3 linhas */
