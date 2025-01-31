#> lib:player_tick
#
# プレイヤーのティック
#
# @within function lib:tick

# スペクテイター、クリエイティブモードのプレイヤーにタグを付与する
tag @s[tag=!PlayerShouldInvulnerable,gamemode=!adventure,gamemode=!survival] add PlayerShouldInvulnerable
tag @s[tag=PlayerShouldInvulnerable,gamemode=!spectator,gamemode=!creative] remove PlayerShouldInvulnerable
