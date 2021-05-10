effect give @s minecraft:instant_damage 1 0 true


# move the damage to damage buffer, and record the time that damage will be dealt in damage_timer
scoreboard players remove @s damage 6
scoreboard players add @s damage_buffer 6
scoreboard players operation @s damage_timer = delay damage_timer 