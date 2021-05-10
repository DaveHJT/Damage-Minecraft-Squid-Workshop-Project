
# set up scoreboard variables
scoreboard objectives add damage dummy
scoreboard objectives add health health
scoreboard objectives add hit_by dummy
scoreboard objectives add poison_buffer dummy
scoreboard objectives add damage_buffer dummy

# set up scoreboard constants
scoreboard players set delay damage_buffer 10

# player unique UID
scoreboard objectives remove UID
scoreboard objectives add UID dummy
scoreboard players set ptr UID 1

# reset tags
tag @a remove uid

#message
tellraw @a {"text":"[Server: Damage-Datapack from Squid-Workshop Loaded]","italic":true,"color":"gray"}

