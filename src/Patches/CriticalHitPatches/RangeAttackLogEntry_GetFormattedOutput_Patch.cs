using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches.CriticalHitPatches
{
    /// <summary>
    /// Add the "!" to indicate a critical hit in the attack
    /// </summary>

    [HarmonyPatch(typeof(RangeAttackLogEntry), nameof(RangeAttackLogEntry.GetFormattedOutput))]
    public class RangeAttackLogEntry_GetFormattedOutput_Patch
    {
        public static void Postfix(RangeAttackLogEntry __instance, ref string __result)
        {
            CriticalHitUtils.UpdateCriticalHit(__instance.FinalDmg, ref __result);
        }
    }
}
