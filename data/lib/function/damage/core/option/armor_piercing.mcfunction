#> lib:damage/core/option/armor_piercing
# @within function lib:damage/core/main

# 攻撃する人がいる場合
$execute unless data storage lib.temp:damage input.attacker run return run \
	damage @s $(armor_piercing) lib:normal/armor_piercing by @n[tag=lib.__temp__.damage.attacker, distance=..128]

# いなかった場合
$damage @s $(armor_piercing) lib:normal/armor_piercing