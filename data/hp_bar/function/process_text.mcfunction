# 1. 몬스터 스코어 가져오기
execute on vehicle store result score #hp hp_bar_temp run scoreboard players get @s hp_bar_hp
execute on vehicle store result score #max_hp hp_bar_temp run scoreboard players get @s hp_bar_max_hp
execute on vehicle store result score #abs hp_bar_temp run scoreboard players get @s hp_bar_abs

# 2. 총 체력을 계산해 Storage에 대입
execute on vehicle store result storage hp_bar:data TextTotalHP int 1 run compute entity @s integer {type:"add",inputs:[{type:"score",target:"target_entity",score:"hp_bar_hp",fallback:0},{type:"score",target:"target_entity",score:"hp_bar_abs",fallback:0}]}
execute store result storage hp_bar:data TextMaxHP int 1 run scoreboard players get #max_hp hp_bar_temp
execute store result storage hp_bar:data TextAbs int 1 run scoreboard players get #abs hp_bar_temp

# 3. 흡수량(abs)이 0일 때와 1 이상일 때 분기 실행
execute if score #abs hp_bar_temp matches 0 run function hp_bar:update_text with storage hp_bar:data
execute if score #abs hp_bar_temp matches 1.. run function hp_bar:update_text_abs with storage hp_bar:data
