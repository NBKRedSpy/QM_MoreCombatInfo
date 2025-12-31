using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{
    internal static class CriticalHitUtils
    {

        /// <summary>
        /// Using a conditional weak table to simplify weak references.
        /// the value is not used.
        /// </summary>
        private static ConditionalWeakTable<CombatLogEntry, object> CriticalHitLogEntries = new();

        private static string CriticalHitText = "";

        /// <summary>
        /// References a combat log entry that had a critical hit.
        /// </summary>
        /// <param name="entry"></param>
        public static void AddCriticalHit(CombatLogEntry entry)
        {
            CriticalHitLogEntries.Add(entry, null);
        }

        /// <summary>
        /// Returns true if the entry was a critical hit, and removes the tracking of that log entry.
        /// </summary>
        /// <param name="entry"></param>
        /// <returns></returns>
        public static bool WasCriticalHit(CombatLogEntry entry)
        {
            return CriticalHitLogEntries.TryGetValue(entry, out _);
        }

        /// <summary>
        /// The template "variable" to replace when setting the critical hit indicator.
        /// </summary>
        public const string RED_CRIT_MARKER = "%RED_CRIT%";


        public static void Init()
        {
            UpdateLogTemplates();
            CriticalHitText = "!".WrapInColor(Colors.Yellow);
        }

        /// <summary>
        /// Modifies the current critical hit log templates to include a critical hit variable.
        /// </summary>
        private static void UpdateLogTemplates()
        {

            //Example of a log template:
            //  %ATTACKER% dealt %DMG% (%DMGTYPE%) damage to %VICTIM% with %WEAPON%
            //Add a %RED_CRIT% marker to be replaced during log output generation.

            var localization = Localization.Instance.currentDict;

            foreach (string key in new[] { "ui.combatlog.MeleeAttackWeapon", "ui.combatlog.MeleeAttackBare", "ui.combatlog.RangeAttackWeapon"})
            {
                localization[key] = localization[key].Replace("%DMG%", $"%DMG%{RED_CRIT_MARKER}");
            }
        }


        /// <summary>
        /// Returns a modified version of the string with critical hit text added if applicable.
        /// </summary>
        /// <param name="entry"></param>
        /// <param name="text"></param>
        /// <returns></returns>
        public static string AddCriticalHitText(CombatLogEntry entry, string text)
        {
            string criticalHitText = WasCriticalHit(entry) ? CriticalHitText : string.Empty;  

            return text.Replace(RED_CRIT_MARKER, criticalHitText);  
        }
    }
}
