effect give @s minecraft:instant_damage 1 2 true

scoreboard players remove @s damage 24
scoreboard players operation @s damage_buffer = delay damage_buffer 