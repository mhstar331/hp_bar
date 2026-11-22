execute store result score #abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_abs
execute store result score #max_abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_max_abs
execute if score #abs hp_bar_temp matches 0 run return run function hp_bar:hide_abs
execute if score #max_abs hp_bar_temp matches 0 run return run function hp_bar:hide_abs
execute on vehicle store result storage hp_bar:data AbsScale float 0.0001 run compute entity @s integer {type:"div",left:{type:"mul",inputs:[{type:"score",target:"target_entity",score:"hp_bar_abs",fallback:0},200000]},right:{type:"score",target:"target_entity",score:"hp_bar_max_abs",fallback:1}}
execute on vehicle store result storage hp_bar:data AbsTransX float 0.0001 run compute entity @s integer {type:"sub",left:{type:"div",left:{type:"mul",inputs:[{type:"score",target:"target_entity",score:"hp_bar_abs",fallback:0},10000]},right:{type:"score",target:"target_entity",score:"hp_bar_max_abs",fallback:1}},right:13000}
function hp_bar:update_abs with storage hp_bar:data
