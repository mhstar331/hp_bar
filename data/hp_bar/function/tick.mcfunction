#ride
execute as @s[tag=!hp_bar_ride] at @s run function hp_bar:ride

execute store result score @s hp_bar_hp run data get entity @s Health
execute store result score @s hp_bar_max_hp run attribute @s minecraft:max_health get
execute store result score @s hp_bar_abs run data get entity @s AbsorptionAmount

# max_abs
execute if score @s hp_bar_abs matches 0 run scoreboard players set @s hp_bar_max_abs 0
execute if score @s hp_bar_abs > @s hp_bar_max_abs run scoreboard players operation @s hp_bar_max_abs = @s hp_bar_abs

execute unless score @s hp_bar_hp = @s hp_bar_old_hp run execute on passengers if entity @s[tag=hp_bar_front] run function hp_bar:process_front
execute unless score @s hp_bar_max_hp = @s hp_bar_old_max_hp run execute on passengers if entity @s[tag=hp_bar_front] run function hp_bar:process_front

scoreboard players operation #sum_abs hp_bar_temp = @s hp_bar_abs
scoreboard players operation #sum_abs hp_bar_temp += @s hp_bar_old_abs

execute unless score @s hp_bar_abs = @s hp_bar_old_abs if score #sum_abs hp_bar_temp matches 1.. run execute on passengers if entity @s[tag=hp_bar_abs] run function hp_bar:process_abs
execute unless score @s hp_bar_max_abs = @s hp_bar_old_max_abs if score #sum_abs hp_bar_temp matches 1.. run execute on passengers if entity @s[tag=hp_bar_abs] run function hp_bar:process_abs

execute unless score @s hp_bar_hp = @s hp_bar_old_hp run execute on passengers if entity @s[tag=hp_bar_text] run function hp_bar:process_text
execute unless score @s hp_bar_max_hp = @s hp_bar_old_max_hp run execute on passengers if entity @s[tag=hp_bar_text] run function hp_bar:process_text
execute unless score @s hp_bar_abs = @s hp_bar_old_abs run execute on passengers if entity @s[tag=hp_bar_text] run function hp_bar:process_text

scoreboard players operation @s hp_bar_old_hp = @s hp_bar_hp
scoreboard players operation @s hp_bar_old_max_hp = @s hp_bar_max_hp
scoreboard players operation @s hp_bar_old_abs = @s hp_bar_abs
scoreboard players operation @s hp_bar_old_max_abs = @s hp_bar_max_abs