#> lib:knockback/core/main
# @within function lib:knockback/api

# ベクトルを取得
function lib:get_vector/
execute store result score $x hb.Motion run data get storage lib.temp:get_vector output.vector[0] 100
execute store result score $y hb.Motion run data get storage lib.temp:knockback input.power[1] 100
execute store result score $z hb.Motion run data get storage lib.temp:get_vector output.vector[2] 100

# ノックバック耐性を計算
execute store result score #KB.Resistance _ run attribute @s knockback_resistance get -100
execute unless score #KB.Resistance _ matches ..0 run scoreboard players set #KB.Resistance _ 0
scoreboard players operation #KB.Resistance _ < $100 const
scoreboard players operation #KB.Resistance _ += $100 const
scoreboard players operation $x hb.Motion *= #KB.Resistance _
scoreboard players operation $y hb.Motion *= #KB.Resistance _
scoreboard players operation $z hb.Motion *= #KB.Resistance _

# 水平方向のぱわー
execute store result score #h_power _ run data get storage lib.temp:knockback input.power[0] 10000
scoreboard players operation $x hb.Motion *= #h_power _
scoreboard players operation $z hb.Motion *= #h_power _

# 整える
scoreboard players operation $x hb.Motion /= $10000 const
scoreboard players operation $z hb.Motion /= $10000 const

# 空中にいるなら上方向のぱわーを消す
execute unless predicate lib:flag/on_ground if score $y hb.Motion matches 0.. run scoreboard players set $y hb.Motion 0

# ノックバック付与！
execute if entity @s[type=!player] run function lib:knockback/core/entity
execute if entity @s[type=player] run function #p_motion:xyz

# あとしまつ
data remove storage lib.temp:get_vector output
scoreboard players reset #KB.Resistance _
scoreboard players reset #h_power _
scoreboard players reset $x hb.Motion
scoreboard players reset $y hb.Motion
scoreboard players reset $z hb.Motion