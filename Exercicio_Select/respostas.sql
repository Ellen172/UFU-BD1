/* Consultas - SQL/DML - Simples Seleção/projeção */

/* 1. Listar a data de nascimento e o endereço dos empregados com nome: John B Smith */
select e.bdate, e.address 
	from employee e 
	where e.fname = 'John'
	and e.minit = 'B'
	and e.lname = 'Smith';

/* 2. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’ */
select e.fname, e.address
    from employee e, department d
	where e.dno = d.dnumber 
    and d.dname = 'Research';
	
/* 3. Para todo projeto localizado em ’Stafford’, listar o número do projeto, o número do 
departamento que o controla e o último nome, endereço e data de nascimento do 
gerente do departamento. */
select p.pnumber , d.dnumber , e.lname , e.address , e.bdate 
	from project p, department d, employee e 
	where p.plocation = 'Stafford'
	and p.dnum = d.dnumber 
	and d.mgrssn = e.ssn ;

/* 4. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’ 
considerando os novos esquemas */
	
/* 5. Para cada empregado, liste o seu primeiro e o seu último nome acompanhados do 
último nome de seu supervisor. */
select e.fname as "nome" , e.lname "sobrenome" , e2.lname as "supervisor" 
	from employee e, employee e2 
	where e.superssn = e2.ssn ;

/* 6. Listar o nome e o endereço dos empregados que trabalham no departamento ’Research’ 
considerando as novas tabelas employee e department e usando apelidos */
select e.fname as "Nome", e.address as "Endereço"
    from employee e, department d
	where e.dno = d.dnumber 
    and d.dname = 'Research';

/* 7. Listar o produto cartesiano de empregados e departamentos */ 
select * 
	from employee e , department d 
	where d.mgrssn = e.ssn ;

/* 8. Listar todos os salários distintos */
select distinct salary
	from employee e ;

/* 9. Listar os números dos projetos que envolvam um empregado cujo último nome é ’Wong’ 
sendo que o empregado deve ser trabalhador ou gerente do departamento que controla 
o projeto. */
-- onde wong trabalha
select wo.pno 
	from employee e , works_on wo 
	where e.lname = 'Wong'
	and wo.essn = e.ssn
	union ( 
		-- onde wong gerencia 
		select p.pnumber 
			from project p , department d , employee e 
			where e.lname = 'Wong' 
			and p.dnum = d.dnumber 
			and d.mgrssn = e.ssn );

/* 10. Listar o nome de todo empregado cujo endereço está em Houston, Texas */
select e.fname  
	from employee e 
	where address like '%Houston%TX%';
		
/* 11. Listar o nome de todos os empregados nascidos na década de 50 */
select * 
	from employee e 
	where e.bdate between '1950-01-01' and '1959-12-31';

/* 12. Listar o nome e os salários resultantes de um aumento de 10% para os 
funcionários do projeto ’Productx’ */
select e.fname as "Nome" , e.lname as "Sobrenome" , e.salary*1.1 as "Novo salário"
	from project p, works_on wo , employee e 
	where p.pname = 'ProductX' 
	and wo.pno = p.pnumber  
	and e.ssn = wo.essn 

/* 13. Listar todos os empregados no departamento 5 cujo salário está entre 30000 e 
40000 */
select distinct e.fname as "Nome" , e.lname as "Sobrenome" , e.salary as "Salário"
	from project p , works_on wo , employee e 
	where wo.pno = p.pnumber 
	and p.dnum = '5'
	and wo.essn = e.ssn 
	and salary between 30000 and 40000;


/* 14. Listar os empregados e projetos em que eles estão trabalhando, ordenados pelo 
departamento e, dentro de cada departamento, ordenado pelo último e primeiro nome */
select d.dnumber as "Departamento" , e.lname as "Sobrenome" , e.fname as "Nome" , p.pname as "Projeto"  
	from works_on wo , project p , department d , employee e 
	where wo.pno = p.pnumber 
	and p.dnum = d.dnumber 
	and wo.essn = e.ssn 
	order by d.dnumber , e.lname , e.fname ;

/* 15. Listar a soma de salários, o maior salário e a média de salários, somente para 
funcionários do departamento 'Research' */
select sum(e.salary) as "soma", max(e.salary) as "maior salário" , avg(e.salary)
	from employee e , department d 
	where e.dno = d.dnumber 
	and d.dname = 'Research';

/* 16. Listar o número de salários distintos */
select distinct count(e.salary )
	from employee e; 

/* 17. Listar o nome dos empregados que têm dois ou mais dependentes */
select e.fname as "nome"
	from employee e 
	where e.ssn in (
		select d.essn 
			from dependent d
			group by d.essn 
			having count(d.essn) > 1);

/* 18. Listar para cada departamento seu número, a quantidade de empregados e a média 
salarial de seus empregados. */

/* 19. Listar para cada projeto seu número, nome e a quantidade de empregados que 
trabalham no projeto. */

/* 20. Listar para cada projeto onde trabalham mais de dois empregados seu número e a 
quantidade de empregados que trabalham no projeto */

/* 21. Listar para cada departamento que tem mais que 2 empregados, o número do 
departamento e o número de empregados que ganham mais que 40000 */
	
	


