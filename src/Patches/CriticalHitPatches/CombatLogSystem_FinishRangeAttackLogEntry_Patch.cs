using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{

    /// <summary>
    /// If there is a crit hit, makes the damage negative as a signal to the GetFormattedOutput to add critical hit info.
    /// </summary>
    [HarmonyPatch(typeof(CombatLogSystem), nameof(CombatLogSystem.FinishRangeAttackLogEntry))]
    public static class CombatLogSystem_FinishRangeAttackLogEntry_Patch
    {
        public static void Postfix(RangeAttackLogEntry entry, DamageHitInfo hitInfo)
        {
            if (hitInfo.wasCrit)
            {
                CriticalHitUtils.AddCriticalHit(entry);
            }
        }

    }
}
