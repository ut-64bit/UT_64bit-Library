#> lib:random_rotate/
# @api

execute store result storage lib: rand_rot.x_rot int 1 run random value 0..360
execute store result storage lib: rand_rot.y_rot int 1 run random value -90..90

function lib:random_rotate/macro with storage lib: rand_rot

data remove storage lib: rand_rot

return 1