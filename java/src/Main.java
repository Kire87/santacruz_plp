public class Main {
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

		for (Player pl : player) {
			System.out.println(pl.getName());
		}
	}
}
