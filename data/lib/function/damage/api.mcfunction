#> lib:damage/api
#
# @context LivingEntity
#
# @input storage lib.temp:damage input
#	value: float
#	attacker: target_entity
#
#	knockback[]: float
#
#	option.shield_break: float
#	option.armor_piercing: float
#
# @api

# 何も入力されてないなら即終了
execute unless data storage lib.temp:damage input.value run return fail

# 実行者が無敵なら失敗
execute if entity @s[tag=Uninterferable] run return fail
execute if entity @s[tag=PlayerShouldInvulnerable] run return fail

# 実行する
function lib:damage/core/main

# あとしまつ
# data remove storage lib.temp:damage input