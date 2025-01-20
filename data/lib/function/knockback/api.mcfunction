#> lib:knockback/api
#
# @context LivingEntity
#
# @input storage lib.temp:knockback input
#	power[]: float
#
# @api

# 入力が正しくないなら失敗
execute unless data storage lib.temp:knockback input.power run return fail
execute if data storage lib.temp:knockback input.power[2] run return fail

# 横方向のノックバックがない場合
execute if function lib:knockback/core/check_horizon run return run function lib:knockback/core/only_vertical

# 横方向のノックバックがある場合
function lib:knockback/core/main

# あとしまつ
# data remove storage lib.temp:knockback input