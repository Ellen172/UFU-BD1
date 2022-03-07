/* TABELA CUPOM */ 

-- produto cartesiano
select * from cliente c, cupom_desconto cupom_desconto  
    where c.cod_cliente = cd.cod_cliente;

-- join 
select * from cliente natural join cupom_desconto;

/* 
    o produto cartesiano consume muito memoria da máquina
    o natural join é mais eficiente
*/

-- retorna quais os clientes (pelo cod) e quantos cupons cada um tem
select cd.cod_cliente , count (*) 
    from cupom_desconto cd
    group by cd.cod_cliente;


-- retorna o nome dos cliente e a qtd de cupons de cada um
select cd.cod_cliente "codigo", c.nome "nome", count (c.cod_cliente) "qtd de cupons"
    from cliente c natural join cupom_desconto cd
    group by c.cod_cliente
    order by c.cod_cliente;

