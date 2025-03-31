#> lib:get_vector/main
# @within function lib:get_vector/

# ベクトルを取得
data modify storage lib.temp:get_vector output.vector set from entity @s Pos

# あとしまつ
kill @s