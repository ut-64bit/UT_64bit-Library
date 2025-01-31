#> lib:tick
# @handles #minecraft:tick

execute store result storage lib: global.Time int 1 run time query gametime

execute as @a run function lib:player_tick