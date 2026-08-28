# scoreboard 생성
scoreboard objectives add hp_bar_old_max_hp dummy
scoreboard objectives add hp_bar_abs dummy
scoreboard objectives add hp_bar_old_max_abs dummy
scoreboard objectives add hp_bar_max_abs dummy
scoreboard objectives add hp_bar_hp_ratio dummy
scoreboard objectives add hp_bar_Constant dummy
scoreboard objectives add hp_bar_temp dummy
scoreboard objectives add hp_bar_old_abs dummy
scoreboard objectives add hp_bar_max_hp dummy
scoreboard objectives add hp_bar_hp dummy
scoreboard objectives add hp_bar_kill dummy
scoreboard objectives add hp_bar_old_hp dummy

#Constant 스코어 초기화
scoreboard players set #10000 hp_bar_Constant 10000
scoreboard players set #20 hp_bar_Constant 20
scoreboard players set #13000 hp_bar_Constant 13000

#test 소환
execute unless entity @e[tag=hp_bar_test] run summon armor_stand ~ ~ ~ {Tags:["hp_bar_test"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b,Small:1b}

#forceload
forceload add ~ ~
