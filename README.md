
# Damage-Datapack-Minecraft-Squid-Workshop
A minecraft datapack library for a custom damage system, including custom death message and pvp kills count.

- [Abstract](#Abstract)
- [Installation](#installation)
- [Usage](#Usage)
- [How it works](#How-it-works)
- [Project Tree](#Project-Tree)
- [Incompactibility](#Incompactibility)
- [Terms of Use](#Terms-of-Use)
- [More About Squid Workshop](#More-About-Squid-Workshop)

# Abstract
As we all know, custom damage has always been a pain for datapack developers, since minecraft only provided very high level API such as instant_damage, poison and wither effects,bu the damage amount cannot be customized, and these effects cannot be accumulated in a single tick. The only low level API that can be accessed by commands----attribute, is useful for editing mobs' health, but it's read-only for players.

The only working type of custom damage datapack I have seen on the internet is by replacing the equipment on player with another equipment that the attributes are modified, so that these attributes can overwrite the health related attributes of the player. I'm not sure it is exactly how it works, but this solution needs to set a container(chest) in the minecraft world to store the equipments of player temporarily, which is hacky. 

I used to use a custom damage datapack like this but it no longer works in minecraft 1.16.5, so I decided to develop a more elegant solution here.


# Installation
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
  
# Usage
## Simple
* In game, add the damge score to the entity(player or mobs) you want to give damage to by:

  	/scoreboard players add damage 10
  
You can change 10 to any amount of damage(positive integer), note that player has health of 20.

* In-game command list
	* all the user commands are under 

			function gun:ui/...

| Description | Command |
| --- | :------ |
| display this list | /function damage:ui/help
| clean up and disable the datapack | /function damage:ui/unload
| change the damage against boss | /function damage:ui/setting/boss_difficulty/...
| enable/disable gussing unknown killer by nearest player | /function damage:ui/setting/guess_killer/...

## Advanced
Datapack developers might want to read this part.
### Custom Death Message
When the damage score is added:
1. Tag the damage taker the following tags
2. Assign the damage taker's hit_by score by the damage applyer's UID(unique player ID created by this datapack)
can trigger custom death messages if the player is killed by this damage.

| Condition | Death Message |
| --- | :------ |
| default | @s was killed under @p[tag=killer]'s gunfire
| suicide | That was a suicide
| teamkill | @p[tag=killer] just killed their teammate.
| tag=exploded | @s was blown up by @p[tag=killer]
| tag=turreted | @s was shot by @p[tag=killer]s turret"
| tag=onfire | @s was burnt to death by @p[tag=killer]'s molotov
| tag=grenaded | @s was blown up by @p[tag=killer]'s grenade

Welcome to contribute to this datapack by adding more tag/message pairs! See [CONTRIBUTIING.md](https://github.com/DaveHJT/Damage-Datapack-Minecraft-Squid-Workshop/blob/main/CONTRIBUTING.md)

### PVP Kills Count
The datapack counts all the pvp kills by both original damage system and this custom damage system.
The scores are in scoreboard "Kills".
Rules:
1. If suicide, your Kills score will be reduced by 1.
2. If killing another player that the "team" score is not 0 and it's the same as you, you killed a teammate and your Kills score will be reduced by 1.
3. If killed by custom damage but "hit_by" score is not assigned to the damage applyer's UID, the system guess you are killed by the nearest player(no team > different team > teammate).

# How it works

# Project Tree
See [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject/blob/master/CONTRIBUTING.md) for our standard datapack structure and how this structure works.

	Damage-Datapack-Squid-Workshop-1.16.5/
	│  pack.mcmeta
	│  pack.png
	│
	└─data
	    ├─damage
	    │  ├─functions
	    │  │  ├─classes
	    │  │  │  ├─damage
	    │  │  │  │  │  apply_poison.mcfunction
	    │  │  │  │  │  clear_damage_buffer.mcfunction
	    │  │  │  │  │  clear_poison_buffer.mcfunction
	    │  │  │  │  │  combine_poison_buffer.mcfunction
	    │  │  │  │  │  damage1_poison.mcfunction
	    │  │  │  │  │  deal_damage.mcfunction
	    │  │  │  │  │  deal_damage_mob.mcfunction
	    │  │  │  │  │  hurt.mcfunction
	    │  │  │  │  │  hurt_until_damage1.mcfunction
	    │  │  │  │  │  kill.mcfunction
	    │  │  │  │  │  remove_death_tag.mcfunction
	    │  │  │  │  │  update_uid.mcfunction
	    │  │  │  │  │
	    │  │  │  │  └─enum
	    │  │  │  │          12.mcfunction
	    │  │  │  │          16.mcfunction
	    │  │  │  │          2.mcfunction
	    │  │  │  │          20.mcfunction
	    │  │  │  │          24.mcfunction
	    │  │  │  │          32.mcfunction
	    │  │  │  │          4.mcfunction
	    │  │  │  │          48.mcfunction
	    │  │  │  │          6.mcfunction
	    │  │  │  │          8.mcfunction
	    │  │  │  │          96.mcfunction
	    │  │  │  │
	    │  │  │  └─main
	    │  │  │          clean.mcfunction
	    │  │  │          load.mcfunction
	    │  │  │          tick.mcfunction
	    │  │  │
	    │  │  └─ui
	    │  │      │  unload.mcfunction
	    │  │      │
	    │  │      └─setting
	    │  │          ├─boss_difficulty
	    │  │          │      default.mcfunction
	    │  │          │      hard.mcfunction
	    │  │          │      medium.mcfunction
	    │  │          │
	    │  │          └─guess_killer
	    │  │                  disable.mcfunction
	    │  │                  enable.mcfunction
	    │  │
	    │  └─tags
	    │      └─entity_types
	    │              boss.json
	    │              mob.json
	    │              notmob.json
	    │              undead.json
	    │
	    └─minecraft
		└─tags
		    └─functions
			    load.json
			    tick.json


# Incompactibility
* This datapack uses absorption effect as helper, so that adding the damage score to any entity(player or mobs) that has absorption effect may cause:
	1. less damage than the damage score is dealt
	2. the absorption effect might be cleared
* Using other datapacks not from Squid Workshop that contains the same scoreboard or tags name as this datapack in code may cause undefined behaviour.


# Terms of Use
Feel free to play around with this datapack. \
As developer, deel free to use this datapack as a module. \
But you **must** add the link to this github page!
## License
[Mozilla Public License 2.0](https://github.com/DaveHJT/Damage-Datapack-Minecraft-Squid-Workshop/blob/main/LICENSE)

# More About Squid Workshop
See more datapacks developed by us [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject) \
Watch our videos on bilibili [here](https://space.bilibili.com/649645265?from=search&seid=778816111336987286) \
Join our QQ group: 74681732 \
Subscribe on wechat: 鱿鱼MC工作室 

