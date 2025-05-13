[h1]Quasimorph More Combat Info[/h1]


Adds the hit percentages to the combat log.
Note: The developers have hinted at the combat log having more information in the future, so this may be a short lived mod.

[h1]Docs[/h1]

Example: [i][Hit] To Hit: 30 Roll: 55 Dodge: 10[/i]
[table]
[tr]
[td]Item
[/td]
[td]Description
[/td]
[/tr]
[tr]
[td]Hit/Miss
[/td]
[td]If the attack was a hit or miss.
[/td]
[/tr]
[tr]
[td]To Hit
[/td]
[td]The value that the roll must be equal or higher to.
[/td]
[/tr]
[tr]
[td]Roll
[/td]
[td]The random roll for the to hit.  Must be at or over the To Hit value.
[/td]
[/tr]
[tr]
[td]Dodge
[/td]
[td]The target's dodge value.  Informational
[/td]
[/tr]
[/table]

[h1]Log Changes[/h1]

The start of an attack will have a '--- <attacker name> ---' header line.
Turn number on left of the log uses alternate colors per turn for better visibility.

[h1]Notes[/h1]

The hit rolls only show if the projectile crossed a creature.  So if a shot goes wide or hits a barrier, it will not show up in the combat log.

The accuracy and roll numbers are displayed as whole numbers, but are actually decimals.  It is possible for the display to show the same number but still miss.  Ex:  51 vs 51 when in reality it is 51.1 vs 51.3

[h1]Known Issues[/h1]
[list]
[*]The header which shows the attacker is not always updated and therefore incorrect.
[*]The game's log (Player.log) will have localization errors / warnings.  This does not impact the game.
[*]Some melee attacks are not registered.
[/list]

[h1]Buy Me a Coffee[/h1]

If you enjoy my mods and want to buy me a coffee, check out my [url=https://ko-fi.com/nbkredspy71915]Ko-Fi[/url] page.
Thanks!

[h1]Source Code[/h1]

Source code is available on GitHub at https://github.com/NBKRedSpy/QM_MoreCombatInfo

[h1]Change Log[/h1]

[h2]1.2.0[/h2]
[list]
[*]Changed log to be the more common To Hit and Roll format.  Effectively inverse of the game's internal rolls.
[*]Overrode localization errors.  Unfortunately, this is global.
[/list]

[h2]1.1.1[/h2]
[list]
[*]Fixed attacker header not showing or ordered late in some cases.
[*]Added brackets around hit and miss.
[*]Added more dashes to attacker to find easier.
[*]Fixed null reference error due to Mono not liking null forgiving operators in some cases.
[/list]
