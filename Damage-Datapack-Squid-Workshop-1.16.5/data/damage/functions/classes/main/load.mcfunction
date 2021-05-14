# clean first
function damage:classes/main/clean

# game rule
gamerule naturalRegeneration false

# set up scoreboard variables
# hit_by : record the damage dealer UID when damage is dealt
# damage_timer : delay the next damage until the invicinble time of instant damage is passed
# poison_buffer : the time that poison effect is applied but poison damage is not dealt yet
scoreboard objectives add damage dummy
scoreboard objectives add team dummy
scoreboard objectives add health dummy
scoreboard objectives add hit_by dummy
scoreboard objectives add poison_buffer dummy
scoreboard objectives add damage_timer dummy 

# set up scoreboard constants
scoreboard players set delay damage_timer 10

# player unique UID
scoreboard objectives remove UID
scoreboard objectives add UID dummy
scoreboard players set ptr UID 1

# init settings
scoreboard objectives add damage_setting dummy

# the times of damage needed to defeat boss under medium/hard difficulty
# boss_difficulty: 0.default 1.medium 2.hard
scoreboard players set medium damage 2
scoreboard players set hard damage 4

# default options
scoreboard players set guess_killer damage_setting 1
scoreboard players set boss_difficulty damage_setting 0


# reset tags
tag @a remove uid

#message
tellraw @a {"text":"[Server]: Damage-Datapack from Squid-Workshop Loaded","italic":true,"color":"gray"}

