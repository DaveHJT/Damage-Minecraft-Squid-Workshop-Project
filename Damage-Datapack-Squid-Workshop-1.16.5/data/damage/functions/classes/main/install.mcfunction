
# set up scoreboard variables
# hit_by : record the damage dealer UID when damage is dealt
# damage_timer : delay the next damage until the invicinble time of instant damage is passed
# poison_buffer : the time that poison effect is applied but poison damage is not dealt yet
# damage_buffer : the damage amount that instant damage effect is applied but damage is not dealt yet
scoreboard objectives add damage dummy
scoreboard objectives add health health
scoreboard objectives add hit_by dummy
scoreboard objectives add poison_buffer dummy
scoreboard objectives add damage_timer dummy 
scoreboard objectives add damage_buffer dummy

# set up scoreboard constants
scoreboard players set delay damage_timer 10

# player unique UID
scoreboard objectives remove UID
scoreboard objectives add UID dummy
scoreboard players set ptr UID 1

# reset tags
tag @a remove uid

#message
tellraw @a {"text":"[Server: Damage-Datapack from Squid-Workshop Loaded]","italic":true,"color":"gray"}

