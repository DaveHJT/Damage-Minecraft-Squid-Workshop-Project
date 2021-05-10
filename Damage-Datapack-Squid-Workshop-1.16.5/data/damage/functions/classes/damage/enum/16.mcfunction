effect give @s minecraft:instant_health 1 1 true
effect give @s minecraft:instant_damage 1 2 true


scoreboard players remove @s damage 16
scoreboard players operation @s damage_buffer = delay damage_buffer 