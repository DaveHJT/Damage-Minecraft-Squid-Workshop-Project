# update uid for new player
execute as @a[tag=!uid] run function damage:classes/damage/update_uid

# update status
tag @a[tag=respawn] remove respawn
tag @a[tag=dead,scores={health=1..}] add respawn
tag @a[tag=respawn] remove dead
tag @a[scores={health=0}] add dead

scoreboard players set @a[tag=respawn] damage 0
#scoreboard players set @a[tag=!damaged] hit_by 0
tag @a[tag=damaged] remove damaged

# deal damage
execute as @e[type=#damage:mob,scores={damage=1..}] at @s run function damage:classes/damage/deal_damage
execute as @e[type=#damage:boss,scores={damage=1..}] at @s run function damage:classes/damage/deal_damage
execute as @a[scores={damage=1..,health=1..},tag=!damaged] at @s run function damage:classes/damage/deal_damage

# poison_buffer
scoreboard players add @e[tag=poison_buffer] poison_buffer 1
# already dealt 1 damage with poison, so remove buffer
execute as @e[scores={poison_buffer=10..}] run function damage:classes/damage/clear_poison_buffer
# or if health is only 1, poison will not be effective 
execute as @e[scores={health=1}] run function damage:classes/damage/clear_poison_buffer

# damage buffer
scoreboard players add @e damage_buffer 0
scoreboard players remove @e[scores={damage_buffer=1..}] damage_buffer 1
# execute as @e[scores={damage_buffer=1}] run function damage:classes/damage/clear_damage_buffer
