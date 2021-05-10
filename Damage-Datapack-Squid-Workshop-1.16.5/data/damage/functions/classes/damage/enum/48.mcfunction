effect give @s minecraft:instant_damage 1 3 true

scoreboard players remove @s damage 48
scoreboard players operation @s damage_buffer = delay damage_buffer 