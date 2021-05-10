effect give @s minecraft:instant_damage 1 1 true

# move the damage to damage buffer, and record the time that damage will be dealt in damage_timer
scoreboard players remove @s damage 12
scoreboard players add @s damage_buffer 12
scoreboard players operation @s damage_timer = delay damage_timer 