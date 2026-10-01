# 1. 스코어 가져오기
execute store result score #abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_abs
execute store result score #max_abs hp_bar_temp run execute on vehicle run scoreboard players get @s hp_bar_max_abs

# 흡수량이 0이거나 max_abs가 0이면 hide_abs 호출 후 즉시 종료!
execute if score #abs hp_bar_temp matches 0 run return run function hp_bar:hide_abs
execute if score #max_abs hp_bar_temp matches 0 run return run function hp_bar:hide_abs

# 2. 비율에 따른 크기와 위치를 계산해 Storage에 대입
execute on vehicle store result storage hp_bar:data AbsScale float 0.0001 run compute entity @s integer {type:"div",left:{type:"mul",inputs:[{type:"score",target:"target_entity",score:"hp_bar_abs",fallback:0},200000]},right:{type:"score",target:"target_entity",score:"hp_bar_max_abs",fallback:1}}
execute on vehicle store result storage hp_bar:data AbsTransX float 0.0001 run compute entity @s integer {type:"sub",left:{type:"div",left:{type:"mul",inputs:[{type:"score",target:"target_entity",score:"hp_bar_abs",fallback:0},10000]},right:{type:"score",target:"target_entity",score:"hp_bar_max_abs",fallback:1}},right:13000}

# 6. 매크로 실행
function hp_bar:update_abs with storage hp_bar:data
