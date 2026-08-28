#kill hp_bar
execute as @e[tag=hp_bar,tag=hp_bar_ride] store success score @s hp_bar_kill run ride @s mount @e[tag=hp_bar_test,limit=1]
kill @e[scores={hp_bar_kill=1},tag=hp_bar,tag=hp_bar_ride]
execute as @e[tag=hp_bar,tag=hp_bar_ride] store success score @s hp_bar_kill run execute on vehicle if data entity @s {Health:0f}
kill @e[scores={hp_bar_kill=1},tag=hp_bar,tag=hp_bar_ride]

execute as @e[tag=hp_bar_owner] run function hp_bar:tick
