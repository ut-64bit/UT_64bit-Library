#> lib:data_get/selected_item
# @api

function oh_my_dat:please

execute store success score $NotLatestData _ run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DataCache.SelectedItem.Time set from storage lib: global.Time
execute if score $NotLatestData _ matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DataCache.SelectedItem.Value set from entity @s SelectedItem

data modify storage lib: SelectedItem set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DataCache.SelectedItem.Value
