# scoreboard 생성
scoreboard objectives add hp_bar_old_max_hp dummy
scoreboard objectives add hp_bar_abs dummy
scoreboard objectives add hp_bar_old_max_abs dummy
scoreboard objectives add hp_bar_max_abs dummy
scoreboard objectives add hp_bar_temp dummy
scoreboard objectives add hp_bar_old_abs dummy
scoreboard objectives add hp_bar_max_hp dummy
scoreboard objectives add hp_bar_hp dummy
scoreboard objectives add hp_bar_kill dummy
scoreboard objectives add hp_bar_old_hp dummy

#test 소환
execute unless entity @e[type=armor_stand,tag=hp_bar_test] run summon armor_stand ~ ~ ~ {Tags:["hp_bar_test"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b,Small:1b}

#forceload
forceload add ~ ~
