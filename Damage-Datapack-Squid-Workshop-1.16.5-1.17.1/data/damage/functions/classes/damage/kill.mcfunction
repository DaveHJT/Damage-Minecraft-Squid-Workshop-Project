# kill player without default message
gamerule showDeathMessages false
kill @s
gamerule showDeathMessages true

# tag killer
scoreboard players operation hitter hit_by = @s hit_by
execute as @a if score @s UID = hitter hit_by run tag @s add killer

# if hitter unknown, warn
execute if score @s hit_by matches 0 run tellraw @a ["",{"text":"Warning(Damage-Minecraft-Squid-Workshop): damage source not found"}]


# custom death message

execute if entity @s[tag=grenaded,tag=!messaged] if entity @p[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was blown up by "},{"selector":"@p[tag=killer]"},{"text":"'s grenade"}]
execute if entity @s[tag=grenaded,tag=!messaged] if entity @p[tag=killer] run tag @s add messaged

execute if entity @s[tag=molotoved,tag=!messaged] if entity @p[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was burnt to death by "},{"selector":"@p[tag=killer]"},{"text":"'s molotov"}]
execute if entity @s[tag=molotoved,tag=!messaged] if entity @p[tag=killer] run tag @s add messaged

execute if entity @s[tag=turreted,tag=!messaged] if entity @p[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was shot by "},{"selector":"@p[tag=killer]"},{"text":"'s turret"}]
execute if entity @s[tag=turreted,tag=!messaged] if entity @p[tag=killer] run tag @s add messaged

execute if entity @s[tag=exploded,tag=!messaged] if entity @p[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was blown up by "},{"selector":"@p[tag=killer]"}]
execute if entity @s[tag=exploded,tag=!messaged] if entity @p[tag=killer] run tag @s add messaged

execute if entity @s[tag=!messaged] if entity @p[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was killed under "},{"selector":"@p[tag=killer]"},{"text":"'s gunfire"}]
execute if entity @s[tag=!messaged] if entity @p[tag=killer] run tag @s add messaged


# clean up death tag
function damage:classes/damage/remove_death_tag

# count kills
scoreboard players add @p[tag=killer] Kills 1
#suicide
execute if score @s UID = @p[tag=killer] UID run tag @s add suicide
scoreboard players remove @s[tag=suicide] Kills 1
execute if entity @s[tag=suicide] run tellraw @a ["",{"text":"That was a suicide"}]

#team kill : set the team 
execute unless score @s team matches 0 if score @s[tag=!suicide] team = @p[tag=killer] team run scoreboard players remove @p[tag=killer] Kills 2
execute unless score @s team matches 0 if score @s[tag=!suicide] team = @p[tag=killer] team run tellraw @a ["",{"selector":"@p[tag=killer]"},{"text":" just killed their teammate"}]


# clean tags
tag @a[tag=killer] remove killer
tag @s[tag=messaged] remove messaged

