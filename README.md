
# Damage-Datapack-Minecraft-Squid-Workshop
A minecraft library for custom instant damage.

## Abstract
As we all know, custom damage has always been a pain for datapack developers, since minecraft only provided very high level API such as instant_damage, poison and wither effects,bu the damage amount cannot be customized, and these effects cannot be accumulated in a single tick. The only low level API that can be accessed by commands----attribute, is useful for editing mobs' health, but it's read-only for players.

The only working type of custom damage datapack I have seen on the internet is by replacing the equipment on player with another equipment that the attributes are modified, so that these attributes can overwrite the health related attributes of the player. I'm not sure it is exactly how it works, but this solution needs to set a container(chest) in the minecraft world to store the equipments of player temporarily, which is hacky. 

I used to use a custom damage datapack like this but it no longer works in minecraft 1.16.5, so I decided to develop a more elegant solution here.


## Installation
- Step 1 Download this repository as a zip and unpack.
- Step 2 Go to minecraft saves directory, usually "C:/Users/youUserName/AppData/Roaming/.minecraft/saves".
- Step 3 Choose the world folder in which you want to install the packs.
- Step 4 Go to .../world/datapacks folder.
- Step 5 Move your "Damage-Datapack-Squid-Workshop-1.16.5" folder(not the root folder) into .../world/datapacks folder.
- Step 6 Open Minecraft and open the world.
- Step 7 Type "/reload" command then press enter.
- Step 8 Enjoy

PS: If not working, check whether the datapack is enabled by:

	/datapack list
Enable it by:

	/datapack enable "datapackname"
  
## Usage
In game, add the damge score to the entity(player or mobs) you want to give damage to by:

  	/scoreboard players add damage 10
  
You can change 10 to any amount of damage, note that player has health of 20.
