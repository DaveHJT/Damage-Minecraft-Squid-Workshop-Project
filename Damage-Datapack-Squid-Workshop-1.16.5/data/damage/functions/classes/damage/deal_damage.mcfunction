# hurt sound
execute if entity @s[gamemode=!creative,gamemode=!spectator,scores={damage_timer=0}] at @s run playsound minecraft:entity.player.hurt player @a ~ ~ ~ 3 1

# deal damage: only hurt when the hurt damage is not possible to kill this entity

# sum damage and damage_buffer(damage that will be dealt within 10 ticks)
scoreboard players operation sum_tmp damage = @s damage
scoreboard players operation sum_tmp damage += @s damage_buffer

execute if entity @s[gamemode=!creative,gamemode=!spectator] if score sum_tmp damage >= @s health run tag @s add dead
execute if entity @s[tag=dead] run function damage:classes/damage/kill
execute unless entity @s[tag=dead,type=!#damage:undead] run function damage:classes/damage/hurt
# scoreboard players set @s damage 0





