# deal 1 damage
effect give @s minecraft:absorption 1 0
effect give @s minecraft:instant_damage 1 0

scoreboard players remove @s damage 2

execute if entity @s[scores={damage=2..}] run function damage:classes/damage/hurt_until_damage1