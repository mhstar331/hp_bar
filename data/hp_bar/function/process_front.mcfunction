# 1. 비율에 따른 크기와 위치를 계산해 Storage에 대입
execute on vehicle store result storage hp_bar:data Scale float 0.0001 run compute entity @s integer {type:"div",left:{type:"mul",inputs:[{type:"score",target:"target_entity",score:"hp_bar_hp",fallback:0},200000]},right:{type:"score",target:"target_entity",score:"hp_bar_max_hp",fallback:1}}
execute on vehicle store result storage hp_bar:data TransX float 0.0001 run compute entity @s integer {type:"sub",left:{type:"div",left:{type:"mul",inputs:[{type:"score",target:"target_entity",score:"hp_bar_hp",fallback:0},10000]},right:{type:"score",target:"target_entity",score:"hp_bar_max_hp",fallback:1}},right:13000}

# 6. 자기 자신(@s)에게만 매크로 적용!
function hp_bar:update_front with storage hp_bar:data