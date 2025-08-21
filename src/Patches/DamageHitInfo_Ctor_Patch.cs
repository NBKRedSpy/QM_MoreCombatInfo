using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;
using UnityEngine;

namespace MoreCombatInfo.Patches
{
    [HarmonyPatch(typeof(DamageHitInfo), MethodType.Constructor,
        new Type[] {
            typeof(int),
            typeof(float),
            typeof(DmgInfo),
            typeof(float),
            typeof(float),
            typeof(int),
            typeof(int),
            typeof(float),
            typeof(bool),
            typeof(bool),
            typeof(float),
            typeof(bool),

        })]
    public static class DamageHitInfo_Ctor_Patch
    {
        /// <summary>
        /// Handles the melee accuracy and hit roll only.  
        /// While the range attack also calls this function (DamageHitInfo.ctor) to compute damage, it has its own roll logic.
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            List<CodeInstruction> original = instructions.ToList();

            //The DamageHitInfo constructor has the roll used for the to hit check.
            //The DamageHitInfo object is created with the CalculateHitInfo function, 
            //  so the LastHitRoll is set so it is available upon return.

            //Simplified.  Store last roll after it is generated.

            //Target match:
            //IL_005d: ldc.r4 0.0
            //IL_0062: ldc.r4 1
            //IL_0067: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
            //IL_006c: stloc.2


            List<CodeInstruction> result = new CodeMatcher(original)
                .MatchEndForward(
                    new CodeMatch(OpCodes.Ldc_R4, 0f),
                    new CodeMatch(OpCodes.Ldc_R4, 1f),
                    CodeMatch.Calls(() => UnityEngine.Random.Range(0f, 0f)),
                    new CodeMatch(OpCodes.Stloc_2)      //This is what finds the second 0,0 random, which is the attack roll.
                )
                .ThrowIfNotMatch("Did not find the to hit roll.")
                .Advance(1)
                .Insert(
                    //Get the needed values.  Loading the accuraccy and autoHit since this is an easy place to get it.
                    CodeInstruction.LoadLocal(2),  //Load the roll
                    CodeInstruction.LoadArgument(4), //Load the accuracy argument
                    CodeInstruction.LoadArgument(10), //Load autoHit argument
                    CodeInstruction.Call(() => HitLogUtils.SetHitRoll(default, default, default))
                )
                .InstructionEnumeration()
                .ToList();


            return result;
        }

    }
}
