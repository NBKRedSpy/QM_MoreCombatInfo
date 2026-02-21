using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{
    /// <summary>
    /// Track the combat log entry if the attack was a critical hit.  Used for changing the log output.
    /// </summary>
    [HarmonyPatch(typeof(CombatLogSystem), nameof(CombatLogSystem.FinishMeleeAttackLogEntry))]
    public static class CombatLogSystem_FinishMeleeAttackLogEntry_Patch
    {
        public static void Postfix(ref MeleeAttackLogEntry entry, DamageHitInfo hitInfo)
        {
            if(hitInfo.wasCrit)
            {
                CriticalHitUtils.AddCriticalHit(entry); 
            }
        }
    }
}
