#> lib:player_id/get_team/
#
# 特定のTeamIDを持つエンティティを取得する
#
# @api


# 既存の_teamタグを外す
execute as @e[tag=_team] run tag @s remove _team

# 一時スコアにTeamIDを保存する
scoreboard players operation $SearchID _ = @s TeamID

# 100m以内の同じTeamIDを持つエンティティに一時タグ(_team)を付与する
execute as @e[distance=..100] if score @s TeamID = $SearchID _ run tag @s add _team

# あとしまつ
scoreboard players reset $SearchID _
