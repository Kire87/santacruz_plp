program santinha;

const
  MaxPlayers = 23;

type
  Player = record
    name: string;
    number: Integer;
    position_main: string;
    birthyear: Integer;
  end;

var
  players: array[0..MaxPlayers-1] of Player;
  playerCount: Integer;
  setup: Integer;

procedure AddPlayer(const playerName: string; playerNumber: Integer; const mainPosition: string; playerBirthyear: Integer);
begin
  if playerCount < MaxPlayers then
  begin
    players[playerCount].name := playerName;
    players[playerCount].number := playerNumber;
    players[playerCount].position_main := mainPosition;
    players[playerCount].birthyear := playerBirthyear;
    Inc(playerCount);
  end
  else
    Writeln('Não é possível adicionar mais jogadores. Limite máximo atingido.');
end;

procedure lineup(const players: array of Player);
var
  i: Integer;
begin
  writeln('Jogadores Disponíveis:');
  for i := 0 to Length(players) - 1 do
  begin
    writeln('Nome: ', players[i].name);
    writeln('Número: ', players[i].number);
  end;
end;

procedure CreateWinningEleven(const players: array of Player; var winningEleven: array of Player);
var
  playersLength: Integer;
  i, j, k, n: Integer;
  playerFound: Boolean;
begin
  playersLength := Length(players);
  writeln('Insira os números dos 11 titulares escalados: ');
  for i := 0 to 10 do
  begin
    repeat
      playerFound := False;
      Readln(n);
      for j := 0 to playersLength - 1 do
      begin
        if (n = players[j].number) then
        begin
          for k := 0 to i - 1 do
          begin
            if (winningEleven[k].number = n) then
            begin
              playerFound := True;
              writeln('Esse jogador já foi escalado. Por favor, escolha outro número:');
              Break;
            end;
          end;
          if (not playerFound) then
          begin
            winningEleven[i] := players[j];
            Break;
          end;
        end;
      end;

      if (not playerFound) then
        Break;

    until (not playerFound);

    if (playerFound) then
    begin
      writeln('Não tem nenhum jogador registrado com esse número');
      writeln('Registe um jogador com o número valido...');
      lineup(players);

      writeln();
      writeln('Jogadores já escalados: ');
      lineup(winningEleven);
    end;
  end;
end;

procedure ShowAvailableSubstitutes(const players: array of Player; const winningEleven: array of Player);
var
  i, j: Integer;
  playerFound: Boolean;
begin
  writeln('Jogadores Disponíveis no Banco:');
  for i := 0 to Length(players) - 1 do
  begin
    playerFound := False;

    for j := 0 to Length(winningEleven) - 1 do
    begin
      if players[i].number = winningEleven[j].number then
      begin
        playerFound := True;
        Break;
      end;
    end;
    if not playerFound then
    begin
      writeln('Nome: ', players[i].name);
      writeln('Número: ', players[i].number);
    end;
  end;
end;


procedure SubstitutePlayer(const players: array of Player; var winningEleven: array of Player);
var
  currentPlayerIndex: Integer;
  newPlayerName: string;
  currentPlayer: Player;
  newPlayer: Player;
  i: Integer;
  playerFound: Boolean;
begin
  writeln('Digite o nome do jogador que deseja substituir: ');
  Readln(currentPlayer.name);

  currentPlayerIndex := -1;
  for i := 0 to Length(winningEleven) - 1 do
  begin
    if winningEleven[i].name = currentPlayer.name then
    begin
      currentPlayer := winningEleven[i];
      currentPlayerIndex := i;
      Break;
    end;
  end;

  if currentPlayerIndex = -1 then
  begin
    writeln('Jogador não encontrado na escalação atual.');
    Exit;
  end;

  writeln('Digite o nome do jogador que deseja que entre no time: ');
  Readln(newPlayerName);

  playerFound := False;
  for i := 0 to Length(players) - 1 do
  begin
    if players[i].name = newPlayerName then
    begin
      newPlayer := players[i];
      playerFound := True;
      Break;
    end;
  end;

  if not playerFound then
  begin
    writeln('Jogador não encontrado na lista de jogadores disponíveis.');
    Exit;
  end;

  winningEleven[currentPlayerIndex] := newPlayer;
  writeln('Substituição realizada com sucesso!');
