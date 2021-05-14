# update uid for new player
execute as @a[tag=!uid] run function damage:classes/damage/update_uid

# update health
execute as @a store result score @s health run data get entity @s Health 1

# update status
tag @a[tag=respawn] remove respawn
tag @a[tag=dead,scores={health=1..}] add respawn
tag @a[tag=respawn] remove dead
tag @a[scores={health=0}] add dead

scoreboard players set @a[tag=respawn] damage 0
scoreboard players set @a[scores={damage=1..},gamemode=creative] damage 0
scoreboard players set @a[scores={damage=1..},gamemode=spectator] damage 0

# clear the absorption if the damage is already dealt
effect clear @a[tag=damaged] absorption

tag @a[tag=damaged] remove damaged

# if damage is fully dealt, hit_by is 0
scoreboard players set @a[scores={damage=0},tag=!poison_buffer] hit_by 0



# deal damage
execute as @e[type=#damage:mob,scores={damage=1..}] at @s run function damage:classes/damage/deal_damage_mob
execute as @e[type=#damage:boss,scores={damage=1..}] at @s run function damage:classes/damage/deal_damage_mob
execute as @a[scores={damage=1..,health=1..,},tag=!damaged,gamemode=!creative,gamemode=!spectator] at @s run function damage:classes/damage/deal_damage


# poison_buffer
scoreboard players add @e[tag=poison_buffer] poison_buffer 1
# already dealt 1 damage with poison, so remove buffer
execute as @e[scores={poison_buffer=10..}] run function damage:classes/damage/clear_poison_buffer
# or if health is only 1, poison will not be effective 
execute as @e[scores={health=1}] run function damage:classes/damage/clear_poison_buffer

# damage timer 
scoreboard players add @e damage_timer 0
scoreboard players remove @e[scores={damage_timer=1..}] damage_timer 1
# execute as @s[scores={damage_timer=1}] run function damage:classes/damage/clear_damage_timer


