# 1. 스코어 가져오기
execute store result score #abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_abs
execute store result score #max_abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_max_abs

# 흡수량이 0이거나 max_abs가 0이면 hide_abs 호출 후 즉시 종료!
execute if score #abs hp_bar_temp matches 0 run return run function hp_bar:hide_abs
execute if score #max_abs hp_bar_temp matches 0 run return run function hp_bar:hide_abs

# 2. Ratio 연산 (abs * 10000 / max_abs)
scoreboard players operation #abs hp_bar_temp *= #10000 hp_bar_Constant
scoreboard players operation #abs hp_bar_temp /= #max_abs hp_bar_temp

# 3. Scale X 연산
scoreboard players operation #temp_s hp_bar_temp = #abs hp_bar_temp
scoreboard players operation #temp_s hp_bar_temp *= #20 hp_bar_Constant

# 4. Trans X 연산
scoreboard players operation #temp_t hp_bar_temp = #abs hp_bar_temp
scoreboard players operation #temp_t hp_bar_temp -= #13000 hp_bar_Constant

# 5. Storage 대입
execute store result storage hp_bar:data AbsScale float 0.0001 run scoreboard players get #temp_s hp_bar_temp
execute store result storage hp_bar:data AbsTransX float 0.0001 run scoreboard players get #temp_t hp_bar_temp

# 6. 매크로 실행
function hp_bar:update_abs with storage hp_bar:data