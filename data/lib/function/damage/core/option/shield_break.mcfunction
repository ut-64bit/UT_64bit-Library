#> lib:damage/core/option/shield_break
# @within function lib:damage/core/main

execute unless entity @s[advancements={lib:handler/damage_blocked=true}] run return fail

# 攻撃する人がいる場合
$execute unless data storage lib.temp:damage input.attacker run return run \
	damage @s $(shield_break) lib:normal/ by @n[tag=lib.__temp__.damage.attacker, distance=..128]

# いなかった場合
$damage @s $(shield_break) lib:normal/
