using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;

namespace MoreCombatInfo
{



    /// <summary>
    /// Disables the localization errors in the log.
    /// TODO: The correct way to do this is to change all the entries in here to localized entries and insert them into the language
    /// </summary>
    [HarmonyPatch(typeof(Localization), nameof(Localization.Get), new Type[]{typeof(string)})]
    public static class Localization_Get_Patch
    {
        static bool Prefix(string key, ref string __result)
        {
            //WARNING COPY:  This calls the original get code which is the full copy and replace of the 
            //original get code.  
            __result = OriginalGet(key);
            return false;
        }

        private static string OriginalGet(string key)
        {
            //WARNING!  This is a copy of the original get code.
            if (Singleton<Localization>.Instance.currentDict.TryGetValue(key, out var value))
            {
                if (string.IsNullOrEmpty(value))
                {
                    return key;
                }
                return value;
            }

            //Remove the debug logging.
            //if (Singleton<Localization>.Instance._warningExclusionTags.IndexOf(key) == -1)
            //{
            //    Debug.LogWarning("LocalizationManager error: key '" + key + "' not found.");
            //}
            return key;
        }
    }
}
