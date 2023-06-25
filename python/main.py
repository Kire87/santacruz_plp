class Player:
    def __init__(self, name, number, position, alt_positions=None):
        self.name = name
        self.number = number
        self.position = position
        self.alt_positions = alt_positions or []


class Main:
    def __init__(self):
        self.players = []
        self.winning_eleven = []

    def add_player(self, player):
        self.players.append(player)

    def substitution(self, n1, n2):
        for i in range(len(self.winning_eleven)):
            if self.winning_eleven[i].number == n1:
                self.winning_eleven[i] = self.players[n2 - 1]
                break

    def player_info(self, n1):
        for player in self.players:
            if player.number == n1:
                print("Name:", player.name)
                print("Number:", player.number)
                print("Position:", player.position)
                print("Alternative Positions:", ', '.join(player.alt_positions))
                break

    def show_team(self):
        for player in self.winning_eleven:
            print(player.number, "- ", player.name)


if __name__ == '__main__':
    team = Main()

    team.add_player(Player("Michael", 1, "Goleiro"))
    team.add_player(Player("Léo Fernandes", 2, "Lateral Direito", ["Ponta Direita"]))
    team.add_player(Player("Ítalo Melo", 3, "Zagueiro"))
    team.add_player(Player("Guedes", 4, "Zagueiro"))
    team.add_player(Player("Pingo", 5, "Volante"))
    team.add_player(Player("Marcus Vinícius", 6, "Lateral Esquerdo"))
    team.add_player(Player("Lucas Silva", 7, "Ponta Esquerda", ["Centroavante", "Segundo Atacante"]))
    team.add_player(Player("Fabrício", 8, "Volante", ["Meia Central", "Lateral Direito"]))
    team.add_player(Player("Pipico", 9, "Centroavante", ["Meia Ofensivo"]))
    team.add_player(Player("Chiquinho", 10, "Ponta Esquerda", ["Lateral Esquerdo", "Ponta Direita"]))
    team.add_player(Player("Nadson", 11, "Meia Ofensivo", ["Segundo Atacante"]))
    team.add_player(Player("Geaze", 12, "Goleiro"))
    team.add_player(Player("Jadson", 13, "Lateral Direito", ["Volante"]))
    team.add_player(Player("Yan Oliveira", 14, "Zagueiro"))
    team.add_player(Player("Anderson Paulista", 15, "Volante"))
    team.add_player(Player("Mateus Müller", 16, "Lateral Esquerdo"))
    team.add_player(Player("Italo Henrique", 17, "Meia Central"))
    team.add_player(Player("Emerson Galego", 18, "Atacante"))
    team.add_player(Player("Gabriel Cardoso (Ben 10)", 19, "Centroavante"))
    team.add_player(Player("Marcelinho", 20, "Centroavante"))
    team.add_player(Player("Italo Silva", 21, "Lateral Esquerdo", ["Ponta Esquerda"]))
    team.add_player(Player("Maranhão", 22, "Ponta Direita", ["Ponta Esquerda", "Meia Ofensivo"]))
    team.add_player(Player("Dayvid", 23, "Meia Ofensivo", ["Ponta Direita", "Ponta Esquerda"]))

    print("Todos os jogadores do Santa Cruz:")
    for player in team.players:
        print(player.number, "- ", player.name)

    team.winning_eleven = [
        team.players[0],
        team.players[1],
        team.players[2],
        team.players[3],
        team.players[5],
        team.players[4],
        team.players[7],
        team.players[9],
        team.players[6],
        team.players[10],
        team.players[8]
    ]

    print("\nTitulares:")
    for player in team.winning_eleven:
        print(player.number, "- ", player.name)

    while True:
        print("\n1 - Substituiçao")
        print("2 - Informaçoes de jogador")
        print("3 - Mostrar o time")
        print("4 - Fechar o programa")
        opt = int(input())

        if opt == 1:
            print("\nInsira o número do jogador que ira sair:")
            n1 = int(input())
            print("Insira o número do jogador que ira entrar:")
            n2 = int(input())

            team.substitution(n1, n2)
            print()

        elif opt == 2:
            print("\nInsira o número do jogador:")
            n1 = int(input())

            team.player_info(n1)
            print()

        elif opt == 3:
            print()
            team.show_team()
            print()

        elif opt == 4:
            print("\nEncerrando... \nbip... \nbip... \nbop...")
            break