end;

procedure GetPlayerData(const playerName: string; const players: array of Player);
var
  i: Integer;
  playerFound: Boolean;
begin
  playerFound := False;

  for i := 0 to Length(players) - 1 do
  begin
    if players[i].name = playerName then
    begin
      writeln('Dados do jogador "', playerName, '":');
      writeln('Nome: ', players[i].name);
      writeln('Número: ', players[i].number);
      writeln('Posição Principal: ', players[i].position_main);
      writeln('Ano de Nascimento: ', players[i].birthyear);
      playerFound := True;
      Break;
    end;
  end;

  if not playerFound then
    writeln('Jogador "', playerName, '" não encontrado.');
end;


var
  winningEleven: array[0..10] of Player;
  i: Integer;
  playerName: string;

begin
  playerCount := 0;
  setup := 0;


  AddPlayer('Michael', 1, 'Goleiro', 1995);
  AddPlayer('Léo Fernandes', 2, 'Lateral Direito', 1996);
  AddPlayer('Ítalo Melo', 3, 'Zagueiro', 1999);
  AddPlayer('Guedes', 4, 'Zagueiro', 2002);
  AddPlayer('Pingo', 5, 'Volante', 2001);
  AddPlayer('Marcus Vinícius', 6, 'Lateral Esquerdo', 1994);
  AddPlayer('Lucas Silva', 7, 'Ponta Esquerda', 1994);
  AddPlayer('Fabrício', 8, 'Volante', 1998);
  AddPlayer('Pipico', 9, 'Centroavante', 1985);
  AddPlayer('Chiquinho', 10, 'Ponta Esquerda', 1989);
  AddPlayer('Nadson', 11, 'Meia Ofensivo', 1999);
  AddPlayer('Geaze', 12, 'Goleiro', 1994);
  AddPlayer('Jadson', 13, 'Lateral Direito', 2002);
  AddPlayer('Yan Oliveira', 14, 'Zagueiro', 1999);
  AddPlayer('Anderson Paulista', 15, 'Volante', 1998);
  AddPlayer('Mateus Müller', 16, 'Lateral Esquerdo', 1995);
  AddPlayer('Italo Henrique', 17, 'Meia Central', 1998);
  AddPlayer('Emerson Galego', 18, 'Atacante', 1999);
  AddPlayer('Gabriel Cardoso (Ben 10)', 19, 'Centroavante', 2003);
  AddPlayer('Marcelinho', 20, 'Centroavante', 2002);
  AddPlayer('Italo Silva', 21, 'Lateral Esquerdo', 1991);
  AddPlayer('Maranhão', 22, 'Ponta Direita', 1990);
  AddPlayer('Dayvid', 23, 'Meia Ofensivo', 2003);


  writeln('Bem vindo ao sistema de gerenciamento de jogadores do Santa Cruz Futebol Clube');
  lineup(players);
  writeln('Para usar o sistema primeiro escale o seu time');
  writeln('Escreva o nome dos 11 jogadores titulares para a partida:');

  CreateWinningEleven(players, winningEleven);

  while setup <> 100 do
  begin
    writeln();

    writeln('Menu de Opções:');
    writeln('1. Visualizar time atual');
    writeln('2. Visualizar banco de reservas');
    writeln('3. Realizar substituição');
    writeln('4. Obter dados de um jogador');
    writeln('100. Encerrar programa');
    writeln();
    writeln('Digite o número correspondente à opção desejada:');
    Readln(setup);

    case setup of
      1:
      begin
        writeln('Time atual:');
        lineup(winningEleven);
      end;

      2:
      begin
        ShowAvailableSubstitutes(players, winningEleven);
      end;

      3:
      begin
        SubstitutePlayer(players, winningEleven);
      end;

      4:
      begin
        writeln('Digite o nome do jogador para obter seus dados:');
        Readln(playerName);
        GetPlayerData(playerName, players);
      end;

      100:
      begin
        writeln('Programa encerrado.');
        Break;
      end;

      else
      begin
        writeln('Opção inválida. Por favor, escolha uma opção válida.');
      end;
    end;
  end;

end.
