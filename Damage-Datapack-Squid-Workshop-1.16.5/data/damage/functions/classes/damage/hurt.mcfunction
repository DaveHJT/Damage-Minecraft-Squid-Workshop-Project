
# deal major damage
execute as @s[scores={damage_timer=0,damage=96..}] run function damage:classes/damage/enum/96
execute as @s[scores={damage_timer=0,damage=48..}] run function damage:classes/damage/enum/48
execute as @s[scores={damage_timer=0,damage=32..}] run function damage:classes/damage/enum/32
execute as @s[scores={damage_timer=0,damage=24..}] run function damage:classes/damage/enum/24
execute as @s[scores={damage_timer=0,damage=20..}] run function damage:classes/damage/enum/20
execute as @s[scores={damage_timer=0,damage=16..}] run function damage:classes/damage/enum/16
execute as @s[scores={damage_timer=0,damage=12..}] run function damage:classes/damage/enum/12
execute as @s[scores={damage_timer=0,damage=8..}] run function damage:classes/damage/enum/8
execute as @s[scores={damage_timer=0,damage=6..}] run function damage:classes/damage/enum/6
execute as @s[scores={damage_timer=0,damage=4..}] run function damage:classes/damage/enum/4
execute as @s[scores={damage_timer=0,damage=2..}] run function damage:classes/damage/enum/2

# if damage >= 2 deal damage until damage <= 1
# execute if entity @s[scores={damage=2..}] run function damage:classes/damage/hurt_until_damage1

# if damage = 1 give 1 damage poison
execute if entity @s[scores={damage_timer=0,damage=1}] run function damage:classes/damage/damage1_poison

# clean up death tag
function damage:classes/damage/remove_death_tag


tag @s add damaged