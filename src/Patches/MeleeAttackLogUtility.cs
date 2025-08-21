using MGSC;
using System.Collections.Generic;
using System.Linq;

namespace MoreCombatInfo.Patches
{
    /// <summary>
    /// Handles creating the hit log for melee attacks.
    /// Primarily as a central store data from multiple melee patches that extract data,
    /// and reorders the hit log for melee attacks to make sense.
    /// </summary>
    internal class MeleeAttackLogUtility
    {

        /// <summary>
        /// The pre-created Message log entry. This is needed to re-order the ToHit entries
        /// and the game's normal damage entry so the ToHit is always before the damage and wounds.
        /// 
        /// </summary>
        public MessageLogEntry MessageLogEntry = null;

        /// <summary>
        /// This handles the melee attack on an enemy.  Oddly the melee attacks still uses the old DamageHitInfo rolls, 
        /// while ranged has its own roll logic.  Ranged attacks still use will still call this to compute damage, but will always set autohit to true.
        /// Expects part of the data to be set by the DamageHitInfo.ctor patch.
        /// </summary>
        /// <param name="__instance"></param>
        /// <param name="dmgHit"></param>
        /// <param name="enemy"></param>
        /// 
        public void SetAttackInfo(Creature __instance, DamageHitInfo dmgHit, Creature enemy)
        {
            //Debug
            Creature creature = __instance as Creature;

            //!!! ============ Overview for Melee attacks logic
            //  One of the Creature.ProcessMeleeAttackOnEnemy functions are called.  It adds a temporary MeleeAttackLogEntry
            //      A Monster/Creature ProcessMeleeAttackOnEnemy method is called by the Player and Monster classes.
            //      Calls MGSC.DamageSystem.CalculateHitInfo, which returns DamageHitInfo (dmgHit).
            //          Calls DamageHitInfo.ctor, which creates the hit information.
            //          - Transpile patch.  - Gets the accuracy, dodge, and hit roll, and IsAutoHit.
            //  Monster/Creature Postfix runs.
            //      Adds a new To Hit entry
            //      --This has a function to make sure the game's "hit" entry is always after this mod's new Melee To Hit message.
            //          Uses the temporary MeleeAttackLogEntry from earlier.
            //  The original Creature.ProcessMeleeAttackOnEnemy and if was a hit, fills in the temporary MeleeAttackLogEntry.  Otherwise
            //      it removes it from the message collection.  This is the Begin* and End* methods in the CombatLogSystem class.


            //==== Some data is filled from other patches as they only exist in local variables.
            //part of the data needed for the combat log comes from other patches:
            //  accuracy = DamageHitInfo.ctor
            //  hitRoll = DamageHitInfo.ctor
            //  autohit = DamageHitInfo.ctor

            AttackData attackData = HitLogUtils.AttackData;
            attackData.Attacker =  creature;
            attackData.Target = enemy;
            attackData.WasMiss = dmgHit.wasMiss;
            attackData.Dodge = enemy?.CreatureData.GetDodge() ?? 0f;    //COPY: Same invoke as what MGSC.DamageSystem.CalculateHitInfo does to get the dodge value.

            CombatLog combatLog = Plugin.State.Get<CombatLog>();

            HitLogUtils.CreateHitLog(attackData, MessageLogEntry);

            //On hit, the game will have put in a damage message log.  
            //This will be moved below the to-hit message to make more sense to the user.
            if (!attackData.WasMiss) ReorderMeleeAttackMessage(combatLog);

            HitLogUtils.AttackData = new AttackData();
        }

        /// <summary>
        /// Moves the game's "melee hit" info to be after the to-hit message.
        /// Otherwise, the to-hit is after the "hit" message and after all the wounds, which is confusing.
        /// </summary>
        /// <param name="combatLog"></param>
        private void ReorderMeleeAttackMessage(CombatLog combatLog)
        {
            List<CombatLogEntry> logEntries = combatLog.Values;

            //The game's last "X hit Y with Z doing AA damage" melee hit message.
            MeleeAttackLogEntry meleeAttackLogEntry = logEntries.LastOrDefault(x => x is MeleeAttackLogEntry) as MeleeAttackLogEntry;

            if (meleeAttackLogEntry != null)
            {
                logEntries.Remove(meleeAttackLogEntry);
                int messageEntryIndex = logEntries.IndexOf(MessageLogEntry);

                //NOTE - Due to how hits, damage,and wounds messages are processed, there may be several entries
                //  after this mod's "To hit" entry.  So only the games "hit" message needs to be moved down to 
                //  be in a valid order.

                //Check if the to-hit happens to be at the end of the allocated collection.
                if (messageEntryIndex == logEntries.Count - 1)
                {
                    logEntries.Add(meleeAttackLogEntry);
                }
                else
                {
                    logEntries.Insert(messageEntryIndex + 1, meleeAttackLogEntry);
                }

            }
        }
    }

}
