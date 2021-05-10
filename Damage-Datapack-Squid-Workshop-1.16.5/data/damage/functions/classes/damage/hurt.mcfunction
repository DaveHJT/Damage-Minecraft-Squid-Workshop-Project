
# deal major damage
execute as @s[scores={damage=96..},tag=!saturated] run function damage:classes/damage/enum/96
execute as @s[scores={damage=48..},tag=!saturated] run function damage:classes/damage/enum/48
execute as @s[scores={damage=32..},tag=!saturated] run function damage:classes/damage/enum/32
execute as @s[scores={damage=24..},tag=!saturated] run function damage:classes/damage/enum/24
execute as @s[scores={damage=20..},tag=!saturated] run function damage:classes/damage/enum/20
execute as @s[scores={damage=16..},tag=!saturated] run function damage:classes/damage/enum/16
execute as @s[scores={damage=12..},tag=!saturated] run function damage:classes/damage/enum/12
execute as @s[scores={damage=8..},tag=!saturated] run function damage:classes/damage/enum/8
execute as @s[scores={damage=6..},tag=!saturated] run function damage:classes/damage/enum/6
execute as @s[scores={damage=4..},tag=!saturated] run function damage:classes/damage/enum/4
execute as @s[scores={damage=2..},tag=!saturated] run function damage:classes/damage/enum/2

tag @s[tag=saturated] remove saturated

# if damage >= 2 deal damage until damage <= 1
# execute if entity @s[scores={damage=2..}] run function damage:classes/damage/hurt_until_damage1

# if damage = 1 give 1 damage poison
execute if entity @s[scores={damage=1}] run function damage:classes/damage/damage1_poison

# clean up death tag
function damage:classes/damage/remove_death_tag


tag @s add damaged