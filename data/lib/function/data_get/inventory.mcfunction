#> lib:data_get/selected_item
# @api

function oh_my_dat:please

execute store success score $NotLatestData _ run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DataCache.Inventory.Time set from storage lib: global.Time
execute if score $NotLatestData _ matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DataCache.Inventory.Value set from entity @s Inventory

data modify storage api: Inventory set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DataCache.Inventory.Value
