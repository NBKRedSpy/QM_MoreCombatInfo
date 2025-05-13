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

    [HarmonyPatch(typeof(MGSC.CombatLogSystem), nameof(MGSC.CombatLogSystem.BeginAddRangeAttackEntry))]
    public static class CombatLogSystem_BeginAddRangeAttackEntry_Patch
    {
        /// <summary>
        /// Get the combatants info for ranged attacks.
        /// This function is *only* called by successful ranged attacks and only in one part of the system.
        /// </summary>
        /// <param name="attacker"></param>
        /// <param name="victim"></param>
        static void Prefix(Creature attacker, Creature victim)
        {
            HitLogUtils.SetCombatants(attacker, victim);
        }
    }
}
