using AsmResolver.DotNet.Code.Cil;
using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using static HarmonyLib.Code;
using Random = UnityEngine.Random;

namespace MoreCombatInfo.Patches
{
    /// <summary>
    /// The anonymous function in the MGSC.HitResolveSystem.ProcessCreatureAccuracy method's ForEach() call.
    /// Gets the accuracy and roll for the ProcessCreatureAccuracy function.  This is for the ranged attacks.
    /// </summary>
    [HarmonyPatch("MGSC.HitResolveSystem+<>c", "<ProcessCreatureAccuracy>b__9_0")]
    public class HitResolveSystem_ProcessCreatureAccuracy_Anon_Patch
    {

        /// <summary>
        /// The local storage for the transpile's roll
        /// </summary>
        public static float Roll = 0f;

        /// <summary>
        /// The local storage for the transpile's roll
        /// </summary>
        public static float Accuracy = 0f;

        public static void ResetRoll()
        {
            Roll = 0f;
            Accuracy = 0f;
        }


        public static void SetRolls(float roll, float accuracy)
        {
            Roll = roll;
            Accuracy = accuracy;    
        }


        /// <summary>
        /// Gets the hit roll and the accuracy from the anonymous ProcessCreatureAccuracy function.
        /// </summary>
        /// <param name="instructions"></param>
        /// <returns></returns>
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {

            //Goal:  Find the roll and accuracy values in the anonymous function and call the local SetRolls function.
            //float num = Mathf.Clamp(reference.Accuracy - hitEvent.TargetDodge, Data.Global.MinHitChance, Data.Global.CapAccuracy);
            //float num2 = Random.Range(0f, 1f);

            //IL is:
            //	IL_00c6: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
            //	IL_00cb: stloc.3
            //	// 	float num2 = Random.Range(0f, 1f);
            //	IL_00cc: ldc.r4 0.0
            //	IL_00d1: ldc.r4 1
            //	IL_00d6: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
            //	IL_00db: stloc.s 4


            List<CodeInstruction> original = instructions.ToList();

            //Utils.LogIL(original, @"C:/work/s.il");

            List<CodeInstruction> result = new CodeMatcher(original)
                //	IL_00c6: call float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp(float32, float32, float32)
                //	IL_00cb: stloc.3
                //	// 	float num2 = Random.Range(0f, 1f);
                //	IL_00cc: ldc.r4 0.0
                //	IL_00d1: ldc.r4 1
                //	IL_00d6: call float32 [UnityEngine.CoreModule]UnityEngine.Random::Range(float32, float32)
                //	IL_00db: stloc.s 4

                //.Advance(1) //Start at the beginning of the method.
                            //.ThrowIfNotMatchForward(
                            //    "Did not find accuracy and roll computation block",
                            //    CodeMatch.Calls(() => Mathf.Clamp(0f,0f, 0f)),
                            //    new CodeMatch(OpCodes.Stloc_S, 3), //This is the local variable for the accuracy.
                            //    new CodeMatch(OpCodes.Ldc_R4, 0f), //This is the first argument to the Random.Range call.
                            //    new CodeMatch(OpCodes.Ldc_R4, 1f), //This is the second argument to the Random.Range call.
                            //    CodeMatch.Calls(() => Random.Range(0f, 1f)),
                            //    new CodeMatch(OpCodes.Stloc_S, 4) //This is the local variable for the roll.
                            //)


                .MatchEndForward(
                    CodeMatch.Calls(() => Mathf.Clamp(0f,0f,0f)),
                    new CodeMatch(OpCodes.Stloc_3), //This is the local variable for the accuracy.
                    new CodeMatch(OpCodes.Ldc_R4), //This is the first argument to the Random.Range call.
                    new CodeMatch(OpCodes.Ldc_R4), //This is the second argument to the Random.Range call.
                    CodeMatch.Calls(() => Random.Range(0f,0f)),
                    //new CodeMatch(OpCodes.Call),
                    new CodeMatch(OpCodes.Stloc_S) //This is the local variable for the roll.
                )
                .ThrowIfNotMatch("Did not find accuracy and roll computation block")
                .Advance(1) //Advance past the stloc_s 4 instruction.
                .InsertAndAdvance(
                    new CodeInstruction(OpCodes.Ldloc_S, 4), //Load the roll value.
                    new CodeInstruction(OpCodes.Ldloc_S, 3), //Load the accuracy value.
                    CodeInstruction.Call (() => SetRolls(0f, 0f)) //Call the SetRolls method with the roll and accuracy values.
                )

                //Store the accuracy and roll values in the local variables.
                .InstructionEnumeration()
                .ToList();

            return result;
        }

        public static void Postfix(int entity, ref HitEvent hitEvent)
        {

            //Note - Currently this is completely contained, so there is no need to ignore MGSC.DamageHitInfo.ctor rolls
            //Ranged info execution order:
            //  MGSC.HitResolveSystem.ProcessCreatureAccuracy() anonymous function:  HitResolveSystem.<ProcessCreatureAccuracy>b__9_0
            //      Transpile
            //          - Reset the roll and accuracy values in case of early exit.
            //          - roll = num2 
            //          - accuracy = num
            //          
            //      Postfix:
            //          attacker => _cacheCreatures.GetCreature(hitEvent.OwnerUid); //This is below as well.
            //          target => Creature creature = _cacheCreatures.GetCreature(reference2.CreatureUid);
            //          wasMiss = hitEvent.WasMiss = num2 > num;
            //          dodge = hitEvent.TargetDodge 
            //          autoHit = false - currently never set.  will be false.
            //          Create hit log
            //          Reset the Attack info?  Maybe the hit log should do this...

            try
            {
                
                if (!HitResolveSystem._cacheEntities.IsAlive(hitEvent.ProjEntityId)) return;


                //DEBUG:  Add the transpile part.
                AttackData data = new AttackData();

                ref CollisionWithCreature collision = ref HitResolveSystem._cacheEntities.GetRef<CollisionWithCreature>(entity);
                data.Target =  HitResolveSystem._cacheCreatures.GetCreature(collision.CreatureUid);
                data.Attacker = HitResolveSystem._cacheCreatures.GetCreature(hitEvent.OwnerUid);

                data.WasMiss = hitEvent.WasMiss;
                data.Dodge = hitEvent.TargetDodge;
                data.IsAutoHit = false;
                data.Accuracy = HitResolveSystem_ProcessCreatureAccuracy_Anon_Patch.Accuracy;
                data.HitRoll = HitResolveSystem_ProcessCreatureAccuracy_Anon_Patch.Roll;

                //Roll and Accuracy was set by the transpile patch in this class.
                HitLogUtils.CreateHitLog(data);
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex);
            }


        }
    }
}
