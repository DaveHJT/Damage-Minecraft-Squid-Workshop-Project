# hurt sound
execute if entity @s[scores={damage_timer=0}] at @s run playsound minecraft:entity.player.hurt player @a ~ ~ ~ 3 1

# deal damage: only hurt when the hurt damage is not possible to kill this entity
execute if entity @s if score @s damage >= @s health run tag @s add dead
execute if entity @s[tag=dead] run function damage:classes/damage/kill
# deal damage when the damage cooldown has passed and the damage won't cause dealth
execute unless entity @s[tag=dead] if entity @s[scores={damage_timer=0}] run function damage:classes/damage/hurt






