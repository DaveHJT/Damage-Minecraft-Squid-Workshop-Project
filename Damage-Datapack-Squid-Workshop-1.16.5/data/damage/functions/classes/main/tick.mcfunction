# update uid for new player
execute as @a[tag=!uid] run function damage:classes/damage/update_uid

# update status
tag @a[tag=respawn] remove respawn
tag @a[tag=dead,scores={health=1..}] add respawn
tag @a[tag=respawn] remove dead
tag @a[scores={health=0}] add dead

scoreboard players set @a[tag=respawn] damage 0
tag @a[tag=damaged] remove damaged

# if damage is fully dealt, hit_by is 0
scoreboard players set @a[scores={damage=0}] hit_by 0


# optimize @e
execute as @e at @s run function damage:classes/damage/tick
