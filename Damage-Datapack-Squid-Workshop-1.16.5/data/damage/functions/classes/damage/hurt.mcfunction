
# deal major damage
execute as @s[scores={damage=96..,damage_buffer=0}] run function damage:classes/damage/enum/96
execute as @s[scores={damage=48..,damage_buffer=0}] run function damage:classes/damage/enum/48
execute as @s[scores={damage=32..,damage_buffer=0}] run function damage:classes/damage/enum/32
execute as @s[scores={damage=24..,damage_buffer=0}] run function damage:classes/damage/enum/24
execute as @s[scores={damage=20..,damage_buffer=0}] run function damage:classes/damage/enum/20
execute as @s[scores={damage=16..,damage_buffer=0}] run function damage:classes/damage/enum/16
execute as @s[scores={damage=12..,damage_buffer=0}] run function damage:classes/damage/enum/12
execute as @s[scores={damage=8..,damage_buffer=0}] run function damage:classes/damage/enum/8
execute as @s[scores={damage=6..,damage_buffer=0}] run function damage:classes/damage/enum/6
execute as @s[scores={damage=4..,damage_buffer=0}] run function damage:classes/damage/enum/4
execute as @s[scores={damage=2..,damage_buffer=0}] run function damage:classes/damage/enum/2

# if damage >= 2 deal damage until damage <= 1
# execute if entity @s[scores={damage=2..}] run function damage:classes/damage/hurt_until_damage1

# if damage = 1 give 1 damage poison
execute if entity @s[scores={damage=1,damage_buffer=0}] run function damage:classes/damage/damage1_poison

# clean up death tag
function damage:classes/damage/remove_death_tag


tag @s add damaged