#> lib:team_id/get_team/main
# @within function lib:team_id/get_team/

# 同じTeamIDを持つエンティティに_teamタグを付与する
scoreboard players operation @s TeamID -= $SearchID _
tag @s[scores={TeamID=0}] add _team
scoreboard players operation @s TeamID += $SearchID _
