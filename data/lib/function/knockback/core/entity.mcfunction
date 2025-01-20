#> lib:knockback/core/entity
# @within function
#	lib:knockback/core/main
#	lib:knockback/core/only_vertical

# 初期化
data modify storage lib.temp:knockback temp.Motion set value [0d, 0d, 0d]
execute store result storage lib.temp:knockback temp.Motion[0] double 0.0001 run scoreboard players get $x hb.Motion
execute store result storage lib.temp:knockback temp.Motion[1] double 0.0001 run scoreboard players get $y hb.Motion
execute store result storage lib.temp:knockback temp.Motion[2] double 0.0001 run scoreboard players get $z hb.Motion

# ふっとべ！
data modify entity @s Motion set from storage lib.temp:knockback temp.Motion

# あとしまつ
data remove storage lib.temp:knockback temp.Motion