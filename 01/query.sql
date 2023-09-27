drop database ecommerce;

create database ecommerce;

create table categorias (
	id serial primary key,
  nome varchar(100)
);

insert into categorias
(nome)
values
('frutas'),
('verduras'),
('massas'),
('bebidas'),
('utilidades');

create table produtos (
    id serial primary key,
  nome varchar(100),
  descricao text,
  preco integer,
  quantidade_em_estoque integer,
  categoria_id not null integer references categorias(id)
);

insert into produtos 
(nome, descricao, preco, quantidade_em_estoque, categoria_id)
values
('Mamão', 'Rico em vitamina A, potássio e vitamina C.', 300, 123, 1),
('Maça', 'Fonte de potássio e fibras.', 90, 34, 1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2),
('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
('Macarrão parafuso	', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
('Massa para lasanha	', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
('Refrigerante coca cola lata	', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l	', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4),
('Cerveja Heineken 600ml	', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado.', 1200, 500, 4),
('Agua mineral sem gás	', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo	', 'Reforçado para garantir mais segurança.', 1340, 90, 5),
('Escova dental	', 'Faça uma limpeza profunda com a tecnologia inovadora.', 1000, 44, 5),
('Balde para lixo 50l	', 'Possui tampa e fabricado com material reciclado.', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C.', 198, 176, 1),
('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1);

create table clientes (
    cpf char(11) unique primary key,
   nome varchar(150)
);

insert into clientes
(cpf, nome)
values
('80371350042', 'José Augusto Silva'),
('67642869061', 'Antonio Oliveira'),
('63193310034', 'Ana Rodrigues'),
('75670505018', 'Maria da Conceição');

create table vendedores (
	 cpf char(11) unique primary key,
   nome varchar(150)
);

insert into vendedores
(cpf, nome)
values
('82539841031', 'Rodrigo Sampaio'),
('23262546003', 'Beatriz Souza Santos'),
('28007155023', 'Carlos Eduardo');

create table pedidos (
    id serial primary key,
    valor integer,
    cliente_cpf char(11) not null references cliente(cpf),
    vendedor_cpf char(11) not null references vendedores(cpf)
);

create table itens_do_pedido (
	id serial primary key,
  pedido_id not null integer references pedidos(id),
  quantidade integer not null,
  produto_id not null integer references produtos(id)
);

-- a) José Algusto comprou os seguintes itens com o vendedor Carlos Eduardo:
insert into pedidos
(valor, cliente_cpf, vendedor_cpf)
values
(0, '80371350042', '28007155023');

insert into itens_do_pedido
(pedido_id, produto_id, quantidade)
values
(1, 1, 1),
(1, 10, 1),
(1, 11, 6),
(1, 15, 1),
(1, 2, 5);

UPDATE produtos
SET quantidade_em_estoque = quantidade_em_estoque - (
  SELECT quantidade
  FROM itens_do_pedido
  WHERE pedido_id = 1 AND produto_id = produtos.id
)
WHERE id IN (1, 10, 11, 15, 2); 

-- b) Ana Rodrigues comprou os seguintes itens com a vendedora Beatriz Souza Santos
insert into pedidos
(valor, cliente_cpf, vendedor_cpf)
values
(0, '63193310034', '23262546003');
 
insert into itens_do_pedido
(pedido_id, produto_id, quantidade)
values
(2, 17, 10),
(2, 18, 3),
(2, 1, 5),
(2, 5, 10),
(2, 6, 2);

UPDATE produtos
SET quantidade_em_estoque = quantidade_em_estoque - (
  SELECT quantidade
  FROM itens_do_pedido
  WHERE pedido_id = 2 AND produto_id = produtos.id
)
WHERE id IN (17, 18, 1, 5, 6);

-- c) Maria da Conceição comprou os seguintes itens com a vendedora Beatriz Souza Santos
insert into pedidos
(valor, cliente_cpf, vendedor_cpf)
values
(0, '75670505018', '23262546003');

insert into itens_do_pedido
(pedido_id, produto_id, quantidade)
values
(3, 13, 1),
(3, 12, 6),
(3, 17, 5);

UPDATE produtos
SET quantidade_em_estoque = quantidade_em_estoque - (
  SELECT quantidade
  FROM itens_do_pedido
  WHERE pedido_id = 3 AND produto_id = produtos.id
)
WHERE id IN (13, 12, 17); 

-- d) Maria da Conceição comprou os seguintes itens com o vendedor Rodrigo Sampaio
insert into pedidos
(valor, cliente_cpf, vendedor_cpf)
values
(0, '75670505018', '82539841031');

insert into itens_do_pedido
(pedido_id, produto_id, quantidade)
values
(4, 16, 1),
(4, 18, 6),
(4, 17, 1),
(4, 1, 3),
(4, 5, 20),
(4, 6, 2);


UPDATE produtos
SET quantidade_em_estoque = quantidade_em_estoque - (
  SELECT quantidade
  FROM itens_do_pedido
  WHERE pedido_id = 4 AND produto_id = produtos.id
)
WHERE id IN (16, 18, 17, 1, 5, 6);

-- e) Antonio Oliveira comprou os seguintes itens com o vendedor Rodrigo Sampaio
insert into pedidos
(valor, cliente_cpf, vendedor_cpf)
values
(0, '67642869061', '82539841031');
 
insert into itens_do_pedido
(pedido_id, produto_id, quantidade)
values
(5, 18, 8),
(5, 8, 1),
(5, 17, 3),
(5, 5, 8),
(5, 11, 2);

UPDATE produtos
SET quantidade_em_estoque = quantidade_em_estoque - (
  SELECT quantidade
  FROM itens_do_pedido
  WHERE pedido_id = 5 AND produto_id = produtos.id
)
WHERE id IN (18, 8, 17, 5, 11); 
