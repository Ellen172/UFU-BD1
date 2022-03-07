/* TABELA COMPANY */

-- retorna todas as colunas da tabela employee 
select * 
	from employee e;
	
-- selecione duas colunas determinadas para a tabela employee 
select e.fname, e.salary
	from employee e;

-- 'as' define um apelido para a coluna apresentada
select e.fname as "Nome", e.salary as "Salario"
	from employee e;
	
-- para quando usamos uma unica tabela
select fname as "Nome", salary as "Salario"
	from employee e;
	
-- retorna apenas elementos distintos (sem repetição)
select distinct p.plocation as "localização"
	from project p;
	
-- 'where' define uma condição para ser satisfeita pela coluna
select e.fname as "Nome", e.salary as "Salario"
	from employee e 
	where salary > 40000;
	
-- between define um range 
select e.fname as "Nome", e.salary as "Salario"
	from employee e 
	where salary between 40000 and 50000; -- inclue as bordas 
	
-- 'in' define uma lista, o elemento retornado terá 'plocation' igual um dos elementos descritos na lista do in
select pname as "Nome Projeto" 
	from project 
	where plocation in ('Bellaire', 'Houston');
	
-- retorna os elementos pname que possuem plocation diferente dos elementos da lista do 'not in'
select pname as "Nome Projeto" 
	from project 
	where plocation not in ('Bellaire', 'Houston');
	
-- lista os nomes dos funcionarios que trabalharem em algum projeto (possuem essn na tabela works_on)
select fname as "Nome"
	from employee 
	where ssn in ( 
		select essn
		from works_on );
		
-- lista todos os projetos ondo o 'John' trabalhou
select pno
	from works_on 
	where essn in ( 
		select ssn
		from employee 
		where fname = 'John');
		
-- retorna o nome dos projetos em que o 'john' trabalhou
select p.pname "Nome do projeto" 
	from project p
	where p.pnumber in (
		select pno
		from works_on 
		where essn in ( 
			select ssn
			from employee 
			where fname = 'John'
		)
	);
	
-- listar os empregados com maior salario
select fname as "Nome", lname as "Sobrenome", salary as "Salário" 
	from employee 
	where salary = (
		select max(salary) --'max' retorna o maior
			from employee);

-- retorna os elementos onde a coluna superssn é nula
select fname as "Nome", lname as "Sobrenome", salary as "Salário" 
	from employee e
	where e.superssn is null;
	
-- listar nomes dos empregados que moram em Houston, Texas
select e.fname, e.minit, e.lname
	from employee e 
	where e.address like '%Houston%TX%';
	
-- listar empregados que nasceram na decada de 50
select e.fname, e.minit, e.lname, e.bdate
	from employee e 
	where cast(e.bdate as text) like '__5%';

select e.fname, e.minit, e.lname, e.bdate
	from employee e 
	where e.bdate between '1950-01-01' and '1959-12-31';
	
-- selecionar empregados que o nome começa com A
select e.fname 
	from employee e 
	where e.fname like 'A%';
	
-- listar empregados ordenando por maior salario e depois, nome 
select *
	from employee 
	order by salary asc, fname desc;
	
-- ordenando por colunas dadas
select fname, lname, salary 	
	from employee
	order by 3, 1;
	
-- retorna os 3 empregados mais novos
select e.fname, e.lname, e.bdate
	from employee e
	order by e.bdate desc
	limit 3;

-- maior salario dos empregados 
select sum(salary) "Soma", 
		count(salary) "Nro", 
		avg(salary) "Media"
	from employee e;

-- empregado mais velho 
select e.fname "nome", e.bdate "nascimento"
	from employee e
	where bdate in ( 
		select min (bdate)
			from employee);
		
-- idade pelo nascimento do empregado mais velho
select e.fname "nome", e.bdate "nascimento", 
		(cast (now() as date) - bdate)/365 as "idade"
	from employee e
	where bdate in ( 
		select min (bdate)
			from employee);

-- retorna apenas a data, sem hora
select cast (now() as date); 

-- retorna a qtd de elementos
select count(*) from project p;

-- retorna a qtd de diferentes elementos 
select count ( distinct p.plocation) from project p;

-- uso do agrupamento no parentesco dos dependentes
select d.relationship, count (d.relationship)
	from dependent d
	group by d.relationship;
	
-- retorna as faixas salarias, qtd e soma em cada faixa 
select e.salary , count (e.salary), sum (e.salary)
	from employee e
	group by e.salary
	order by e.salary;
	
-- retorna as faixas salariais acima de 40000 
select e.salary , count (e.salary), sum (e.salary)
	from employee e
	group by e.salary
	having e.salary >40000
	order by e.salary;
	
-- agrupa os elementos entre 30000 e 40000 
	-- e retorna os grupos acima de 35000
select e.salary , count (e.salary), sum (e.salary)
	from employee e
	where e.salary between 30000 and 40000
	group by e.salary
	having e.salary >35000
	order by e.salary;