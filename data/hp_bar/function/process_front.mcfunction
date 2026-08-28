# 1. 탑승 중인 몬스터(Vehicle)의 hp, max_hp를 가져와 체력바 비율 계산
execute store result score #hp hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_hp
execute store result score #max hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_max_hp

# 2. Ratio 연산 (hp * 10000 / max_hp)
scoreboard players operation #hp hp_bar_temp *= #10000 hp_bar_Constant
scoreboard players operation #hp hp_bar_temp /= #max hp_bar_temp

# 3. Scale X 연산 (S = Ratio * 20 / 10000)
scoreboard players operation #temp_s hp_bar_temp = #hp hp_bar_temp
scoreboard players operation #temp_s hp_bar_temp *= #20 hp_bar_Constant

# 4. Trans X 연산 (T = Ratio - 13000 / 10000)
scoreboard players operation #temp_t hp_bar_temp = #hp hp_bar_temp
scoreboard players operation #temp_t hp_bar_temp -= #13000 hp_bar_Constant

# 5. 계산된 수치를 Storage에 대입
execute store result storage hp_bar:data Scale float 0.0001 run scoreboard players get #temp_s hp_bar_temp
execute store result storage hp_bar:data TransX float 0.0001 run scoreboard players get #temp_t hp_bar_temp

# 6. 자기 자신(@s)에게만 매크로 적용!
function hp_bar:update_front with storage hp_bar:data