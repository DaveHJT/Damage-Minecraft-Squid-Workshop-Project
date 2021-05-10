effect give @s minecraft:instant_damage 1 4 true

scoreboard players remove @s damage 96
scoreboard players operation @s damage_buffer = delay damage_buffer 