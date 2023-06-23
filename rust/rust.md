# RUST

- Variáveis em rust são escritas da seguinte forma: (nome: tipo).
- Ao invés de objetos, usei structs que são parecidas com structs em C. Mas com uma função adicional para construir uma struct.
- Há dois tipos de String: String e &str. String é vetor de bytes garantidos em ser uma sequência UTF-8 válida. &str é um 'slice' um ponteiro para um bloco de memória que aponta sempre para uma sequência UTF-8 válida.
- Temos no rust o derive, utilizado nas primeiras linhas do código nesta pasta. O derive serve para que o compilador faça implementações básicas de características. No código utilizamos Clone e Default, que, respectivamente, "give a type 'copy semantics' instead of 'move semantics'." e "create an empty instance of a data type."
- Nas variáveis temos o 'mut', isso indica ao compilador que aquela variável é mutável. Ou seja, deverá ser alterada em algum momento.
- 
