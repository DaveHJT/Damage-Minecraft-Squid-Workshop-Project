execute if entity @s[tag=poison_buffer] run function damage:classes/damage/combine_poison_buffer

# poison effect that deal damage after 8 ticks
execute if entity @s[tag=!buffer_combined] run function damage:classes/damage/apply_poison

tag @s[tag=buffer_combined] remove buffer_combined