using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches
{
    /// <summary>
    /// This patch is only required because the first ranged attack from an attacker
    /// that the merc does not see will not have the attacker set.
    /// </summary>
    [HarmonyPatch(typeof(FirearmSystem), nameof(FirearmSystem.InstantShootBullet))] 
    public static class FirearmSystem_InstantShootBullet_Patch
    {
        public static void Prefix(Creature shooter)
        {
            if (shooter == null) return;    

            HitLogUtils.SetCombatants(shooter, null);
        }
    }
}
