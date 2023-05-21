#include <stdio.h>

typedef struct Player {
	char name[50];
	int number;
	char position_main[50];
	char position_other[2][50];
	int birthyear;
} Player;

int main() {
	Player players[] = {
		{"Michael", 1, "Goleiro", {}, 1995},
		{"Léo Fernandes", 2, "Lateral Direito", {"Ponta Direita"}, 1996},
		{"Ítalo Melo", 3, "Zagueiro", {}, 1999},
		{"Guedes", 4, "Zagueiro", {}, 2002},
		{"Pingo", 5, "Volante", {}, 2001},
		{"Marcus Vinícius", 6, "Lateral Esquerdo", {}, 1994},
		{"Lucas Silva", 7, "Ponta Esquerda", {"Centroavante", "Segundo Atacante"}, 1994},
		{"Fabrício", 8, "Volante", {"Meia Central", "Lateral Direito"}, 1998},
		{"Pipico", 9, "Centroavante", {"Meia Ofensivo"}, 1985},
		{"Chiquinho", 10, "Ponta Esquerda", {"Lateral Esquerdo", "Ponta Direita"}, 1989},
		{"Nadson", 11, "Meia Ofensivo", {"Segundo Atacante"}, 1999},
		{"Geaze", 12, "Goleiro", {}, 1994},
		{"Jadson", 13, "Lateral Direito", {"Volante"}, 2002},
		{"Yan Oliveira", 14, "Zagueiro", {}, 1999},
		{"Anderson Paulista", 15, "Volante", {}, 1998},
		{"Mateus Müller", 16, "Lateral Esquerdo", {}, 1995},
		{"Italo Henrique", 17, "Meia Central", {}, 1998},
		{"Emerson Galego", 18, "Atacante", {}, 1999},
		{"Gabriel Cardoso (Ben 10)", 19, "Centroavante", {}, 2003},
		{"Marcelinho", 20, "Centroavante", {}, 2002},
		{"Italo Silva", 21, "Lateral Esquerdo", {"Ponta Esquerda"}, 1991},
		{"Maranhão", 22, "Ponta Direita", {"Ponta Esquerda", "Meia Ofensivo"}, 1990},
		{"Dayvid", 23, "Meia Ofensivo", {"Ponta Direita", "Ponta Esquerda"}, 2003}
		//Ainda faltam Rokenedy (goleiro), Thiago (goleiro), Luiz Paim (zagueiro), Dudu Ferraz (zagueiro), Daniel Pereira (volante) e Carlos Henrique (volante).
	};
	int playersLength = sizeof(players) / sizeof(players[0]);
	
	Player winning_eleven[11];
	int n;
	printf("Insira os números dos 11 titulares escalados:\n");
	for(int i = 0; i < 11; i++) {
		scanf("%d", &n);
		for(int j = 0; j < playersLength; j++) {
			if(n == players[j].number)
				winning_eleven[i] = players[j];
		}
	}

	printf("\n");

	for(int i = 0; i < 11; i++) {
		printf("%s\n", winning_eleven[i].name);
	}

	int opt;
	while(1) {
		printf("\n1 - Substituição\n2 - Informações de jogador\n3 - Mostrar o time\n");
		scanf("%d", &opt);

		int n1;
		int n2;
		if(opt == 1) {
			printf("\nNúmero do jogador que vai sair:\n");
			scanf("%d", &n1);

			printf("Número do jogador que vai entrar:\n");
			scanf("%d", &n2);

			for(int i = 0; i < 11; i++) {
				if(winning_eleven[i].number == n1) {
					printf("\nSai %s\n", winning_eleven[i].name);
					for(int j = 0; j < playersLength; j++) {
						if(players[j].number == n2) {
							winning_eleven[i] = players[j];
							printf("Entra %s\n", winning_eleven[i].name);
						}
					}
				}
			}
		}

		if(opt == 2) {
			printf("\nInsira o número do jogador:\n");
			scanf("%d", &n1);
			for(int i = 0; i < playersLength; i++) {
				if(players[i].number == n1) {
					printf("\nNúmero: %d\nNome: %s\nPosição principal: %s\nAno de nascimento: %d\n", players[i].number, players[i].name, players[i].position_main, players[i].birthyear);
				}
			}
		}

		if(opt == 3) {
			for(int i = 0; i < 11; i++) {
				printf("\n%d %s\n", winning_eleven[i].number, winning_eleven[i].name);
			}
		}
	}

	return 0;
}
