effect give @s minecraft:instant_health 1 1 true
effect give @s minecraft:instant_damage 1 2 true

# move the damage to damage buffer, and record the time that damage will be dealt in damage_timer
scoreboard players remove @s damage 16
scoreboard players add @s damage_buffer 16
scoreboard players operation @s damage_timer = delay damage_timer 