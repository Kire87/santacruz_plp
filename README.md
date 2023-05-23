# santacruz_plp
Santa Cruz Futebol Clube

## Comandos Prolog
###Substituição
1. Remover jogador
```retract(winning_eleven(numero)).```

2. Adicionar jogador
```assert(winning_eleven(numero)).```

###Informações de jogador
1. Mostrar nome
```number(numero, X).```

2. Mostrar posição
```position(numero, X).```

3. Mostrar time
```winning_eleven(X).```

4. Fechar programa
```halt.```
