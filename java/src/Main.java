import java.util.Scanner;

public class Main {
	public static void substitution(Player[] player, Player[] winning_eleven, int n1, int n2) {
		for(int i = 0; i < 11; i++) {
			if(winning_eleven[i].getNumber() == n1) {
				System.out.println("Sai " + winning_eleven[i].getName());
					for(int j = 0; j < player.length; j++) {
						if(player[j].getNumber() == n2) {
							winning_eleven[i] = player[j];
							System.out.println("Entra " + winning_eleven[i].getName());
						}
				}
			}
		}

		//return winning_eleven;
	}

	public static void playerInfo(Player[] player, int n) {
		for(Player pl : player) {
			if(pl.getNumber() == n) {
				System.out.println("Número: " + pl.getNumber() + "\nNome: " + pl.getName() + "\nPosição principal: " + pl.getPosition());
			}
		}
	}

	public static void showTeam(Player[] winning_eleven) {
		for(Player we : winning_eleven) {
			System.out.println(we.getNumber() + ". " + we.getName());
		}
	}

	public static void main(String[] args) {
		Player[] player = new Player[23];

		player[0] = new Player("Michael", 1, "Goleiro");
		player[1] = new Player("Léo Fernandes", 2, "Lateral Direito", new String[]{"Ponta Direita"});
		player[2] = new Player("Ítalo Melo", 3, "Zagueiro");
		player[3] = new Player("Guedes", 4, "Zagueiro");
		player[4] = new Player("Pingo", 5, "Volante");
		player[5] = new Player("Marcus Vinícius", 6, "Lateral Esquerdo");
		player[6] = new Player("Lucas Silva", 7, "Ponta Esquerda", new String[]{"Centroavante", "Segundo Atacante"});
		player[7] = new Player("Fabrício", 8, "Volante", new String[]{"Meia Central", "Lateral Direito"});
		player[8] = new Player("Pipico", 9, "Centroavante", new String[]{"Meia Ofensivo"});
		player[9] = new Player("Chiquinho", 10, "Ponta Esquerda", new String[]{"Lateral Esquerdo", "Ponta Direita"});
		player[10] = new Player("Nadson", 11, "Meia Ofensivo", new String[]{"Segundo Atacante"});
		player[11] = new Player("Geaze", 12, "Goleiro");
		player[12] = new Player("Jadson", 13, "Lateral Direito", new String[]{"Volante"});
		player[13] = new Player("Yan Oliveira", 14, "Zagueiro");
		player[14] = new Player("Anderson Paulista", 15, "Volante");
		player[15] = new Player("Mateus Müller", 16, "Lateral Esquerdo");
		player[16] = new Player("Italo Henrique", 17, "Meia Central");
		player[17] = new Player("Emerson Galego", 18, "Atacante");
		player[18] = new Player("Gabriel Cardoso (Ben 10)", 19, "Centroavante");
		player[19] = new Player("Marcelinho", 20, "Centroavante");
		player[20] = new Player("Italo Silva", 21, "Lateral Esquerdo", new String[]{"Ponta Esquerda"});
		player[21] = new Player("Maranhão", 22, "Ponta Direita", new String[]{"Ponta Esquerda", "Meia Ofensivo"});
		player[22] = new Player("Dayvid", 23, "Meia Ofensivo", new String[]{"Ponta Direita", "Ponta Esquerda"});

		System.out.println("Jogadores: ");
		for (Player pl : player) {
			System.out.println(pl.getNumber() + ". " + pl.getName());
		}

		Player[] winning_eleven = new Player[11];

		winning_eleven[0] = player[0];
		winning_eleven[1] = player[1];
		winning_eleven[2] = player[2];
		winning_eleven[3] = player[3];
		winning_eleven[4] = player[5];
		winning_eleven[5] = player[4];
		winning_eleven[6] = player[7];
		winning_eleven[7] = player[9];
		winning_eleven[8] = player[6];
		winning_eleven[9] = player[10];
		winning_eleven[10] = player[8];

		System.out.println();

		System.out.println("Titulares: ");
		for(Player we : winning_eleven) {
			System.out.println(we.getNumber() + ". " + we.getName());
		}

		System.out.println();

		Scanner sc = new Scanner(System.in);
		int opt;
		while(true) {
			System.out.println("1 - Substituição\n2 - Informações de jogador\n3 - Mostrar o time\n4 - Fechar o programa");
			opt = sc.nextInt();

			int n1, n2;
			if(opt == 1) {
				System.out.println();

				System.out.println("Insira o número do jogador que irá sair");
				n1 = sc.nextInt();

				System.out.println("Insira o número do jogador que irá entrar");
				n2 = sc.nextInt();

				System.out.println();

				//winning_eleven = substitution(player, winning_eleven, n1, n2);
				substitution(player, winning_eleven, n1, n2);

				System.out.println();
			}

			if(opt == 2) {
				System.out.println();

				System.out.println("Insira o número do jogador");
				n1 = sc.nextInt();

				System.out.println();

				playerInfo(player, n1);

				System.out.println();
			}

			if(opt == 3) {
				System.out.println();

				showTeam(winning_eleven);

				System.out.println();
			}

			if(opt == 4) {
				System.out.println();

				System.out.println("Encerrando...");
				break;
			}
		}
	}
}
