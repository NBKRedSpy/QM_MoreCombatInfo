using AsmResolver.DotNet.Code.Cil;
using HarmonyLib;
using MGSC;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using TranspileUtilities;
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

            List<CodeInstruction> original = instructions.ToList();
            StackVariableInstruction toHitRollLocal = null;
            StackVariableInstruction toHitLocal = null;


            //Utils.LogIL(original, @"C:/work/s.il");

            List<CodeInstruction> result = new CodeMatcher(original)
                //  hitEvent.WasMiss = num2 > num;
                //  IL_00f4: ldarg.2
                //  IL_00f5: ldloc.s 5
                //  IL_00f7: ldloc.s 6
                //  IL_00f9: cgt
                //  IL_00fb: stfld bool MGSC.HitEvent::WasMiss
                //// Creature creature2 = _cacheCreatures.GetCreature(hitEvent.OwnerUid);
                //  IL_0100: ldsfld class MGSC.Creatures MGSC.HitResolveSystem::_cacheCreatures
                .MatchEndForward(
                    new CodeMatch(OpCodes.Ldarg_2),
                    new CodeMatch( x => StackVariableInstruction.Create(false, x, out toHitRollLocal)),
                    new CodeMatch(x => StackVariableInstruction.Create(false, x, out toHitLocal)),
                    new CodeMatch(OpCodes.Cgt),
                    new CodeMatch(OpCodes.Stfld, AccessTools.Field(typeof(HitEvent), "WasMiss")),
                    new CodeMatch(OpCodes.Ldsfld, AccessTools.Field(typeof(HitResolveSystem), "_cacheCreatures"))
                )
                .ThrowIfNotMatch("Did not find miss evaluation block (WasMiss assignment).")
                // Insert before ldsfld _cacheCreatures: SetRolls(num2, num)
                .InsertAndAdvance(
                    toHitRollLocal.Load,
                    toHitLocal.Load,
                    CodeInstruction.Call(() => SetRolls(0f, 0f))
                )
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
                data.Target = HitResolveSystem._cacheCreatures.GetCreature(collision.CreatureUid);
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
