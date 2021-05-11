
# Damage-Datapack-Minecraft-Squid-Workshop
A minecraft library for custom instant damage.

## Abstract
As we all know, custom damage has always been a pain for datapack developers, since minecraft only provided very high level API such as instant_damage, poison and wither effects,bu the damage amount cannot be customized, and these effects cannot be accumulated in a single tick. The only low level API that can be accessed by commands----attribute, is useful for editing mobs' health, but it's read-only for players.

The only working type of custom damage datapack I have seen on the internet is by replacing the equipment on player with another equipment that the attributes are modified, so that these attributes can overwrite the health related attributes of the player. I'm not sure it is exactly how it works, but this solution needs to set a container(chest) in the minecraft world to store the equipments of player temporarily, which is hacky. 

I used to use a custom damage datapack like this but it no longer works in minecraft 1.16.5, so I decided to develop a more elegant solution here.
