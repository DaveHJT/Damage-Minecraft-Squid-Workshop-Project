effect give @s minecraft:instant_health 1 0 true
effect give @s minecraft:instant_damage 1 0 true


scoreboard players remove @s damage 2
scoreboard players operation @s damage_buffer = delay damage_buffer 