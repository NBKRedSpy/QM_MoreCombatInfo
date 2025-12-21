using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{
    /// <summary>
    /// If there is a crit hit, makes the damage negative as a signal to the GetFormattedOutput to add critical hit info.
    /// </summary>
    [HarmonyPatch(typeof(CombatLogSystem), nameof(CombatLogSystem.FinishMeleeAttackLogEntry))]
    public static class CombatLogSystem_FinishMeleeAttackLogEntry_Patch
    {
        public static void Postfix(CombatLog combatLog, ref MeleeAttackLogEntry entry, DamageHitInfo hitInfo)
        {
            //Use a hack.  If there is a crit, change to a negative to signal the entry.GetFormattedOutput to add the crit info.
            entry.FinalDmg = CriticalHitUtils.GetCritDamageFlag(hitInfo.wasCrit, entry.FinalDmg);
        }
    }
}
