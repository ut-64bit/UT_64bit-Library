#> lib:knockback/core/check_horizon
# @within function lib:knockback/api

execute unless data storage lib.temp:knockback input.power[1] run return 1

execute store result score #check_horizon.power _ run data get storage lib.temp:knockback input.power[0] 10000
execute if score #check_horizon.power _ matches 0 run scoreboard players reset #check_horizon.power _
execute unless score #check_horizon.power _ matches -2147483648..2147483647 run return 1

scoreboard players reset #check_horizon.power _
return fail
