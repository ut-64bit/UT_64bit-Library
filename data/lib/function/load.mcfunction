#> lib:load
# @within tags/function #minecraft:load

# スコアボードの初期化
	function lib:scoreboard/register
	function lib:scoreboard/init

# シュル箱を設置する
	forceload add 100000 100000
	execute unless block 100001 -64 100000 shulker_box run setblock 100001 -64 100000 shulker_box
