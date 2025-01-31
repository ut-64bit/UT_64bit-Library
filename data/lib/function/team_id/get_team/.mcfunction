#> lib:player_id/get_team/
#
# 特定のTeamIDを持つエンティティを取得する
#
# @api


# 既存の_teamタグを外す
tag @e[tag=_team] remove _team

# 一時スコアにTeamIDを保存する
scoreboard players operation $SearchID _ = @s TeamID

execute as @e[scores={TeamID=-2147483648..2147483647}] run function lib:team_id/get_team/main

# あとしまつ
scoreboard players reset $SearchID _
