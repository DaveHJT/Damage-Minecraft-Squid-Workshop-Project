effect give @s minecraft:poison 1 1
tag @s add poison_buffer
scoreboard players remove @s damage 1

execute if entity @s[scores={health=1}] run function damage:classes/damage/kill