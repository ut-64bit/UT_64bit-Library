#> lib:player_id/search
# @api


tag @p[tag=_owner] remove _owner
scoreboard players operation #SearchID _ = @s PlayerID

scoreboard players operation @a PlayerID -= #SearchID _
tag @p[scores={PlayerID=0}] add _owner
scoreboard players operation @a PlayerID += #SearchID _

scoreboard players reset #SearchID _
