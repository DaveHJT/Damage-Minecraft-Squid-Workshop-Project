effect give @s minecraft:instant_damage 1 1 true

scoreboard players remove @s damage 12
scoreboard players operation @s damage_buffer = delay damage_buffer 