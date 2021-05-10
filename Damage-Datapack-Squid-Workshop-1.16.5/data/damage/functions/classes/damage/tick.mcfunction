# deal damage
execute as @s[type=#damage:mob,scores={damage=1..}] at @s run function damage:classes/damage/deal_damage
execute as @s[type=#damage:boss,scores={damage=1..}] at @s run function damage:classes/damage/deal_damage
execute as @s[scores={damage=1..,health=1..},tag=!damaged] at @s run function damage:classes/damage/deal_damage


# poison_buffer
scoreboard players add @s[tag=poison_buffer] poison_buffer 1
# already dealt 1 damage with poison, so remove buffer
execute as @s[scores={poison_buffer=10..}] run function damage:classes/damage/clear_poison_buffer
# or if health is only 1, poison will not be effective 
execute as @s[scores={health=1}] run function damage:classes/damage/clear_poison_buffer

# damage timer 
scoreboard players add @s damage_timer 0
scoreboard players remove @s[scores={damage_timer=1..}] damage_timer 1
# execute as @s[scores={damage_timer=1}] run function damage:classes/damage/clear_damage_timer

# clear damage buffer if the damage is already dealt (timer is 0)
scoreboard players set @s[scores={damage_timer=0,damage_buffer=1..}] damage_buffer 0
