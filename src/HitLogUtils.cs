using MGSC;
using System;

namespace MoreCombatInfo
{
    public static class HitLogUtils
    {
        /// <summary>
        /// The last random roll
        /// </summary>
        public static float LastHitRoll = 0f;


        /// <summary>
        /// If true, will invert the roll.  Ex: To Hit of 10 requires a roll of 10 or higher.
        /// </summary>
        public static bool InvertToHit = true;

        /// <summary>
        /// The current and previous attacker name.
        /// </summary>
        public static HistoricalInfo<string> Attacker = new HistoricalInfo<string>();



        /// <summary>
        /// The current and previous round number.  Used to put down a new attacker header.
        /// </summary>
        public static HistoricalInfo<int> RoundNumber = new HistoricalInfo<int>();

        /// <summary>
        /// Sets the name of the current attacker for the hit log system.
        /// This sets the attacker to null both the attacker and target are not seen by the player.
        /// This is how the game handles it.
        /// </summary>
        /// <param name="attacker"></param>
        public static void SetCombatants(Creature attacker, Creature target)
        {
            //Game checks for seen.  Also want to see attacks on player from unseen.
            //  Otherwise only the first hit will be logged and not all the shots.
            //Mono doesn't seem to like target?.IsSeenByPlayer.
            if (target is Player ||  attacker.IsSeenByPlayer || ( target != null  && target.IsSeenByPlayer))
            {

                //Set the name of the attacker from the shoot action.
                Attacker.Current = GetAttackerName(attacker);
            }
            else
            {
                Attacker.Current = null;
            }
        }

        private static string GetAttackerName(Creature creature)
        {
            string uniqueId = creature is Player ? "" : " " + creature.CreatureData.UniqueId;
            CombatLogCreatureInfo result = CombatLogSystem.GetCreatureInfo(creature);
            return
                "----------- ".WrapInColor(Colors.LightRed) +
                $"{result.Localize()} {uniqueId}".WrapInColor(Colors.Green);
                
        }

        public static void CreateHitLog(DamageHitInfo info, float accuracy, float baseDodge)
        {
            //Unfortunately, the info.damageDealer?.name is always set after a call to the game's CalculateHitInfo

            RaidMetadata raidMetadata = Plugin.State.Get<RaidMetadata>();
            CombatLog combatLog = Plugin.State.Get<CombatLog>();

            if(Attacker.Current == null)
            {
                //Will only be if both combatants cannot be seen.
                Attacker.Previous = Attacker.Current;
                return;
            }

            bool roundHasChanged = raidMetadata.TurnNumber != RoundNumber.Current;

            RoundNumber.Current = raidMetadata.TurnNumber;

            if (roundHasChanged || Attacker.Current != Attacker.Previous)
            {
                Attacker.Previous = Attacker.Current;

                //TEMP: The future version of the game will allow restoring user types from saves.
#if true
                MessageLogEntry attackerMessage = new MessageLogEntry()
                {
                    Color = Colors.LightRed,
                    MessageTag = Attacker.Current
                };
#else
                NoLocalizationMessage attackerMessage = new NoLocalizationMessage()
                {
                    Color = Colors.LightRed,
                    Message = Attacker.Current
                };
#endif
                CombatLogSystem.AddEntry(raidMetadata, combatLog, attackerMessage);

            }

            string hitString = info.wasMiss ? "Miss".WrapInColor(Colors.LightRed) : "Hit";
            hitString = "[".WrapInColor(Colors.Yellow) + hitString + "]".WrapInColor(Colors.Yellow);

            //Invert the "accuracy" number so users get a familiar To Hit representation.
            int toHit = (int)((InvertToHitValue(accuracy)) * 100f);
            int invertedRoll = (int)((InvertToHitValue(LastHitRoll)) * 100);

            string message = $"{hitString} " +
                $"To Hit: {toHit} Roll: {invertedRoll} " +
                $"Dodge: {baseDodge * 100:N0}";

#if true

            MessageLogEntry entry = new MessageLogEntry()
            {
                Color = Colors.Yellow,
                MessageTag = message
            };
#else
            NoLocalizationMessage entry = new NoLocalizationMessage()
            {
                Color = Colors.LightRed,
                Message = message
            };
#endif

            CombatLogSystem.AddEntry(raidMetadata, combatLog, entry);
        }

        private static float InvertToHitValue(float value)
        {
            return InvertToHit ? (1f - value) : value;  
        }
    }
}
