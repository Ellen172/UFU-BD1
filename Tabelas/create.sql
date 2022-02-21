create schema empresa;

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

create table departamento (
	-- definição de colunas
	numerodepto int not null, 
	nome varchar (45) not null, 
	gerentecpf char (14) not null, 
	data_inicio timestamp default now(), -- tipo 'yyyy-mm-dd hh:mm:ss' 
	-- definição de restrição 
	constraint deptopk primary key (numerodepto),
	constraint gerentefk foreign key (gerentecpf) references empregado (cpf) -- empregado precisará já estar cadastrado 
);

alter table empregado 
	add constraint deptofk foreign key (departamentonro) references departamento (numerodepto); -- departamento já precisa estar cadastrado
