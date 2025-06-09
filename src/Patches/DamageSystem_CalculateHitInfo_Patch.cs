using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;

namespace MoreCombatInfo.Patches
{

    [HarmonyPatch(typeof(DamageSystem), nameof(DamageSystem.CalculateHitInfo))]
    public static class DamageSystem_CalculateHitInfo_Patch
    {
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {


            //Note - choosing to do a transpiler because I think this area may change, and really we only
            //  care about the very last part.


            //The CalculateHitInfo method has the basic accuracy and dodge calculations.
            //It creates a DamageHitInfo, which handles to hit calculations, including
            //the random number (roll) that was used for an attack.

            //Goal:  Call the Plugin.CreateHitLog(DamageHitInfo info, float accuracy, float baseDodge)
            //IL_0097: ldarg.s autoCrit
            //IL_0099: ldarg.s autoHit
            //IL_009b: ldarg.s critDamageBonus
            //IL_009d: newobj instance void MGSC.DamageHitInfo::.ctor(int32, float32, valuetype MGSC.DmgInfo, float32, float32, int32, bool, bool, float32)
            // +++  dup //Put another dupe of the new object on the stack for later use.
            //IL_00a2: dup
            //   IL_00a3: ldloc.s 8
            //IL_00a5: stfld float32 MGSC.DamageHitInfo::woundChance
            //   Target function call is:
            //   public static void CreateHitLog(DamageHitInfo info, float accuracy, float baseDodge)
            //   DamageHitInfo already on stack from dupe
            //
            //+++ ldloc.s 4   //computed accuracy
            //+++   ldarg.2     //base Dodge.
            //+++  call //Call the plugin function.
            //  Stack will still contain the original new DamageHitInfo object.
            //IL_00aa: ret


            List<CodeInstruction> original = instructions.ToList();

            List<CodeInstruction> result = new CodeMatcher(original)
                .MatchEndForward(
                    //IL_0097: ldarg.s autoCrit
                    //IL_0099: ldarg.s autoHit
                    //IL_009b: ldarg.s critDamageBonus
                    CodeMatch.LoadsArgument(false, "autoCrit"),
                    CodeMatch.LoadsArgument(false, "autoHit"),
                    CodeMatch.LoadsArgument(false, "critDamageBonus"),
                    new CodeMatch(OpCodes.Newobj, AccessTools.Constructor(typeof(MGSC.DamageHitInfo), new Type[]
                    {
                        typeof(int),
                        typeof(float),
                        typeof(MGSC.DmgInfo),
                        typeof(float),
                        typeof(float),
                        typeof(int),
                        typeof(bool),
                        typeof(bool),
                        typeof(float)
                    }
                    )),
                    new CodeMatch(OpCodes.Dup)
                )
                .ThrowIfNotMatch("Did not find accuracy computation block")
                //Add another dup of the new object for later use.
                .Advance(1)
                .InsertAndAdvance(new CodeInstruction(OpCodes.Dup))
                .MatchEndForward(

                    //IL_00a3: ldloc.s 8
                    //IL_00a5: stfld float32 MGSC.DamageHitInfo::woundChance
                    Utils.MatchVariable(OpCodes.Ldloc_S, 8, typeof(float)),
                    CodeMatch.StoresField(AccessTools.DeclaredField(typeof(MGSC.DamageHitInfo), nameof(MGSC.DamageHitInfo.woundChance)))
                )
                .Advance(1)
                .ThrowIfNotMatch("didn't find wound property set")
                .InsertAndAdvance(
                    //DamageHitInfo on stack from inserted dup earlier.
                    CodeInstruction.LoadLocal(4), //computed accuracy
                    new CodeInstruction(OpCodes.Ldarg_2),  //base Dodge.
                    CodeInstruction.Call(() => HitLogUtils.CreateHitLog(default, default, default))
                )
                .MatchEndForward(
                    new CodeMatch(OpCodes.Ret)
                )
                .ThrowIfNotMatch("didn't find return")
                .InstructionEnumeration()
                .ToList();

            return result;
        }
    }
}
