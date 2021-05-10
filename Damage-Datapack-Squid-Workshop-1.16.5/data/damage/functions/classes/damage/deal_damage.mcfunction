# hurt sound
execute if entity @s[gamemode=!creative,gamemode=!spectator,scores={damage_buffer=0}] at @s run playsound minecraft:entity.player.hurt player @a ~ ~ ~ 3 1

# deal damage
execute if entity @s[gamemode=!creative,gamemode=!spectator] if score @s damage >= @s health run tag @s add dead
execute if entity @s[tag=dead] run function damage:classes/damage/kill
execute unless entity @s[tag=dead,type=!#damage:undead] run function damage:classes/damage/hurt
# scoreboard players set @s damage 0





