#> lib:knockback/core/only_vertical
# @within function lib:knockback/api

# ベクトルを取得
scoreboard players set $x hb.Motion 0
execute store result score $y hb.Motion run data get storage lib.temp:knockback input.power[1] 100
scoreboard players set $x hb.Motion 0

# ノックバック耐性を計算
execute store result score #KB.Resistance _ run attribute @s knockback_resistance get -100
execute unless score #KB.Resistance _ matches ..0 run scoreboard players set #KB.Resistance _ 0
scoreboard players operation #KB.Resistance _ < $100 const
scoreboard players operation #KB.Resistance _ += $100 const
scoreboard players operation $y hb.Motion *= #KB.Resistance _

# 空中にいるなら上方向のぱわーを消す
execute unless predicate lib:flag/on_ground unless score $y hb.Motion matches ..0 run scoreboard players set $y hb.Motion 0

# ノックバック付与！
execute if entity @s[type=!player] run function lib:knockback/core/entity
execute if entity @s[type=player] run function #p_motion:xyz

# あとしまつ
scoreboard players reset #KB.Resistance _
scoreboard players reset $x hb.Motion
scoreboard players reset $y hb.Motion
scoreboard players reset $z hb.Motion