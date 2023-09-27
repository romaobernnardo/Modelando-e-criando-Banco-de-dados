# Modelando e criando Banco de dados

Simulamos o pedido de uma empresa no seguimento de supermercados onde é solicitado um sistema para vendas online. A empresa terá um supermecado virtual e precisa estruturar um banco de dados para integrar ao sistema que já está sendo desenvolvido. Os responsáveis pelo projeto já modelou o banco de dados e solicitou que os desenvolvedores implementassem.

De acordo com a modelagem de dados disponibilizada no arquivo `modelagem.png`, fora realizada a criação do banco de dados `ecommerce` e suas tabelas com todos os relacionamentos apresentados.

## Como Executar o Projeto

### Pré-requisitos

- Git instalado.
- Beekeper instalado.
- Visual Studio Code instalado.
- PostgreSql  instalado e configurado.


### Passos para Executar o Projeto

1. Para executar o projeto no seu ambiente de desenvolvimento em execução, primeiramente faça o clone desse repositório em sua maquina local na pasta desejada:

 ```
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
```


1. Acesse a pasta do projeto
cd nome-do-repositorio

2. Depois abra o projeto em seu editor de códigos,;

3. Execute a aplicação no Beekeper:

## Modelagem de Dados

a) O campo cpf da tabela `clientes` e da tabela `vendedores` não pode aceitar registros duplicados.

b) Os identificadores em negrito significa que são chaves primárias.

Após a criação do banco de dados e suas tabelas, vamos precisar uma série de operações conforme descritas abaixo:

1 - Onde posteriorment foi alimentado a tabela `categorias` com as seguintes informações.

| nome       |
| ---------- |
| frutas     |
| verduras   |
| massas     |
| bebidas    |
| utilidades |

2 - Acrescentado a tabela `produtos` as seguintes informações:

| nome                        | descricao                                                                                                    | preco | quantidade_em_estoque | categoria_id              |
| --------------------------- | ------------------------------------------------------------------------------------------------------------ | ----- | --------------------- | ------------------------- |
| Mamão                       | Rico em vitamina A, potássio e vitamina C                                                                    | 300   | 123                   | `id_categoria_frutas`     |
| Maça                        | Fonte de potássio e fibras.                                                                                  | 90    | 34                    | `id_categoria_frutas`     |
| Cebola                      | Rico em quercetina, antocianinas, vitaminas do complexo B, C.                                                | 50    | 76                    | `id_categoria_verduras`   |
| Abacate                     | NÃO CONTÉM GLÚTEN.                                                                                           | 150   | 64                    | `id_categoria_frutas`     |
| Tomate                      | Rico em vitaminas A, B e C.                                                                                  | 125   | 88                    | `id_categoria_verduras`   |
| Acelga                      | NÃO CONTÉM GLÚTEN.                                                                                           | 235   | 13                    | `id_categoria_verduras`   |
| Macarrão parafuso           | Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais                               | 690   | 5                     | `id_categoria_massas`     |
| Massa para lasanha          | Uma reunião de família precisa ter comida boa e muita alegria.                                               | 875   | 19                    | `id_categoria_massas`     |
| Refrigerante coca cola lata | Sabor original                                                                                               | 350   | 189                   | `id_categoria_bebidas`    |
| Refrigerante Pepsi 2l       | NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.                                                                            | 700   | 12                    | `id_categoria_bebidas`    |
| Cerveja Heineken 600ml      | Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado                                | 1200  | 500                   | `id_categoria_bebidas`    |
| Agua mineral sem gás        | Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro. | 130   | 478                   | `id_categoria_bebidas`    |
| Vassoura                    | Pigmento, matéria sintética e metal.                                                                         | 2350  | 30                    | `id_categoria_utilidades` |
| Saco para lixo              | Reforçado para garantir mais segurança                                                                       | 1340  | 90                    | `id_categoria_utilidades` |
| Escova dental               | Faça uma limpeza profunda com a tecnologia inovadora                                                         | 1000  | 44                    | `id_categoria_utilidades` |
| Balde para lixo 50l         | Possui tampa e fabricado com material reciclado                                                              | 2290  | 55                    | `id_categoria_utilidades` |
| Manga                       | Rico em Vitamina A, potássio e vitamina C                                                                    | 198   | 176                   | `id_categoria_frutas`     |
| Uva                         | NÃO CONTÉM GLÚTEN.                                                                                           | 420   | 90                    | `id_categoria_frutas`     |

Obs.: informado o `id` da `categoria_id` referente a cada produto. Ex.: frutas `categoria_id = 1`.

3 - Acrescida a tabela `clientes` as seguintes informações

| cpf            | nome               |
| -------------- | ------------------ |
| 803.713.500-42 | José Augusto Silva |
| 676.428.690-61 | Antonio Oliveira   |
| 631.933.100-34 | Ana Rodrigues      |
| 756.705.050-18 | Maria da Conceição |

4 - Adicinada a tabela `vendedores` as seguintes informações

| cpf            | nome                 |
| -------------- | -------------------- |
| 825.398.410-31 | Rodrigo Sampaio      |
| 232.625.460-03 | Beatriz Souza Santos |
| 280.071.550-23 | Carlos Eduardo       |

5 - Agora que o banco de dados fora alimentado, realizamos algumas vendas. Sendo assim, construímos um relatório para que as vendas fossem lançadas.

Obs: Sempre que fosse lançada uma venda, era necessário abater as quantidades no estoque dos produtos vendidos antes de uma nova venda.

a) José Algusto comprou os seguintes itens com o vendedor Carlos Eduardo:

- 1 Mamão, 1 Pepsi de 2l, 6 Heinekens de 600ml, 1 Escova dental e 5 Maçãs.

b) Ana Rodrigues comprou os seguintes itens com a vendedora Beatriz Souza Santos

- 10 Mangas, 3 Uvas, 5 Mamões, 10 tomates e 2 Acelgas.

c) Maria da Conceição comprou os seguintes itens com a vendedora Beatriz Souza Santos

- 1 Vassoura, 6 Águas sem gás e 5 Mangas.

d) Maria da Conceição comprou os seguintes itens com o vendedor Rodrigo Sampaio

- 1 Balde para lixo, 6 Uvas, 1 Macarrão parafuso, 3 Mamões, 20 tomates e 2 Acelgas.

e) Antonio Oliveira comprou os seguintes itens com o vendedor Rodrigo Sampaio

- 8 Uvas, 1 Massa para lasanha, 3 Mangas, 8 tomates e 2 Heinekens 600ml.

## Tecnologias Utilizadas

* [Beekeper](https://www.beekeeperstudio.io/) - Editor SQL e gerenciador de banco de dados .
* [PostgreSQL](https://www.postgresql.org/) - Banco de dados relacional de código aberto.
* [VScode](https://code.visualstudio.com/) - Editor de código-fonte .

## Autor
**Romão Bernardo** - *Desenvolvido durante as aulas do curso de formaçõe em Back-end* - [romaobernnardo](https://github.com/romaobernnardo)

## Contribuir para o Projeto

1. Faça um fork do projeto.

2. Crie uma nova branch com as suas alterações:

```
git checkout -b minha-feature
```

3. Salve as alterações e crie uma mensagem de commit descrevendo o que você fez:

```
git commit -m "feat: Minha nova funcionalidade"
```

4. Envie as suas alterações para o GitHub:

```
git push origin minha-feature
```

5. Abra um Pull Request descrevendo suas alterações.

## Licença
Não se aplica a este projeto.



