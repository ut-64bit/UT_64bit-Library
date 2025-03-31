#> lib:player_tick
#
# プレイヤーのティック
#
# @within function lib:tick

# スペクテイター、クリエイティブモードのプレイヤーにタグを付与する
	execute if entity @s[tag=!PlayerShouldInvulnerable,gamemode=!adventure,gamemode=!survival] run tag @s add PlayerShouldInvulnerable
	execute if entity @s[tag=PlayerShouldInvulnerable,gamemode=!spectator,gamemode=!creative] run tag @s remove PlayerShouldInvulnerable

# 入力時間
	execute if entity @s[scores={InputTime.Sprint=..-1}] run scoreboard players set @s InputTime.Sprint 0
	execute if entity @s[predicate=lib:input/sprint] run scoreboard players add @s InputTime.Sprint 1
	execute if entity @s[predicate=!lib:input/sprint,scores={InputTime.Sprint=1..}] run scoreboard players operation @s InputTime.Sprint *= $-1 const

# PlayerID割当
	execute unless score @s PlayerID matches -2147483648..2147483647 run function lib:player_id/init
	execute if score @s PlayerID matches 0 run function lib:player_id/init
