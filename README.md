
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
As we all know, custom damage has always been a pain for datapack developers, since minecraft only provided very high level API such as instant_damage, poison and wither effects,bu the damage amount cannot be customized, and these effects cannot be accumulated in a single tick. The only low level API that can be accessed by commands----attribute, is useful for editing mobs' health, but the health attribute of player is read-only.

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

  		/scoreboard players add @s damage 10
  
	You can change 10 to any amount of damage(positive integer), note that player has health of 20. \
	Change to @s to any player or mobs you want to deal damage on.

* In-game command list
	* all the user commands are under 

			function gun:ui/...

| Description | Command |
| --- | :------ |
| display this list | /function damage:ui/help
| clean up and disable the datapack | /function damage:ui/unload
| change the damage against boss | /function damage:ui/setting/boss_difficulty/...
| enable/disable guessing unknown killer by nearest player | /function damage:ui/setting/guess_killer/...

## Advanced
Datapack developers might want to read this part.

PS: To make the custom death message and PVP kills count work in teams, you need to manually set the "team" scores of the players in the same team the same. Team score of 0 means no team.

eg. PLAYER1 and PLAYER2 are teammates, PLAYER3 is in another team, PLAYER4 and PLAYER5 didn't join any team.

	/scoreboard players set PLAYER1 team 1
	/scoreboard players set PLAYER2 team 1
	/scoreboard players set PLAYER3 team 2
	/scoreboard players set PLAYER4 team 0
	/scoreboard players set PLAYER5 team 0
### Custom Death Message
When the damage score is added:
1. Tag the damage taker the following tags
2. Assign the damage taker's hit_by score by the damage applyer's UID(unique player ID created by this datapack)
can trigger custom death messages if the player is killed by this damage.

| Condition | Death Message |
| --- | :------ |
| default | @s was killed under @p[tag=killer]'s gunfire
| suicide | That was a suicide
| teamkill | @p[tag=killer] just killed their teammate
| guess killer | @p[tag=killer] claimed that kill
| tag=exploded | @s was blown up by @p[tag=killer]
| tag=turreted | @s was shot by @p[tag=killer]'s turret
| tag=molotoved | @s was burnt to death by @p[tag=killer]'s molotov
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
* In minecraft command system (mcfunction), we can use:
	* /data to modify the health of mobs directly, we use this method in this datapack, but player's Health nbt attribute is read-only.
	 * /atrribute to modify the max health of player, theoratically it can be used to clamp the player's health to a specific lower amount. However, the max health attribute is only updated at the end of the tick, so we need two ticks for editing player's health, and any health boost in the first tick will be dropped, this method is not practical.
	 * /effect instant_damage to deal damage within a tick, but this high level API also does the following things:
 		 * disable the instant damage effect to player in about 9 ticks
 	 	* can only do one instant damage effect per rick, if multiple effects are applied, only the strongest is reserved. So I tried to use recursion in code and failed
 		 * can only deal damge of the multiple of 6, eg. 6, 12 ,24, 48...
 	 * /effect instant_health is just the reverse of instant damage, and it gives player health that is the multiples of 4.
 	 * When using instant_health and instant_damage in the same tick, the final health after this tick is only affected by the sum of the damage modifiers, ignoring the max health (eg. when the player's health is full, we can still use +4 then -6 modifiers to make a combination of -2 health effect at the end of the tick). But the problem is, if the negative health modifier is less than the player's health (eg. player's health = 20, instant_damage = -24, instant_health = 64), even if the combination of health modifiers cannot kill the player, the instant damage will still kill the player instantly because 24>20. Hence, we need to use absorption effect instead of instant health effect to tomperarily raise the player's max health, and this problem can be avoided by this.
 	 * /effect poison to deal 1 damage, the damage is dealt after this effect is applied to player, this effect cannot be overlapped as well, and the poison effect cannot deal damage to the last 1 health of player
 
 1. Hence we used the combination of instant damage, absorption effects to deal damage over 2. The combinations are in "damage:classes/damage/enum" folder, there are 2, 4, 6, 8, 12, 16, 20, 24... 
 2. The damage score is accumulated, and the damage is dealt every 9 ticks(for the effect cooldown), the max damage in enum folder that is less than the damage score is chosen. The damage left to be dealt is carried to 9 ticks later. 
 3. If the damage score is 1, we uses poison effect, and tag the player a "poison_buffer" during the time that poison damage is not dealt yet. If another 1 damage arrives, we cancel the poison effect and buffer and add the 2x1 damage together, so it can be dealt instantly. 
 4. Every tick we check the combination of damage score and the 1 damage pending in poison buffer, that wheter the damage left to be dealt can kill the player, if so, we kill the player instantly using /kill command, and starts the [death message procedure](###Custom-Death-Message) and [pvp kills count procedure](###PVP-Kills-Count) mentioned above. So that all the kills by this damage system will always go through the kill procedure, the effects only hurts the player and never kills directly. 

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
* This datapack uses absorption effect as helper, so that adding the damage score to any entity(player or mobs) that has absorption or poison effect may cause:
	1. less damage than the damage score is dealt
	2. the absorption or poison effect might be cleared
* Instant damage effect is disabled in few seconds after player respawn, this invincibility is minecraft's feature, so we keeps it as our feature.
* Using other datapacks not from Squid Workshop that contains the same scoreboard or tags name as this datapack in code may cause undefined behaviour.


# Terms of Use
Feel free to play around with this datapack. \
As developer, deel free to use this datapack as a module to develop free datapacks. \
But you **must** add the link to this github page! \
**NO COMMERCIAL USE**
## License
[Mozilla Public License 2.0](https://github.com/DaveHJT/Damage-Datapack-Minecraft-Squid-Workshop/blob/main/LICENSE)

# More About Squid Workshop
See more datapacks developed by us [here](https://github.com/Squid-Workshop/MinecraftDatapacksProject) \
Watch our videos on bilibili [here](https://space.bilibili.com/649645265?from=search&seid=778816111336987286) \
Join our QQ group: 74681732 \
Subscribe on wechat: 鱿鱼MC工作室 

