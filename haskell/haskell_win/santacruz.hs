import Control.Monad (when)
import Data.List (find)
import Data.Maybe (fromMaybe)
import Data.List (intercalate)
import Data.IORef (IORef, newIORef, readIORef, writeIORef)

data Player = Player
  { name :: String,
    number :: Int,
    position :: String,
    additionalPositions :: [String]
  }

type PlayerEntry = (Player, Bool)

playerInfo :: Player -> IO ()
playerInfo player = do
  putStrLn $ "Número: " ++ show (number player)
  putStrLn $ "Nome: " ++ name player
  putStrLn $ "Posição principal: " ++ position player
  putStrLn $ "Posições secundárias: " ++ intercalate ", " (additionalPositions player)

showTeam :: [PlayerEntry] -> IO ()
showTeam winningEleven =
  mapM_ (\(player, _) -> putStrLn $ show (number player) ++ ". " ++ name player) winningEleven

main :: IO ()
main = do
  let players =
        [ Player "Michael" 1 "Goleiro" [],
          Player "Léo Fernandes" 2 "Lateral Direito" ["Ponta Direita"],
          Player "Ítalo Melo" 3 "Zagueiro" [],
          Player "Guedes" 4 "Zagueiro" [],
          Player "Pingo" 5 "Volante" [],
          Player "Marcus Vinícius" 6 "Lateral Esquerdo" [],
          Player "Lucas Silva" 7 "Ponta Esquerda" ["Centroavante", "Segundo Atacante"],
          Player "Fabrício" 8 "Volante" ["Meia Central", "Lateral Direito"],
          Player "Pipico" 9 "Centroavante" ["Meia Ofensivo"],
          Player "Chiquinho" 10 "Ponta Esquerda" ["Lateral Esquerdo", "Ponta Direita"],
          Player "Nadson" 11 "Meia Ofensivo" ["Segundo Atacante"],
          Player "Geaze" 12 "Goleiro" [],
          Player "Jadson" 13 "Lateral Direito" ["Volante"],
          Player "Yan Oliveira" 14 "Zagueiro" [],
          Player "Anderson Paulista" 15 "Volante" [],
          Player "Mateus Müller" 16 "Lateral Esquerdo" [],
          Player "Italo Henrique" 17 "Meia Central" [],
          Player "Emerson Galego" 18 "Atacante" [],
          Player "Gabriel Cardoso (Ben 10)" 19 "Centroavante" [],
          Player "Marcelinho" 20 "Centroavante" [],
          Player "Italo Silva" 21 "Lateral Esquerdo" ["Ponta Esquerda"],
          Player "Maranhão" 22 "Ponta Direita" ["Ponta Esquerda", "Meia Ofensivo"],
          Player "Dayvid" 23 "Meia Ofensivo" ["Ponta Direita", "Ponta Esquerda"]
        ]

  putStrLn "Jogadores:"
  mapM_ (\player -> putStrLn $ show (number player) ++ ". " ++ name player) players

  winningElevenRef <- newIORef $ initialWinningEleven players

  let loop = do
        putStrLn "1 - Substituição"
        putStrLn "2 - Informações de jogador"
        putStrLn "3 - Mostrar o time"
        putStrLn "4 - Fechar o programa"

        opt <- readLn

        case opt of
          1 -> do
            putStrLn "Insira o número do jogador a ser substituído:"
            oldNumber <- readLn
            putStrLn "Insira o número do jogador que entrará:"
            newNumber <- readLn
            substitutePlayer winningElevenRef oldNumber newNumber players
            putStrLn ""
            loop

          2 -> do
            putStrLn "Insira o número do jogador:"
            n <- readLn
            putStrLn ""
            let player = fromMaybe (head players) (find (\p -> number p == n) players)
            playerInfo player
            putStrLn ""
            loop

          3 -> do
            putStrLn ""
            winningEleven <- readIORef winningElevenRef
            showTeam winningEleven
            putStrLn ""
            loop

          4 -> putStrLn "Encerrando..."

          _ -> loop

  loop

initialWinningEleven :: [Player] -> [PlayerEntry]
initialWinningEleven players =
  [ (head players, True),
    (players !! 1, True),
    (players !! 2, True),
    (players !! 3, True),
    (players !! 5, True),
    (players !! 4, True),
    (players !! 7, True),
    (players !! 9, True),
    (players !! 6, True),
    (players !! 10, True),
    (players !! 8, True)
  ]

substitutePlayer :: IORef [PlayerEntry] -> Int -> Int -> [Player] -> IO ()
substitutePlayer winningElevenRef oldNumber newNumber players = do
  winningEleven <- readIORef winningElevenRef
  let updatedWinningEleven = map (\(player, isPlaying) -> if number player == oldNumber then (findPlayer newNumber players, isPlaying) else (player, isPlaying)) winningEleven
  writeIORef winningElevenRef updatedWinningEleven

findPlayer :: Int -> [Player] -> Player
findPlayer n players = fromMaybe (Player "Jogador não encontrado" n "" []) (find (\p -> number p == n) players)
