create table orientador (
	id int primary key, 
	nome varchar(255)
);

create table aluno (
	matricula int primary key , 
	nome varchar(255),
	orientador_id int references orientador(id)
);

insert into orientador values 
	(1, 'Prof. José'), 
	(2, 'Profa. Maria');

insert into aluno values 
	(1, 'Carlos', NULL), 
	(2, 'Roberto', 2), 
	(3, 'Ailton', NULL);