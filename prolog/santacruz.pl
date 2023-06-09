%! Definindo o predicado winning_eleven como dinâmico, assim permitindo com que termos possam ser adicionados e removidos.
:- dynamic(winning_eleven/1).

print('Hello World!\n').

%! Adicionando os jogadores.
player(michael).
player(leo_fernandes).
player(italo_melo).
player(guedes).
player(pingo).
player(marcus_vinicius).
player(lucas_silva).
player(fabricio).
player(pipico).
player(chiquinho).
player(nadson).
player(geaze).
player(jadson).
player(yan_oliveira).
player(anderson_paulista).
player(mateus_muller).
player(italo_henrique).
player(emerson_galego).
player(ben_10).
player(marcelinho).
player(italo_silva).
player(maranhao).
player(dayvid).

%! Numerando os jogadores.
number(1, michael).
number(2, leo_fernandes).
number(3, italo_melo).
number(4, guedes).
number(5, pingo).
number(6, marcus_vinicius).
number(7, lucas_silva).
number(8, fabricio).
number(9, pipico).
number(10, chiquinho).
number(11, nadson).
number(12, geaze).
number(13, jadson).
number(14, yan_oliveira).
number(15, anderson_paulista).
number(16, mateus_muller).
number(17, italo_henrique).
number(18, emerson_galego).
number(19, ben_10).
number(20, marcelinho).
number(21, italo_silva).
number(22, maranhao).
number(23, dayvid).

%!Atribuindo os jogadores as suas respectivas posições.
goalkeeper(1).
goalkeeper(12).

center-back(3).
center-back(4).
center-back(14).

right-back(2).
right-back(13).

left-back(6).
left-back(16).
left-back(21).

center_midfielder(17).

defensive_midfielder(5).
defensive_midfielder(8).
defensive_midfielder(15).

attacking_midfielder(11).
attacking_midfielder(23).

right_winger(22).

left_winger(7).
left_winger(10).
left_winger(18).

center_forward(9).
center_forward(19).
center_forward(20).

position(1, goalkeeper).
position(2, right-back).
position(3, center-back).
position(4, center-back).
position(5, defensive_midfielder).
position(6, left-back).
position(7, left_winger).
position(8, defensive_midfielder).
position(9, center_forward).
position(10, left_winger).
position(11, attacking_midfielder).
position(12, goalkeeper).
position(13, right-back).
position(14, center-back).
position(15, defensive_midfielder).
position(16, left-back).
position(17, center_midfielder).
position(18, left_winger).
position(19, center_forward).
position(20, center_forward).
position(21, left-back).
position(22, right_winger).
position(23, attacking_midfielder).





%! Montando o time titular que jogou contra o Campinense.
winning_eleven(1).
winning_eleven(2).
winning_eleven(3).
winning_eleven(4).
winning_eleven(6).
winning_eleven(5).
winning_eleven(8).
winning_eleven(10).
winning_eleven(7).
winning_eleven(11).
winning_eleven(9).
