alter table departamento rename gerentecpf to gerente_cpf; -- renomeia a coluna 'gerentecpf' para 'gerente_cpf'

alter table departamento drop constraint gerentefk; -- apaga a constraint 'gerentefk'

alter table departamento 
	add foreign key (gerente_cpf) references empregado(cpf); -- cria nova fk
	
alter table departamento rename constraint departamento_gerente_cpf_fkey to gerente_fk; -- altera o nome da constraint


