#> oh_my_dat:sys/gc
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

### ガベージコレクタ

# 前回存在を確認したIDを移動させる
data modify storage oh_my_dat: id append from storage oh_my_dat: id[0]
data remove storage oh_my_dat: id[0]

# 割り当て済みID[0]以下の最大値を取得(_ IDに入る)
execute store result score #temp OhMyDat run data get storage oh_my_dat: id[0]
scoreboard players remove #temp OhMyDat 2147483647
scoreboard players set #temp OhMyDatID 0
scoreboard players operation * OhMyDatID -= #temp OhMyDat
scoreboard players operation #temp OhMyDatID > * OhMyDatID
scoreboard players operation * OhMyDatID += #temp OhMyDat

# 不要なデータを解放(先頭から続く基準より大きいIDは全部要らない)
scoreboard players operation #temp OhMyDat >< #temp OhMyDatID
execute store result score #temp OhMyDatID run data get storage oh_my_dat: id[0]
execute if score #temp OhMyDatID > #temp OhMyDat run function oh_my_dat:sys/gc_loop
scoreboard players operation #temp OhMyDat >< #temp OhMyDatID

# loop while x - next >= 2(prev - x) - 1 (⇔ 3x - 2prev - next + 1 >= 0)
# 2prev
execute store result score #temp OhMyDat run data get storage oh_my_dat: id[-1]
execute if score #temp OhMyDat matches 0 run scoreboard players add #temp OhMyDat 65536
execute if score #temp OhMyDatID matches 0 run scoreboard players add #temp OhMyDat 65536
execute if score #temp OhMyDatID matches 0 run scoreboard players add #temp OhMyDatID 65536
scoreboard players operation #temp OhMyDat += #temp OhMyDat
# 2prev - 2x
scoreboard players operation #temp OhMyDat -= #temp OhMyDatID
scoreboard players operation #temp OhMyDat -= #temp OhMyDatID
# 3x - 2prev
scoreboard players operation #temp OhMyDatID -= #temp OhMyDat
# 3x - 2prev - next
execute store result score #temp OhMyDat run data get storage oh_my_dat: id[1]
scoreboard players operation #temp OhMyDatID -= #temp OhMyDat
execute if score #temp OhMyDatID matches -1.. run function oh_my_dat:sys/gc
