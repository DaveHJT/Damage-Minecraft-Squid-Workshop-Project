# update health
execute store result score @s health run data get entity @s Health

# increase the difficulty of boss
execute if score boss_difficulty damage_setting matches 1 run scoreboard players operation @s[type=#damage:boss] damage %= medium damage
execute if score boss_difficulty damage_setting matches 2 run scoreboard players operation @s[type=#damage:boss] damage %= hard damage
execute if score @s damage matches 0 run scoreboard players set @s damage 1
# kill
execute if score @s health <= @s damage run kill @s
# hurt
scoreboard players operation @s health -= @s damage
execute store result entity @s Health short 1 run scoreboard players get @s health
scoreboard players set @s damage 0
