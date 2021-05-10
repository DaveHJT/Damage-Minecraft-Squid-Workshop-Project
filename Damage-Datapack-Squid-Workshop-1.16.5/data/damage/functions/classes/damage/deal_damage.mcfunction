# hurt sound
execute if entity @s[scores={damage_timer=0}] at @s run playsound minecraft:entity.player.hurt player @a ~ ~ ~ 3 1

# deal damage: only hurt when the hurt damage is not possible to kill this entity

# sum damage and damage_buffer(damage that will be dealt within 10 ticks)
scoreboard players set sum_tmp damage 0
scoreboard players operation sum_tmp damage += @s damage
#scoreboard players operation sum_tmp damage += @s damage_buffer
execute if entity @s[tag=poison_buffer] run scoreboard players add sum_tmp damage 1

execute if entity @s if score sum_tmp damage >= @s health run tag @s add dead
execute if entity @s[tag=dead] run function damage:classes/damage/kill
# deal damage when the damage cooldown has passed and the damage won't cause dealth
execute unless entity @s[tag=dead] if entity @s[type=!#damage:undead,scores={damage_timer=0}] run function damage:classes/damage/hurt






