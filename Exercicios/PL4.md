# PL4



Neste guião foi nos dada a tarefa de criar uma interface para a consulta de uma base de dados composta por 2 ficheiros **friends.txt** e **users.txt**.



O ficheiro de amigos é composto por 3 colunas

- **ID de ultilizador**

- **ID de um amigo**

- **Data de ultimo contacto**

sendo que um **ID** é repetido consoante o numero de amigos



O ficheiro de utilizadores é composto por no máximo 20 colunas sendo a primeira o **ID**, a segunda, o **Nome**, a terceira o **Segundo nome/nomes** seguidas por um numero aleatório, de 1 a 17, de colunas com os interesses desse utilizador.



**Ex** :



> 1;Matilde;Torres Moura;Música;Leitura;História;Andebol;Ténis



## As opções a implementadas são as seguintes:



1. Your friends

2. Interests from similar user

3.  Search name

4. Find most similar user based in list of interests

5. Exit





## 0. Pré processamento



A primeira coisa que o programa principal faz ao ser executado é fazer o pré processamento dos dados caso não tenha sido feito, procedendo á armazenação de várias variáveis a ser utilizadas pelas diversas funções ao longo do programa.



```matlab
[users,friends,categorias,interesses_docs,interesses_ass,names_ass,names_shingles,hash_param,Bloom_filter,bloom_hashf] = Init()
```



- **Users**

Cell array onde são amazernados as 3 primeiras colunas dos **users**



- **friends**



Cell array onde são amzernadas as 3 (5 se separamos as datas pelo dia, mês  e ano)







## 1. Your friends





# 


