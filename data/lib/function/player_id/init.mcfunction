#> lib:player_id/init
# @within advancement lib:set_player_id

scoreboard players add $Global PlayerID 1
scoreboard players operation @s PlayerID = $Global PlayerID
