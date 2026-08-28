# 1. ride 처리 (탑승)
execute as @s[tag=!hp_bar_ride] at @s run function hp_bar:ride

# 2. 실시간 NBT/Attribute 스코어 가져오기
execute store result score @s hp_bar_hp run data get entity @s Health
execute store result score @s hp_bar_max_hp run attribute @s minecraft:max_health get
execute store result score @s hp_bar_abs run data get entity @s AbsorptionAmount

# 3. max_abs (최대 흡수량) 갱신
execute if score @s hp_bar_abs matches 0 run scoreboard players set @s hp_bar_max_abs 0
execute if score @s hp_bar_abs > @s hp_bar_max_abs run scoreboard players operation @s hp_bar_max_abs = @s hp_bar_abs


# ===================================================
# --- [ 레이어별 독립 실행 분기 (바닐라 전용) ] ---
# ===================================================

# [A] 체력(HP)이 바뀐 경우에만 -> 초록색 바(process_front) 실행
execute unless score @s hp_bar_hp = @s hp_bar_old_hp run execute on passengers if entity @s[tag=hp_bar_front] run function hp_bar:process_front
execute unless score @s hp_bar_max_hp = @s hp_bar_old_max_hp run execute on passengers if entity @s[tag=hp_bar_front] run function hp_bar:process_front


# [B] 흡수량(ABS)이 바뀐 경우에만 -> 노란색 바(process_abs) 실행
# 잔상 방지용 sum 연산 (#sum_abs = 현재 abs + 이전 abs)
scoreboard players operation #sum_abs hp_bar_temp = @s hp_bar_abs
scoreboard players operation #sum_abs hp_bar_temp += @s hp_bar_old_abs

# abs나 max_abs 중 하나라도 이전과 다를 때만 실행
execute unless score @s hp_bar_abs = @s hp_bar_old_abs if score #sum_abs hp_bar_temp matches 1.. run execute on passengers if entity @s[tag=hp_bar_abs] run function hp_bar:process_abs
execute unless score @s hp_bar_max_abs = @s hp_bar_old_max_abs if score #sum_abs hp_bar_temp matches 1.. run execute on passengers if entity @s[tag=hp_bar_abs] run function hp_bar:process_abs


# [C] 셋 중 하나라도 바뀐 경우 -> 텍스트(process_text) 실행
# (바뀐 게 있으면 텍스트 업데이트)
execute unless score @s hp_bar_hp = @s hp_bar_old_hp run execute on passengers if entity @s[tag=hp_bar_text] run function hp_bar:process_text
execute unless score @s hp_bar_max_hp = @s hp_bar_old_max_hp run execute on passengers if entity @s[tag=hp_bar_text] run function hp_bar:process_text
execute unless score @s hp_bar_abs = @s hp_bar_old_abs run execute on passengers if entity @s[tag=hp_bar_text] run function hp_bar:process_text


# ===================================================
# 4. old 스코어 갱신 (마지막에 딱 1번 실행)
# ===================================================
scoreboard players operation @s hp_bar_old_hp = @s hp_bar_hp
scoreboard players operation @s hp_bar_old_max_hp = @s hp_bar_max_hp
scoreboard players operation @s hp_bar_old_abs = @s hp_bar_abs
scoreboard players operation @s hp_bar_old_max_abs = @s hp_bar_max_abs