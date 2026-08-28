summon text_display ~ ~ ~ {Tags:["hp_bar","hp_bar_back"],billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-.3f,.2f,0f],scale:[20f,1f,1f]},background:-65536,text:" "}
summon text_display ~ ~ ~ {Tags:["hp_bar","hp_bar_front"],billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-.3f,.2f,.0001f],scale:[20f,1f,1f]},background:-14888704,text:" "}
summon text_display ~ ~ ~ {Tags:["hp_bar","hp_bar_abs"],billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[.7f,.2f,.00011f],scale:[0f,1f,1f]},background:-256,text:" "}
summon text_display ~ ~ ~ {Tags:["hp_bar","hp_bar_text"],billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,.2f,.00012f],scale:[1f,1f,1f]},text:" ",background:0,shadow:true}
ride @e[tag=hp_bar_back,tag=!hp_bar_ride,limit=1,sort=nearest] mount @s
ride @e[tag=hp_bar_front,tag=!hp_bar_ride,limit=1,sort=nearest] mount @s
ride @e[tag=hp_bar_abs,tag=!hp_bar_ride,limit=1,sort=nearest] mount @s
ride @e[tag=hp_bar_text,tag=!hp_bar_ride,limit=1,sort=nearest] mount @s
tag @s add hp_bar_ride
execute on passengers run tag @s add hp_bar_ride
