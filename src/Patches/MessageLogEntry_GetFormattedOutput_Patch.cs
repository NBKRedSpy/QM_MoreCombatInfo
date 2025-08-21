using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoreCombatInfo.Patches
{

    /// <summary>
    /// Prevents localization errors from being added to the Debug output.
    /// Looks for the special prefix and rewrites the output if found.
    /// </summary>
    [HarmonyPatch(typeof(MessageLogEntry), nameof(MessageLogEntry.GetFormattedOutput))]
    internal static class MessageLogEntry_GetFormattedOutput_Patch
    {
        public static bool Prefix(MessageLogEntry __instance, ref string __result)
        {
            if (!__instance.MessageTag.StartsWith(HitLogUtils.MessagePrefix)) return true;

            __result = __instance.MessageTag.Replace(HitLogUtils.MessagePrefix, "").WrapInColor(__instance.Color);

            return false;

        }
    }
}
