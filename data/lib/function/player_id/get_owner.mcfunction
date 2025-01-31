#> lib:player_id/get_owner
#
# 特定のPlayerIDを持つプレイヤーを取得する
#
# @input
#	as entity
#	score @s Argument.Threshold : int
# @output storage api: Return.IsThresholdOrMore: boolean
# @api


# 既存の_ownerタグを外す
tag @a[tag=_owner] remove _owner

# 一時スコアにPlayerIDを保存する
scoreboard players operation $SearchID _ = @s PlayerID

# 同じPlayerIDを持つプレイヤーに_ownerタグを付与する
scoreboard players operation @a PlayerID -= $SearchID _
tag @p[scores={PlayerID=0}] add _owner
scoreboard players operation @a PlayerID += $SearchID _

# あとしまつ
scoreboard players reset $SearchID _
