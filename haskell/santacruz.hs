import Control.Monad (when)
import Data.List (find)
import Data.Maybe (fromMaybe)
import Data.List (intercalate)

data Player = Player
  { name :: String,
    number :: Int,
    position :: String,
    additionalPositions :: [String]
  }

playerInfo :: [Player] -> Int -> IO ()
playerInfo players n = do
  let player = fromMaybe (head players) (find (\p -> number p == n) players)
  putStrLn $ "Número: " ++ show (number player)
  putStrLn $ "Nome: " ++ name player
  putStrLn $ "Posição principal: " ++ position player
  putStrLn $ "Posições secundárias: " ++ intercalate ", " (additionalPositions player)

showTeam :: [Player] -> IO ()
showTeam winningEleven =
  mapM_ (\player -> putStrLn $ show (number player) ++ ". " ++ name player) winningEleven

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

  let winningEleven =
        [ players !! 0,
          players !! 1,
          players !! 2,
          players !! 3,
          players !! 5,
          players !! 4,
          players !! 7,
          players !! 9,
          players !! 6,
          players !! 10,
          players !! 8
        ]

  putStrLn "Titulares:"
  showTeam winningEleven

  putStrLn ""

  let loop = do
        putStrLn "1 - Substituição"
        putStrLn "2 - Informações de jogador"
        putStrLn "3 - Mostrar o time"
        putStrLn "4 - Fechar o programa"

        opt <- readLn

        case opt of
          1 -> do
            putStrLn "Altere a lista winningEleven no código-fonte"
            putStrLn ""

            loop

          2 -> do
            putStrLn "Insira o número do jogador"
            n <- readLn

            putStrLn ""

            playerInfo players n

            putStrLn ""

            loop

          3 -> do
            putStrLn ""

            showTeam winningEleven

            putStrLn ""

            loop

          4 -> do
            putStrLn ""

            putStrLn "Encerrando..."

          _ -> loop

  loop

