#> lib:damage/core/main
# @within function lib:damage/api

# 攻撃する人にtagを付与する
function lib:damage/core/get_attacker with storage lib.temp:damage input

# 攻撃
function lib:damage/core/give_damage with storage lib.temp:damage input

# ノックバックを与える
data modify storage lib.temp:knockback input.power set value [0.0,0.0]
data modify storage lib.temp:knockback input.power set from storage lib.temp:damage input.knockback
execute unless entity @s[advancements={lib:handler/damage_blocked=true}] \
	at @n[tag=lib.__temp__.damage.attacker, distance=..128] facing entity @s feet run function lib:knockback/api

# オプション
execute if data storage lib.temp:damage input.option.shield_break run function lib:damage/core/option/shield_break with storage lib.temp:damage input.option
execute if data storage lib.temp:damage input.option.armor_piercing run function lib:damage/core/option/armor_piercing with storage lib.temp:damage input.option

# あとしまつ
tag @n[tag=lib.__temp__.damage.attacker, distance=..128] remove lib.__temp__.damage.attacker