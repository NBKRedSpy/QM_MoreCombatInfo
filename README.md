# Quasimorph More Combat Info
![thumbnail icon](media/thumbnail.png)

Adds the hit percentages to the combat log.
Note: The developers have hinted at the combat log having more information in the future, so this may be a short lived mod.

# Docs

Example: `[Hit] To Hit: 30 Roll: 55 Dodge: 10`

|Item|Description|
|--|--|
|Hit/Miss|If the attack was a hit or miss.|
|To Hit|The value that the roll must be equal or higher to.
|Roll|The random roll for the to hit.  Must be at or over the To Hit value.|
|Dodge|The target's dodge value.  Informational|

# Log Changes
The start of an attack will have a '--- \<attacker name\> ---' header line.  
Turn number on left of the log uses alternate colors per turn for better visibility.

# Notes
The hit rolls only show if the projectile crossed a creature.  So if a shot goes wide or hits a barrier, it will not show up in the combat log.

The accuracy and roll numbers are displayed as whole numbers, but are actually decimals.  It is possible for the display to show the same number but still miss.  Ex:  51 vs 51 when in reality it is 51.1 vs 51.3

# Known Issues
* The header which shows the attacker is not always updated and therefore incorrect.
* The game's log (Player.log) will have localization errors / warnings.  This does not impact the game.
* Some melee attacks are not registered.

# Buy Me a Coffee
If you enjoy my mods and want to buy me a coffee, check out my [Ko-Fi](https://ko-fi.com/nbkredspy71915) page.
Thanks!

# Source Code
Source code is available on GitHub at https://github.com/NBKRedSpy/QM_MoreCombatInfo

# Change Log

## 1.2.0
* Changed log to be the more common To Hit and Roll format.  Effectively inverse of the game's internal rolls.
* Overrode localization errors.  Unfortunately, this is global.

## 1.1.1
* Fixed attacker header not showing or ordered late in some cases.
* Added brackets around hit and miss.
* Added more dashes to attacker to find easier.
* Fixed null reference error due to Mono not liking null forgiving operators in some cases.
