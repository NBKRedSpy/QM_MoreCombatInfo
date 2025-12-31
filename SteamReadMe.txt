[h1]Quasimorph More Combat Info[/h1]


Adds the hit percentages to the combat log. Also suffixes damage numbers from critical hits with an exclamation point  The mod can be configured to show the "inverted rolls" as older versions of this mod did.  See the Configuration section.

[h1]Critical Hit Note[/h1]

When reloading a game, critical hits in the log will no longer have the ! suffix.  This is due to how the game saves the combat log.

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

[h1]Configuration[/h1]

This mod supports the Mod Configuration Manager.  The settings can be changed in the Mods menu or directly in the config file.

The configuration file will be created on the first game run and can be found at [i]%AppData%\..\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\MoreCombatInfo\config.json[/i].
[table]
[tr]
[td]Name
[/td]
[td]Default
[/td]
[td]Description
[/td]
[/tr]
[tr]
[td]InvertToHit
[/td]
[td]true
[/td]
[td]If true, will change the roll for the To Hit to need to be over the target.  False is the To Hit roll display previous to version 1.2.0 of this mod
[/td]
[/tr]
[/table]

[h1]Notes[/h1]

The hit rolls only show if the projectile crossed a creature.  So if a shot goes wide or hits a barrier, it will not show up in the combat log.

The accuracy and roll numbers are displayed as whole numbers, but are actually decimals.  It is possible for the display to show the same number but still miss.  Ex:  51 vs 51 when in reality it is 51.1 vs 51.3

[h1]Support Development[/h1]

If you enjoy my mods and want to buy me a coffee, check out my [url=https://ko-fi.com/nbkredspy71915]Ko-Fi[/url] page.
Thanks!

[h1]Credits[/h1]
[list]
[*]Special thanks to Crynano for his excellent Mod Configuration Menu.
[/list]

[h1]Source Code[/h1]

Source code is available on GitHub at https://github.com/NBKRedSpy/QM_MoreCombatInfo

[h1]Change Log[/h1]

[h2]1.6.1[/h2]
[list]
[*]Added Critical Hit indicator on damage.
[list]
[*]Original code written by Traveler.
[/list]
[/list]

[h2]1.5.0[/h2]

Multi version support

[h2]1.4.1[/h2]
[list]
[*]Fix for MCM not being bypassed due to Mono specific bug.
[/list]

[h2]1.4.0[/h2]
[list]
[*]MCM Integration
[/list]
