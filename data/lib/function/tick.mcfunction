#> lib:tick
# @within tags/function #minecraft:tick

# ゲーム内時間を取得する
	execute store result storage lib: WorldTime int 1 store result score $WorldTime lib run time query gametime

# プレイヤーのtick
	execute as @a run function lib:player_tick
