using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{
    /// <summary>
    /// Add the "!" to indicate a critical hit in the attack
    /// </summary>
    [HarmonyPatch(typeof(MeleeAttackLogEntry), nameof(MeleeAttackLogEntry.GetFormattedOutput))]
    public class MeleeAttackLogEntry_GetFormattedOutput_Patch
    {
        public static void Postfix(MeleeAttackLogEntry __instance, ref string __result)
        {
            CriticalHitUtils.UpdateCriticalHit(__instance.FinalDmg, ref __result);
        }
    }
}
