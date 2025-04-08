using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;
using UnityEngine;

namespace MoreCombatInfo
{
    [HarmonyPatch(typeof(CombatLogView), nameof(CombatLogView.GetFormattedEntry))]  
    public static class CombatLogView_GetFormattedEntry_Patch
    {
        private static int LastTurnNumber { get; set; } = -1;

        public static bool Prefix(CombatLogView __instance, CombatLogEntry entry, ref string __result)
        {

            Color color = entry.TurnIndex % 2 == 0 ? Colors.Yellow : Colors.AltGreen;

            int turnNumber = entry.TurnIndex;

            //WARNING COPY: This is a copy and replace of the original function, which only contains this one 
            //  line of code.
            //return $"{entry.TurnIndex}: <indent={_turnNumberOffset}>{entry.GetFormattedOutput()}</indent>";

            string turnIndicator = entry.TurnIndex.ToString();

            if (entry.TurnIndex % 2 == 0)
            {
                turnIndicator = turnIndicator.WrapInColor(Colors.Yellow);
            }

            __result = $"{turnIndicator}: <indent={__instance._turnNumberOffset}>{entry.GetFormattedOutput()}</indent>";

            return false;
        }
    }
}
