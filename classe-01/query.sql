--Sendo assim, faça a criação da tabela usuarios seguindo os pré requisitos:
--a) Um campo com identificador que seja incrementado automaticamente. 
--b) Um campo nome que suporte texto e seja obrigatório.
--c) Um campo idade que possa receber um número inteiro pequeno.
--d) Um campo e-mail que suporte, no máximo, 80 caracteres. 
--e) Um campo senha com limite de 8 caracteres que seja obrigatório.

CREATE TABLE usuarios(
   id serial,
   nome varchar(40) NOT NULL,
   idade smallint,
   email varchar(80),
   senha varchar(8) NOT NULL
 );
 
INSERT INTO usuarios
(nome,idade,email,senha)
VALUES
('Aretha Montgomery', 30, 'ugue.id.ante@odioAliquam.com', 'a0B13O3L'),
('Camden H. Bartlett', 15, 'turpis.vitae.purus@risusDuisa.ca', 'p3P96F3Q'),
('Raja W. Coffey', 30, 'raja.feugiat@nonummy.com', 's5F51T7L'),
('Elton D. Olsen', 29, 'auctor@duiFuscediam.edu', 'k5X25B0R'),
('Shelley E. Frederick', 20, 'raja.feugiat@nonummy.com', 'u2D18F6E')

--3 - Após ter inserido os registros na tabela usuarios, foi identificado que o registro que possui
--o e-mail raja.feugiat@nonummy.com informou seu nome errado. 
--Faça uma atualização nesse registro alterando o nome para Raja W. Coffey Thomas.

UPDATE usuarios SET  nome='Raja W. Coffey Thomas' WHERE  email='raja.feugiat@nonummy.com';

--4 - O cliente percebeu que na tabela enviada anteriormente para inserir os usuários no banco de dados
--tinha um problema. Dois registros possui o mesmo e-mail e ao atualizar o nome do registro de e-mail 
--raja.feugiat@nonummy.com essa alteração acabou afetando os dois registros que possui o mesmo e-mail.
--Isso precisa ser resolvido urgentemente e a solução é alterar o campo e-mail para não permitir 
--e-mails duplicados, nem que seja necessário apagar todos os registros com o mesmo e-mail.
DELETE FROM  usuarios WHERE  email='raja.feugiat@nonummy.com';
ALTER TABLE usuarios 
ADD UNIQUE(email);

INSERT INTO usuarios
(nome,idade,email,senha)
VALUES
('Jermaine G. Sellers',16,'ligula.Nullam@tortordictum.co.uk','o2P56U9U' ),
('James D. Kennedy',23,'amet@Nulladignissim.com','q6B78V3V'),
('Amelia S. Harris',29,'nec.metus.facilisis@vitaealiquet.edu','l4S64Y3A'),
('Joel M. Hartman',18,'montes.nascetur@odiotristique.co.uk','c4Q27D7O'),
('Elmo K. Greer',18,'risus.Duis@eget.ca','e3P92I7R')

--6 - A próxima demanda que surgiu foi adicionar um novo campo a tabela usuarios que aceite somente 
--dois valores (Verdadeiro ou Falso). Nesse campo, caso não seja informado nada ao inserir um registro,
--significa que por padrão é verdadeiro. Ahh... O cliente pediu que esse campo fosse chamado situacao,
--pois será identificado a situação do usuário, se está ativo ou não.

ALTER TABLE usuarios
ADD COLUMN situacao boolean DEFAULT TRUE;

--7 - A solicitação anterior não era a toa. O cliente acabou de mandar o primeiro usuario que 
--ele precisa inativar. Sendo assim, você precisa atualizar o registro que possui o e-mail 
--montes.nascetur@odiotristique.co.uk alterando a situação dele para falso.

UPDATE usuarios SET  situacao=FALSE WHERE  email='montes.nascetur@odiotristique.co.uk';

--8 - Temos uma outra pequena demanda. O registro que possui o e-mail risus.Duis@eget.ca
--solicitou alteração da sua senha para k9P31H1O.

UPDATE usuarios SET  senha='k9P31H1O' WHERE  email='risus.Duis@eget.ca';

--9 - Só agora o cliente percebeu que seria melhor armazenar a data de nascimento do usuário no lugar 
--da idade. Será necessário excluir o campo idade e adicionar um novo campo chamado data_nascimento 
--que receberá uma data no formado YYYY-MM-DD que corresponde a Ex.: 2021-05-30.

ALTER  TABLE usuarios
DROP COLUMN idade;

ALTER  TABLE usuarios
ADD COLUMN data_nascimento date;

--O registro que possui o e-mail auctor@duiFuscediam.edu nasceu em 1991-09-29; a) O registro que possui 
--o e-mail nec.metus.facilisis@vitaealiquet.edu nasceu em 1988-11-02;

UPDATE usuarios SET  data_nascimento='1991-09-29' WHERE  email='auctor@duiFuscediam.edu';

UPDATE usuarios SET  data_nascimento='1988-11-02' WHERE  email='nec.metus.facilisis@vitaealiquet.edu';

--11 - Depois de tanto solicitar a data de nascimento para os usuários e até o momento somente dois 
--enviaram, o cliente resolveu excluir definitivamente todos os registros que estão sem a data de 
--nascimento. Esse Job precisa ser feito com muito cuidado, portanto, prossiga com cautela.

DELETE FROM usuarios WHERE data_nascimento IS NULL;

--12 - Para que nenhum outro registro seja adicionado sem a data de nascimento, o cliente 
--solicitou que adicionasse uma restrição ao campo data_nascimento para que fosse um campo 
--obrigatório.

ALTER TABLE usuarios 
ALTER COLUMN data_nascimento SET NOT NULL;

INSERT INTO usuarios
(nome,data_nascimento,email,senha)
VALUES
('Tate I. Dean','1989-05-01','Nunc@etmagnis.edu','d3V25D6Y'),
('Arsenio K. Harmon','1985-10-23','adipiscing.elit@turpis.com',	'm3T58S0C')






