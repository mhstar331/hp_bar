# 1. 몬스터 스코어 가져오기
execute store result score #hp hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_hp
execute store result score #max_hp hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_max_hp
execute store result score #abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_abs

# 2. 총 체력 연산 (#total_hp = hp + abs)
scoreboard players operation #total_hp hp_bar_temp = #hp hp_bar_temp
scoreboard players operation #total_hp hp_bar_temp += #abs hp_bar_temp

# 3. Storage에 연산 결과 대입
execute store result storage hp_bar:data TextTotalHP int 1 run scoreboard players get #total_hp hp_bar_temp
execute store result storage hp_bar:data TextMaxHP int 1 run scoreboard players get #max_hp hp_bar_temp
execute store result storage hp_bar:data TextAbs int 1 run scoreboard players get #abs hp_bar_temp

# 3. 흡수량(abs)이 0일 때와 1 이상일 때 분기 실행
execute if score #abs hp_bar_temp matches 0 run function hp_bar:update_text with storage hp_bar:data
execute if score #abs hp_bar_temp matches 1.. run function hp_bar:update_text_abs with storage hp_bar:data
