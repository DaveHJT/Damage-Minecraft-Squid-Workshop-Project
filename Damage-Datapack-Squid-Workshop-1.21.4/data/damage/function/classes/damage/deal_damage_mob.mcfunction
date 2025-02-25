# create hurt effect and sound
effect give @s absorption 1 1 true
effect give @s[type=!#damage:undead] instant_damage 1 0 true
effect give @s[type=#damage:undead] instant_health 1 0 true

# update health
execute store result score @s health run data get entity @s Health

# increase the difficulty of boss
execute if score boss_difficulty damage_settings matches 1 run scoreboard players operation @s[type=#damage:boss] damage /= medium damage
execute if score boss_difficulty damage_settings matches 2 run scoreboard players operation @s[type=#damage:boss] damage /= hard damage

# kill
execute if score @s health <= @s damage run effect give @s[type=!#damage:undead] instant_damage 1 20 true
execute if score @s health <= @s damage run effect give @s[type=#damage:undead] instant_health 1 20 true

# hurt
scoreboard players operation @s health -= @s damage
execute store result entity @s Health short 1 run scoreboard players get @s health
scoreboard players set @s damage 0
