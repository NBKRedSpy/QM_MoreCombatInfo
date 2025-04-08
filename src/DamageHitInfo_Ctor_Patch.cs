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

namespace MoreCombatInfo
{
    [HarmonyPatch(typeof(DamageHitInfo), MethodType.Constructor,
        new Type[] {
            typeof(int),
            typeof(float),
            typeof(MGSC.DmgInfo),
            typeof(float),
            typeof(float),
            typeof(int),
            typeof(bool),
            typeof(bool),
            typeof(float)
        })]
    public static class DamageHitInfo_Ctor_Patch
    {
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            List<CodeInstruction> original = instructions.ToList();


            //The DamageHitInfo constructor has the roll used for the to hit check.
            //The DamageHitInfo object is created with the CalculateHitInfo function, 
            //  so the LastHitRoll is set so it is available upon return.

            List<CodeInstruction> result = new CodeMatcher(original)
                .MatchStartForward(
                    new CodeMatch(OpCodes.Ldc_I4_1),
                    new CodeMatch(OpCodes.Stfld, AccessTools.Field(typeof(MGSC.DamageHitInfo), nameof(MGSC.DamageHitInfo.wasCrit))),
                    new CodeMatch(OpCodes.Ldarg_0),
                    new CodeMatch(OpCodes.Ldloc_2),
                    CodeMatch.LoadsArgument(false, "accuracy"),
                    new CodeMatch(OpCodes.Ble_Un_S)
                )
                .ThrowIfNotMatch("Did not find the wasCrit section.")
                //This could be anywhere after the roll occurs, but like the match above.
                .Advance(-1)
                .Insert(
                    CodeInstruction.LoadLocal(2),  //Load the roll
                    CodeInstruction.StoreField(typeof(HitLogUtils), nameof(HitLogUtils.LastHitRoll))
                )
                .InstructionEnumeration()
                .ToList();


            return result;
        }

    }
}
