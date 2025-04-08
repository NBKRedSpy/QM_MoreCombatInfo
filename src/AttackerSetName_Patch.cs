using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoreCombatInfo
{
    [HarmonyPatch(typeof(Player), nameof(Player.ProcessMeleeAttackOnEnemy))]
    [HarmonyPatch(typeof(Monster), nameof(Monster.ProcessMeleeAttackOnEnemy))]
    public static class AttackerSetName_Patch
    {
        public static void Prefix(Creature __instance, Creature enemy)
        {
            HitLogUtils.SetCombatants(__instance, enemy);
        }
    }
}
