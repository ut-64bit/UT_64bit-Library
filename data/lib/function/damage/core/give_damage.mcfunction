#> lib:damage/core/give_damage
# @within function lib:damage/core/main

# 盾受けするかチェック
advancement revoke @s only lib:handler/damage_blocked

# 攻撃する人がいる場合
$execute unless data storage lib.temp:damage input.attacker run return run \
	damage @s $(value) lib:normal/ by @n[tag=lib.__temp__.damage.attacker, distance=..128]

# いなかった場合
$damage @s $(value) lib:normal/
