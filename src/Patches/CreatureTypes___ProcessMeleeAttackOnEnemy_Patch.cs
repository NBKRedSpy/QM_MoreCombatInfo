using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Windows;
using static MGSC.Creature;

namespace MoreCombatInfo.Patches
{
    /// <summary>
    /// This is specific to melee attacks.  Handles pre-creating the combat log message to be able to rearrange
    /// messages later.  The post psfix 
    /// </summary>
    [HarmonyPatch]
    public static class CreatureTypes___ProcessMeleeAttackOnEnemy_Patch
    {
        private static MeleeAttackLogUtility AttackProcessor { get; set; } = new MeleeAttackLogUtility();


        static IEnumerable<MethodBase> TargetMethods()
        {
            //Harmony Tool NOTE: Multiple targets. Player.ProcessMeleeAttackOnEnemy and Monster.ProcessMeleeAttackOnEnemy

            yield return AccessTools.Method(typeof(Player), nameof(Player.ProcessMeleeAttackOnEnemy),
                new Type[] { typeof(Creature), typeof(DamageHitInfo).MakeByRefType(), typeof(MeleeAttackInput), typeof(BasePickupItem) });

            yield return AccessTools.Method(typeof(Monster), nameof(Monster.ProcessMeleeAttackOnEnemy),
                new Type[] { typeof(Creature), typeof(DamageHitInfo).MakeByRefType(), typeof(MeleeAttackInput), typeof(BasePickupItem) });
        }

        public static void Prefix(Creature __instance, DamageHitInfo dmgHit, Creature enemy)
        {
            AttackProcessor.MessageLogEntry = null;
            if (HitLogUtils.CreateAttackerHeader(__instance, enemy))
            {
                AttackProcessor.MessageLogEntry = HitLogUtils.PreCreateMessageLogEntry();
            }
        }

        public static void Postfix(Creature __instance, DamageHitInfo dmgHit, Creature enemy)
        {
            if (AttackProcessor.MessageLogEntry == null) return;
            AttackProcessor.SetAttackInfo(__instance, dmgHit, enemy);
        }
    }
}
