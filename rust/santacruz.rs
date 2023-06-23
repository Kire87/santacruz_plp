use std::io;

#[derive(Clone)]
#[derive(Default)]
struct Player {
    name: String,
    number: i8,
    position_main: String,
    position_other: [String; 2],
    birthyear: i16,
}

fn build_player(name: String, number: i8, position_main: String, position_other: [String; 2], birthyear: i16) -> Player {
    Player {
        name,
        number,
        position_main,
        position_other,
        birthyear,
    }
}

fn main(){
    let mut input = String::new();
    let players = [
        build_player(String::from("Michael"), 1, String::from("Goleiro"), Default::default(), 1995),
        build_player(String::from("Léo Fernandes"), 2, String::from("Lateral Direito"), [String::from("Ponta Direita"), String::from("")], 1996),
        build_player(String::from("Ítalo Melo"), 3, String::from("Zagueiro"), Default::default(), 1999),
        build_player(String::from("Guedes"), 4, String::from("Zagueiro"), Default::default(), 2002),
        build_player(String::from("Pingo"), 5, String::from("Volante"), Default::default(), 2001),
        build_player(String::from("Marcus Vinícius"), 6, String::from("Lateral Esquerdo"), Default::default(), 1994),
        build_player(String::from("Lucas Silva"), 7, String::from("Ponta Esquerda"), [String::from("Centroavante"), String::from("Segundo Atacante")], 1994),
        build_player(String::from("Fabrício"), 8, String::from("Volante"), [String::from("Meia Central"), String::from("Lateral Direito")], 1998),
        build_player(String::from("Pipico"), 9, String::from("Centroavante"), [String::from("Meia Ofensivo"), String::from("")], 1985),
        build_player(String::from("Chiquinho"), 10, String::from("Ponta Esquerda"), [String::from("Lateral Esquerdo"), String::from("Ponta Direita")], 1989),
        build_player(String::from("Nadson"), 11, String::from("Meia Ofensivo"), [String::from("Segundo Atacante"), String::from("")], 1999),
        build_player(String::from("Geaze"), 12, String::from("Goleiro"), Default::default(), 1994),
        build_player(String::from("Jadson"), 13, String::from("Lateral Direito"), [String::from("Volante"), String::from("")], 2002),
        build_player(String::from("Yan Oliveira"), 14, String::from("Zagueiro"), Default::default(), 1999),
        build_player(String::from("Anderson Paulista"), 15, String::from("Volante"), Default::default(), 1998),
        build_player(String::from("Mateus Müller"), 16, String::from("Lateral Esquerdo"), Default::default(), 1995),
        build_player(String::from("Italo Henrique"), 17, String::from("Meia Central"), Default::default(), 1998),
        build_player(String::from("Emerson Galego"), 18, String::from("Atacante"), Default::default(), 1999),
        build_player(String::from("Gabriel Cardoso (Ben 10)"), 19, String::from("Centroavante"), Default::default(), 2003),
        build_player(String::from("Marcelinho"), 20, String::from("Centroavante"), Default::default(), 2002),
        build_player(String::from("Italo Silva"), 21, String::from("Lateral Esquerdo"), [String::from("Ponta Esquerda"), String::from("")], 1991),
        build_player(String::from("Maranhão"), 22, String::from("Ponta Direita"), [String::from("Ponta Esquerda"), String::from("Meia Ofensivo")], 1990),
        build_player(String::from("Dayvid"), 23, String::from("Meia Ofensivo"), [String::from("Ponta Direita"), String::from("Ponta Esquerda")], 2003),
    ];

    let mut winning_eleven: [Player; 11] = Default::default();
    println!("Insira os números dos 11 titulares escalados:");
    let mut player_number: i8;
    for i in 0..11 {

        io::stdin().read_line(&mut input).expect("Failed to readline");
	player_number = input.trim().parse().expect("Invalid input");
	input = String::from("");

	for j in 0..players.len() {
	    if player_number == players[j].number {
		winning_eleven[i] = players[j].clone();
	    }
	}
    }
    for i in 0..11 {
	println!("{}", winning_eleven[i].name);
    }

    let mut choice: i8 = 1;
    let mut choice2: i8;
    let mut choice3: i8;
    while choice != 0 {
	println!("\n1 - Substituição\n2 - Informações de jogador\n3 - Mostrar o time\n0 - Sair");

        io::stdin().read_line(&mut input).expect("Failed to readline");
	choice = input.trim().parse().expect("Invalid input");
	input = String::from("");

	if choice==1 {
	    println!("Número do jogador que vai sair:");

	    io::stdin().read_line(&mut input).expect("Failed to readline");
	    choice2 = input.trim().parse().expect("Invalid input");
	    input = String::from("");

	    println!("Número do jogador que vai entrar:");

	    io::stdin().read_line(&mut input).expect("Failed to readline");
	    choice3 = input.trim().parse().expect("Invalid input");
	    input = String::from("");

	    for i in 0..10 {
		if winning_eleven[i].number == choice2 {
		    println!("Sai {}", winning_eleven[i].name);
		    for j in 0..players.len() {
			if players[j].number == choice3 {
			    winning_eleven[i] = players[j].clone();
			    println!("Entra {}", winning_eleven[i].name);
			}
		    }
		}
	    }
	}
	if choice == 2 {
	    println!("Insira o número do jogador:");

	    io::stdin().read_line(&mut input).expect("Failed to readline");
	    choice2 = input.trim().parse().expect("Invalid input");
	    input = String::from("");

	    for i in 0..players.len() {
		if players[i].number == choice2 {
		    println!("\nNúmero: {}\nNome: {}\nPosição Principal: {}\nAno de nascimento: {}\n", players[i].number, players[i].name, players[i].position_main, players[i].birthyear);
		}
	    }
	}

	if choice == 3 {
	    for i in 0..11 {
		println!("{} {}", winning_eleven[i].number, winning_eleven[i].name);
	    }
	}
    }
}
