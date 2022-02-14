create table empregado (
	-- definição de colunas
	cpf char (14) not null, 
	nome varchar (20) not null, 
	sobrenome varchar (20) not null, 
	datanasc date not null, 
	endereco varchar (255) not null, 
	sexo char not null check (sexo in ('M', 'F')), -- defini uma condição para o sexo
	salario decimal (9,2) not null, 
	supervisorcpf char (14), 
	departamentonro int not null,
	-- definição de restrição
	constraint emppk primary key (cpf), 
	constraint superfk foreign key (supervisorcpf) references empregado (cpf)
);
